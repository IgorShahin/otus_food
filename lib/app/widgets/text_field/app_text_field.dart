import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../common/res/app_colors.dart';
import '../../../common/res/app_dimen.dart';
import '../../../common/res/app_styles.dart';

class AppTextField extends StatefulWidget {
  final RxString? value;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FormFieldValidator<String?>? validator;
  final VoidCallback? onFocused;
  final bool autoFocus;
  final String? hintText;
  final String? errorText;
  final EdgeInsets? margin;
  final bool required;
  final bool? obscureText;
  final int? maxLength;
  final String? label;
  final FocusNode? focusNode;
  final BorderRadius? borderRadius;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final Widget? child;
  final int? minLines;
  final int? maxLines;
  final BoxDecoration? decoration;
  final EdgeInsets? contentPadding;
  final InputCounterWidgetBuilder? buildCounter;
  final ValueChanged<String>? onTextChanged;
  final bool disabled;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextStyle? labelStyle;
  final double? labelPadding;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? icon;

  const AppTextField({
    Key? key,
    this.value,
    this.textInputAction,
    this.validator,
    this.onFocused,
    this.autoFocus = false,
    this.hintText,
    this.margin,
    this.errorText,
    this.required = false,
    this.textInputType,
    this.maxLength,
    this.label,
    this.focusNode,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputFormatters,
    this.textCapitalization,
    this.child,
    this.minLines,
    this.maxLines,
    this.decoration,
    this.contentPadding,
    this.buildCounter,
    this.onTextChanged,
    this.disabled = false,
    this.hintStyle,
    this.textAlign,
    this.style,
    this.labelStyle,
    this.labelPadding,
    this.suffix,
    this.prefixIcon,
    this.icon,
    this.borderRadius,
    this.obscureText,
  }) : super(key: key);

  @override
  AppTextFieldState createState() => AppTextFieldState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class AppTextFieldState extends State<AppTextField> {
  TextEditingController? controller;
  bool controllerChangesValue = false;

  StreamSubscription<dynamic>? valueListenSubscription;

  FocusNode? focusNode;
  String? errorText;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    errorText = widget.errorText;

    controller = TextEditingController(text: getInitialText());
    controller!.addListener(() {
      if (!controllerChangesValue) {
        controllerChangesValue = true;
        try {
          setValue(controller!.value.text);
        } finally {
          controllerChangesValue = false;
        }
      }
    });

    valueListenSubscription = widget.value?.listen((newValue) {
      if (!controllerChangesValue && controller != null) {
        setText(newValue.toString());
      }
    });
    focusNode = widget.focusNode ??
        (widget.disabled ? AlwaysDisabledFocusNode() : FocusNode());
    focusNode!.addListener(focusNodeListener);
    if (widget.autoFocus) focusNode?.requestFocus();
  }

  @override
  void dispose() {
    controller!.dispose();
    focusNode?.removeListener(focusNodeListener);
    if (widget.focusNode == null) {
      focusNode?.dispose();
      focusNode = null;
    }
    if (valueListenSubscription != null) {
      valueListenSubscription!.cancel();
      valueListenSubscription = null;
    }

    super.dispose();
  }

  void focusNodeListener() {
    if (focusNode!.hasFocus && widget.onFocused != null) widget.onFocused!();
    setState(() {
      _focused = focusNode!.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    double? height = widget.textInputType != TextInputType.multiline
        ? ((widget.maxLines ?? 1) * 18) + 18
        : null;
    return Container(
        margin: widget.margin ?? EdgeInsets.zero,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (widget.label != null)
            Container(
              margin: EdgeInsets.only(bottom: widget.labelPadding ?? 12),
              child: Text(
                widget.label!,
                style: widget.labelStyle ?? AppStyles.s14.w400.grey40,
              ),
            ),
          Stack(children: [
            Container(child: field(), height: height, margin: getMargin()),
            if (widget.required)
              Positioned(
                  right: 10,
                  top: 4,
                  child: Text(
                    "*",
                    style: AppStyles.title2.grey40
                        .copyWith(color: AppColors.warmRed),
                  ))
          ]),
          if (errorText != null)
            Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text.rich(
                  TextSpan(children: [
                    WidgetSpan(
                        child: const Icon(
                          Icons.error,
                          color: AppColors.warmRed,
                        ).marginOnly(right: 4),
                        alignment: PlaceholderAlignment.middle),
                    TextSpan(text: errorText!)
                  ]),
                  style: context.textTheme.bodyMedium!.copyWith(
                      color: AppColors.warmRed,
                      fontSize: AppDimen.textSizeSmall,
                      fontWeight: FontWeight.w500),
                )),
        ]));
  }

  getDefaultBorder() => OutlineInputBorder(
        borderSide: BorderSide(
            width: 1,
            color: errorText != null
                ? AppColors.warmRed
                : (_focused ? AppColors.green : AppColors.grey40)),
        borderRadius: getBorderRadius(),
      );

  getTextInputType() => widget.textInputType ?? TextInputType.text;

  getSuffix() => widget.suffix;

  getPrefixIcon() => widget.prefixIcon;

  getIcon() => widget.icon;

  getObscureText() => widget.obscureText ?? false;

  getBorderRadius() =>
      widget.borderRadius ?? const OutlineInputBorder().borderRadius;

  FormFieldValidator<String?>? getValidator() {
    return (value) {
      var result = widget.validator != null ? widget.validator!(value) : null;
      if (result == null && (value == null || value == "") && widget.required) {
        result = "${widget.label ?? "Поле "} обязательно для заполнения";
      }
      setState(() {
        errorText = result;
      });
      return result;
    };
  }

  void setValue(String text) {
    widget.value?.call(text);
    if (widget.onTextChanged != null) widget.onTextChanged!(text);
  }

  void setText(String? value) {
    controller!.text = value ?? "";
  }

  String? getInitialText() => widget.value?.value;

  getInputFormatters() => widget.inputFormatters;

  FormFieldValidator<String?>? _validator() => (value) {
        var validator = getValidator();
        if (validator != null) {
          String? result = validator(value);
          if (result != null) {
            setState(() {
              errorText = result;
            });
            return result;
          }
        }
        return null;
      };

  field() =>
      widget.child ??
      TextFormField(
        enabled: !widget.disabled,
        decoration: InputDecoration(
            fillColor: widget.disabled ? AppColors.grey40 : AppColors.white,
            filled: true,
            isDense: true,
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            errorMaxLines: 3,
            enabledBorder: getDefaultBorder(),
            errorStyle: const TextStyle(height: 0, color: Colors.transparent),
            border: getDefaultBorder(),
            focusedBorder: getDefaultBorder(),
            suffixIcon: getSuffix(),
            icon: getIcon(),
            prefixIcon: getPrefixIcon(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: widget.hintStyle ?? AppStyles.body.grey40,
            hintText: widget.hintText),
        buildCounter: widget.buildCounter ??
            (context,
                    {required int currentLength,
                    required int? maxLength,
                    required bool isFocused}) =>
                null,
        controller: controller,
        keyboardType: getTextInputType(),
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        focusNode: focusNode,
        textAlign: widget.textAlign ?? TextAlign.start,
        inputFormatters: getInputFormatters(),
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        minLines: widget.minLines,
        maxLines: widget.maxLines ?? 1,
        obscureText: getObscureText(),
        style: widget.style,
        validator: _validator(),
      );

  getContentPadding() =>
      widget.contentPadding ?? const EdgeInsets.only(top: 10, bottom: 10);

  getMargin() => EdgeInsets.zero;
}
