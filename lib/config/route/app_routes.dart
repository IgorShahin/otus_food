import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/presentation/auth/view/auth_screen.dart';
import 'package:otus_food/presentation/recipes/view/recipe_item_screen.dart';

import '../../presentation/recipes/view/recipes_screen.dart';
import '../../presentation/root/root_screen.dart';

enum AppRoute {
  recipes(path: '/recipes'),
  recipeItem(path: '/recipeItem'),
  auth(path: '/auth');

  const AppRoute({required this.path});

  final String path;
}

final router = GoRouter(
  initialLocation: AppRoute.recipes.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.recipes.path,
              name: AppRoute.recipes.name,
              builder: (context, state) => const RecipesScreen(),
            ),
            GoRoute(
              path: AppRoute.recipeItem.path,
              name: AppRoute.recipeItem.name,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const RecipeItemScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.auth.path,
              name: AppRoute.auth.name,
              builder: (context, state) => const AuthScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
