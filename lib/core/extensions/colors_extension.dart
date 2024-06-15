import 'package:flutter/material.dart';

class ColorsExtension extends ThemeExtension<ColorsExtension> {
  final Color? mainColor;
  final Color? accentColor;

  const ColorsExtension({
    required this.mainColor,
    required this.accentColor,
  });

  @override
  ThemeExtension<ColorsExtension> copyWith({
    Color? mainColor,
    Color? accentColor,
  }) {
    return ColorsExtension(
      mainColor: mainColor ?? this.mainColor,
      accentColor: accentColor ?? this.accentColor,
    );
  }

  @override
  ThemeExtension<ColorsExtension> lerp(
      covariant ThemeExtension<ColorsExtension>? other, double t) {
    if (other is! ColorsExtension) {
      return this;
    }
    return ColorsExtension(
      mainColor: Color.lerp(mainColor, other.mainColor, t),
      accentColor: Color.lerp(accentColor, other.accentColor, t),
    );
  }

  static const light = ColorsExtension(
    mainColor: Color(0xFF165932),
    accentColor: Color(0xFF2ECC71),
  );

  static const dark = ColorsExtension(
    mainColor: Color(0xFF2D490C),
    accentColor: Color(0xFF66A71A),
  );
}
