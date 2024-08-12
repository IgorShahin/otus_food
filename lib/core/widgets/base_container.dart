import 'package:flutter/material.dart';
import 'package:otus_food/core/res/app_colors.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.appBar,
    this.backgroundColor = AppColors.scaffoldBackground,
  });

  final Widget child;
  final AppBar? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: child,
          ),
        ),
      );
}
