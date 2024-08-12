import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/core/extensions/extensions.dart';
import 'package:otus_food/resources/assets.gen.dart';

import '../../../../core/res/app_colors.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: navigationShell,
        bottomNavigationBar: Material(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 8,
                ),
              ],
            ),
            child: BottomNavigationBar(
              selectedItemColor: context.color.accentColor,
              unselectedItemColor: AppColors.hint,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(Assets.images.iconRecipe.path),
                  activeIcon: Image.asset(
                    Assets.images.iconRecipe.path,
                    color: context.color.accentColor,
                  ),
                  label: context.l10n.recipeTitleNavigation,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(Assets.images.iconProfile.path),
                  activeIcon: Image.asset(
                    Assets.images.iconProfile.path,
                    color: context.color.accentColor,
                  ),
                  label: context.l10n.loginTitleNavigation,
                ),
              ],
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
            ),
          ),
        ),
      );
}
