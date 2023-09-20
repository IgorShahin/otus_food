import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otus_food/common/res/app_assets.dart';
import 'package:otus_food/common/res/app_colors.dart';
import 'package:otus_food/common/res/app_dimen.dart';
import 'package:otus_food/common/widgets/app_image.dart';

import '../../res/app_styles.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackButtonClick;
  final bool showDoneButton;
  final VoidCallback? onDoneButtonClick;
  final String? doneButtonTitle;
  final Widget? doneButtonWidget;
  final Color backgroundColor;
  final List<Widget>? actions;
  late final Size _preferredSize;
  final double elevation;
  final double? toolbarHeight;
  final Widget? subChild;

  AppAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.onBackButtonClick,
    this.backgroundColor = AppColors.white,
    this.showDoneButton = false,
    this.onDoneButtonClick,
    this.doneButtonTitle,
    this.doneButtonWidget,
    this.actions,
    this.elevation = 4,
    this.toolbarHeight,
    this.subChild,
  }) : super(key: key) {
    _preferredSize = Size.fromHeight(_toolbarHeight);
  }

  double get _toolbarHeight => toolbarHeight ?? AppDimen.appAppBarHeight;

  @override
  Widget build(BuildContext context) {
    return buildAppBar(context);
  }

  @override
  Size get preferredSize => _preferredSize;

  buildBackButton(BuildContext context) => IconButton(
        visualDensity: VisualDensity.compact,
        icon: const AppImage(
          AppImages.arrowLeft,
          height: 20,
        ),
        onPressed: () {
          if (onBackButtonClick != null) {
            onBackButtonClick!();
          } else {
            if (ModalRoute.of(context)?.canPop == true) {
              Navigator.of(context).pop();
            }
          }
        },
      );

  _doneButton(BuildContext context) => (doneButtonWidget ??
      (doneButtonTitle != null
          ? TextButton(
              child: Text(
                doneButtonTitle!.toUpperCase(),
                style: context.textTheme.labelLarge,
              ),
              onPressed: () {
                if (onDoneButtonClick != null) onDoneButtonClick!();
              })
          : IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                if (onDoneButtonClick != null) onDoneButtonClick!();
              },
            )));

  Widget buildAppBar(BuildContext context) {
    return AppBar(
        elevation: elevation,
        toolbarHeight: _toolbarHeight,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.titleColor,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        backgroundColor: backgroundColor,
        titleTextStyle: AppStyles.headline.grey40,
        titleSpacing: showBackButton ? 0 : AppDimen.small,
        primary: true,
        leading: showBackButton ? buildBackButton(context) : null,
        actions: actions ?? [if (showDoneButton) _doneButton(context)]);
  }
}
