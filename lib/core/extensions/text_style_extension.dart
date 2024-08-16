import 'package:flutter/material.dart';
import 'package:otus_food/core/constants/colors.dart';

class AppStyle extends TextStyle {
  const AppStyle.font({
    super.fontSize,
    super.height,
    FontWeight? fontWeight,
    Color? color,
    super.decoration,
  }) : super(
    inherit: false,
    color: color ?? AppColors.black,
    fontFamily: 'ALSHaussVF',
    fontWeight: fontWeight ?? AppFontWeight.regular,
    textBaseline: TextBaseline.alphabetic,
  );
}

class AppFontWeight {
  const AppFontWeight._();

  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
}

TextStyle appFontRegular(
    double fontSize,
    double height, [
      Color? color,
      TextDecoration? decoration,
    ]) =>
    AppStyle.font(
      fontSize: fontSize,
      height: height,
      fontWeight: AppFontWeight.regular,
      color: color ?? AppColors.black,
      decoration: decoration,
    );

TextStyle appFontMedium(
    double fontSize,
    double height, [
      Color? color,
      TextDecoration? decoration,
    ]) =>
    AppStyle.font(
      fontSize: fontSize,
      height: height,
      fontWeight: AppFontWeight.medium,
      color: color ?? AppColors.black,
      decoration: decoration,
    );
