import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/config/router/app_routes.dart';
import 'package:otus_food/core/di/injectable.dart';
import 'package:otus_food/features/recipes/presentation/bloc/recipes_bloc.dart';
import 'package:otus_food/features/recipes/presentation/screens/add_recipe/add_recipe_screen.dart';
import 'package:otus_food/features/recipes/presentation/screens/recipe_item_screen.dart';
import 'package:otus_food/features/recipes/presentation/screens/recipes_screen.dart';
import 'package:otus_food/features/root/presentation/screens/root_screen.dart';

import '../../features/login/presentation/screens/login_screen.dart';

@LazySingleton()
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
                  GoRoute(
                    path: AppRoutes.addRecipe.path,
                    name: AppRoutes.addRecipe.name,
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: const AddRecipeScreen(),
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
