import 'package:flutter/material.dart';
import 'package:otus_food/core/extensions/colors_extension.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: false,
    extensions: const <ThemeExtension<dynamic>>[
      ColorsExtension.light,
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: "Roboto",
    useMaterial3: false,
    extensions: const <ThemeExtension<dynamic>>[
      ColorsExtension.dark,
    ],
  );
}
