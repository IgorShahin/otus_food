import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_dimen.dart';

class AppStyles {
  // ---------------------------------------------------------------------------

  static AppStyleSizeFamily? _s10;

  static AppStyleSizeFamily get s10 =>
      _s10 ?? (_s10 = AppStyleSizeFamily(AppDimen.textSizeXSmall, 1));

  static AppStyleSizeFamily? _s11;

  static AppStyleSizeFamily get s11 =>
      _s11 ?? (_s11 = AppStyleSizeFamily(11, 1.2));

  static AppStyleSizeFamily? _s12;

  static AppStyleSizeFamily get s12 =>
      _s12 ?? (_s12 = AppStyleSizeFamily(AppDimen.textSizeSmall, 1.2));

  static AppStyleSizeFamily? _s14;

  static AppStyleSizeFamily get s14 =>
      _s14 ?? (_s14 = AppStyleSizeFamily(AppDimen.textSizeRegular, 1.2));

  static AppStyleSizeFamily? _s16;

  static AppStyleSizeFamily get s16 =>
      _s16 ?? (_s16 = AppStyleSizeFamily(AppDimen.textSizeTitle2, 1.2));

  static AppStyleSizeFamily? _s18;

  static AppStyleSizeFamily get s18 =>
      _s18 ?? (_s18 = AppStyleSizeFamily(AppDimen.textSizeTitle1, 1.2));

  static AppStyleSizeFamily? _s20;

  static AppStyleSizeFamily get s20 =>
      _s20 ?? (_s20 = AppStyleSizeFamily(AppDimen.textSizeHeadline1, 1.2));

  static AppStyleSizeFamily? _s21;

  static AppStyleSizeFamily get s21 =>
      _s21 ??
      (_s21 = AppStyleSizeFamily(AppDimen.textSizeHeadline1, 1,
          fontFamily: "IBMPlexSans"));

  static AppStyleSizeFamily? _s28;

  static AppStyleSizeFamily get s28 =>
      _s28 ?? (_s28 = AppStyleSizeFamily(28, 1.2));

  static AppStyleSizeFamily? _s36;

  static AppStyleSizeFamily get s36 =>
      _s36 ?? (_s36 = AppStyleSizeFamily(36, 1.2));

  static AppStyleSizeWeightFamily get headline => s20.w700;

  static AppStyleSizeWeightFamily get title1 => s18.w600;

  static AppStyleSizeWeightFamily get title2 => s16.w400;

  static AppStyleSizeWeightFamily get body => s14.w400;

  static AppStyleSizeWeightFamily get bodySmall => s12.w400;
}

// ---------------------------------------------------------------------------

class AppStyleSizeFamily {
  final double textSize;
  final double lineHeight;
  final String? fontFamily;

  AppStyleSizeFamily(this.textSize, this.lineHeight, {this.fontFamily});

  AppStyleSizeWeightFamily? _w100;
  AppStyleSizeWeightFamily? _w200;
  AppStyleSizeWeightFamily? _w300;
  AppStyleSizeWeightFamily? _w400;
  AppStyleSizeWeightFamily? _w500;
  AppStyleSizeWeightFamily? _w600;
  AppStyleSizeWeightFamily? _w700;

  AppStyleSizeWeightFamily get w100 =>
      _w100 ??
      (_w100 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w100, lineHeight, fontFamily));

  AppStyleSizeWeightFamily get w200 =>
      _w200 ??
      (_w200 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w200, lineHeight, fontFamily));

  AppStyleSizeWeightFamily get w300 =>
      _w300 ??
      (_w300 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w300, lineHeight, fontFamily));

  AppStyleSizeWeightFamily get w400 =>
      _w400 ??
      (_w400 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w400, lineHeight, fontFamily));

  AppStyleSizeWeightFamily get w500 =>
      _w500 ??
      (_w500 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w500, lineHeight, fontFamily));

  AppStyleSizeWeightFamily get w600 =>
      _w600 ??
      (_w600 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w600, lineHeight, fontFamily));

  AppStyleSizeWeightFamily get w700 =>
      _w700 ??
      (_w700 = AppStyleSizeWeightFamily(
          textSize, FontWeight.w700, lineHeight, fontFamily));
}

// ---------------------------------------------------------------------------

class AppStyleSizeWeightFamily {
  final double fontSize;
  final FontWeight fontWeight;
  final double lineHeight;
  final String? fontFamily;

  AppStyleSizeWeightFamily(
      this.fontSize, this.fontWeight, this.lineHeight, this.fontFamily);

  TextStyle? _white;

  TextStyle get white =>
      _white ??
      (_white = TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
          color: AppColors.white,
          height: lineHeight));

  TextStyle? _green;

  TextStyle get green =>
      _green ??
      (_green = TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: AppColors.green,
          fontFamily: fontFamily,
          height: lineHeight));

  TextStyle? _grey40;

  TextStyle get grey40 =>
      _grey40 ??
      (_grey40 = TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily,
          color: AppColors.grey40,
          height: lineHeight));
}

extension TextStyleExtensions on TextStyle {
  TextStyle withLineHeight(double lineHeight) => copyWith(height: lineHeight);
}
// ---------------------------------------------------------------------------
