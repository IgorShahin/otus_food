import 'package:flutter/material.dart';
import 'package:otus_food/core/constants/colors.dart';
import 'package:otus_food/core/extensions/colors_extension.dart';

final class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: false,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: const <ThemeExtension>[
      ColorsExtension(
        mainColor: AppColors.mainColor,
        accentColor: AppColors.accentColor,
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: AppColors.mainColor,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: const <ThemeExtension>[
      ColorsExtension(
        mainColor: AppColors.mainDarkColor,
        accentColor: AppColors.accentDarkColor,
      ),
    ],
  );
}
