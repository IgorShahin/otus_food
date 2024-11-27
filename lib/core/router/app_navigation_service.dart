import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/di/injectable.dart';
import 'package:otus_food/core/router/app_routes.dart';
import 'package:otus_food/features/main/presentation/screens/main_screen.dart';
import 'package:otus_food/features/recipes/presentation/bloc/list_recipes/list_recipes_bloc.dart';
import 'package:otus_food/features/recipes/presentation/screens/add_recipe/add_recipe_screen.dart';
import 'package:otus_food/features/recipes/presentation/screens/item_recipe/recipe_item_screen.dart';
import 'package:otus_food/features/recipes/presentation/screens/recipes_screen.dart';

import '../../features/login/presentation/screens/login_screen.dart';
import '../../features/recipes/domain/entities/recipe_entity.dart';

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
                MainScreen(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoutes.recipes.path,
                    name: AppRoutes.recipes.name,
                    builder: (_, __) => BlocProvider(
                      create: (_) =>
                          getIt<ListRecipesBloc>()..add(const GetRecipes()),
                      child: const RecipesScreen(),
                    ),
                  ),
                  GoRoute(
                    path: AppRoutes.recipeItem.path,
                    name: AppRoutes.recipeItem.name,
                    pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      child: RecipeItemScreen(
                        recipe: state.extra! as RecipeEntity,
                      ),
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
          GoRoute(
            path: AppRoutes.addRecipe.path,
            name: AppRoutes.addRecipe.name,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const AddRecipeScreen(),
            ),
          ),
        ],
      );
}
