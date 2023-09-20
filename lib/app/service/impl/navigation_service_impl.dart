import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otus_food/app/app_route.dart';
import 'package:otus_food/app/model/recipe_info.dart';
import 'package:otus_food/app/service/intf/navigation_service.dart';

class NavigationServiceImpl extends NavigationService {
  final BuildContext context;

  NavigationServiceImpl(this.context);

  @override
  Future<void> toHomePage() async {
    await navigateToRoute(AppRoute.home);
  }

  @override
  void back<T>({T? result}) {
    Get.back(result: result);
  }

  @override
  Future<T?>? navigateToRoute<T>(AppRoute route,
      {bool replace = false, bool off = false, Object? arguments}) {
    if (off) {
      return Get.offAllNamed<T>(route.name, arguments: arguments);
    } else if (replace) {
      return Get.offNamed<T>(route.name, arguments: arguments);
    } else {
      return Get.toNamed<T>(route.name, arguments: arguments);
    }
  }

  @override
  Future<void> toRecipePage(RecipeInfo recipeInfo) async {
    await navigateToRoute(AppRoute.recipe, arguments: recipeInfo);
  }
}

extension BuildContextExtensions on BuildContext {
  NavigationService get navigation => NavigationServiceImpl(this);
}
