import 'package:flutter/material.dart';
import 'package:otus_food/app/app_route.dart';
import 'package:otus_food/app/service/impl/navigation_service_impl.dart';
import 'package:otus_food/common/res/app_assets.dart';
import 'package:otus_food/common/res/app_colors.dart';
import 'package:otus_food/common/utils.dart';

import 'app_bottom_navigation_bar_button.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int? selectedIndex;

  const AppBottomNavigationBar({Key? key, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 6,
                spreadRadius: 0,
                offset: const Offset(0, -2))
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  AppBottomNavigationBarButton(
                      imageData: AppImages.iconPizza,
                      selected: selectedIndex == 0,
                      label: l10n.recipes,
                      onPressed: () {
                        onHomePressed(context);
                      }),
                  AppBottomNavigationBarButton(
                      imageData: AppImages.iconFridge,
                      selected: selectedIndex == 2,
                      label: l10n.recipes,
                      onPressed: () {
                        onFridgePressed(context);
                      }),
                  AppBottomNavigationBarButton(
                      imageData: AppImages.iconFavorites,
                      selected: selectedIndex == 3,
                      label: l10n.recipes,
                      onPressed: () {
                        onFavoritesPressed(context);
                      }),
                  AppBottomNavigationBarButton(
                    imageData: AppImages.iconUser,
                    selected: selectedIndex == 1,
                    label: l10n.login,
                    onPressed: () {
                      onLoginPressed(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void onHomePressed(BuildContext context) {
    // context.navigation.toHomePage();
    context.navigation.navigateToRoute(AppRoute.home);
  }

  void onFridgePressed(BuildContext context) {
    // context.navigation.toHomePage();
  }

  void onFavoritesPressed(BuildContext context) {
    // context.navigation.toHomePage();
  }

  void onLoginPressed(BuildContext context) {
    context.navigation.navigateToRoute(AppRoute.login);
  }
}
