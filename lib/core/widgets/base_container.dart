import 'package:flutter/material.dart';
import 'package:otus_food/core/res/app_colors.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    );
}
