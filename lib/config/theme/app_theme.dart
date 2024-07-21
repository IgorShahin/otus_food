import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/colors_extension.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Roboto',
    useMaterial3: false,
    // colorScheme: const ColorScheme(brightness: null, primary: null, onPrimary: null, secondary: null, onSecondary: null, error: null, onError: null, surface: null, onSurface: null),
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
}
