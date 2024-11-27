import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/context_extension.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2),
            topRight: Radius.circular(2),
          ),
        ),
        child: TextField(
          maxLines: keyboardType == TextInputType.multiline ? 7 : 1,
          minLines: keyboardType == TextInputType.multiline ? 7 : 1,
          scrollPhysics: keyboardType == TextInputType.multiline
              ? const BouncingScrollPhysics()
              : null,
          keyboardType: keyboardType,
          cursorColor: context.colors.mainColor,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              color: context.colors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            filled: true,
            focusColor: context.colors.mainColor,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.mainColor,
                width: 2,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.mainColor,
                width: 2,
              ),
            ),
          ),
        ),
      );
}
