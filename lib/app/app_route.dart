import 'package:flutter/material.dart';
import 'package:otus_food/app/pages/home/home_page.dart';
import 'package:otus_food/app/pages/recipe/recipe_page.dart';

import 'pages/register/register_page.dart';

class AppRouteData {
  final WidgetBuilder builder;

  AppRouteData(this.builder);
}

enum AppRoute {
  home,
  login,
  recipe,
}

class AppRoutes {
  static Map<AppRoute, AppRouteData> routes = {
    AppRoute.home: AppRouteData((context) => const HomePage()),
    AppRoute.login: AppRouteData((context) => const RegisterPage()),
    AppRoute.recipe: AppRouteData((context) => const RecipePage()),
  };
}
