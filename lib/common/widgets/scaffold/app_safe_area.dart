import 'package:flutter/material.dart';
import 'package:otus_food/common/res/app_colors.dart';

class AppSafeArea extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const AppSafeArea({Key? key, required this.child, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? AppColors.backgroundApp,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
