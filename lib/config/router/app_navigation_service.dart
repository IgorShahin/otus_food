import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/config/router/app_routes.dart';
import 'package:otus_food/core/di/injection_container.dart';
import 'package:otus_food/presentation/recipes/bloc/recipes_bloc.dart';
import 'package:otus_food/presentation/recipes/screens/recipes_screen.dart';
import 'package:otus_food/presentation/root/root_screen.dart';

import '../../presentation/login/screens/login_screen.dart';
import '../../presentation/recipes/screens/recipe_item_screen.dart';

class AppNavigationService {
  static final appNavigationServiceConfig =
      getIt<AppNavigationService>().config();

  GoRouter config() => GoRouter(
        initialLocation: AppRoutes.recipes.path,
        debugLogDiagnostics: true,
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                RootScreen(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.recipes.path,
                    name: AppRoutes.recipes.name,
                    builder: (_, __) => BlocProvider(
                      create: (_) => getIt<RecipesBloc>()..add(GetRecipes()),
                      child: const RecipesScreen(),
                    ),
                  ),
                  GoRoute(
                    path: AppRoutes.recipeItem.path,
                    name: AppRoutes.recipeItem.name,
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
                    path: AppRoutes.auth.path,
                    name: AppRoutes.auth.name,
                    builder: (context, state) => const LoginScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
