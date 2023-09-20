import 'package:flutter/material.dart';
import 'package:otus_food/common/res/app_colors.dart';
import 'package:otus_food/common/widgets/scaffold/app_safe_area.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? body;
  final Widget? bottomNavigationBar;

  const AppScaffold(
      {Key? key, this.body, this.appBar, this.drawer, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppSafeArea(
        child: Scaffold(
      appBar: appBar,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
      backgroundColor: AppColors.backgroundApp,
    ));
  }
}
