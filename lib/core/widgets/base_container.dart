import 'package:flutter/material.dart';
import 'package:otus_food/core/constants/colors.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.appBar,
    this.backgroundColor = AppColors.scaffoldBackground,
    this.isScrollable = false,
  });

  final Widget child;
  final AppBar? appBar;
  final bool isScrollable;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: SafeArea(
          child: isScrollable
              ? SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: child,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: child,
                ),
        ),
      );
}
