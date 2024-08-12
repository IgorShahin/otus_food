import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/colors_extension.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: false,
    appBarTheme: appBarTheme(),
    extensions: const <ThemeExtension<dynamic>>[
      ColorsExtension.light,
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: false,
    extensions: const <ThemeExtension<dynamic>>[
      ColorsExtension.dark,
    ],
  );

  static AppBarTheme appBarTheme() => const AppBarTheme(
        color: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Color(0xFF165932),
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      );
}
