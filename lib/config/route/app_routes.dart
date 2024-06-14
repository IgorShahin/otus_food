import 'package:go_router/go_router.dart';
import 'package:otus_food/presentation/auth/view/auth_screen.dart';

import '../../presentation/recipes/view/recipes_screen.dart';
import '../../presentation/root/view/root_screen.dart';

enum AppRoute {
  recipes(path: '/recipes'),
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
              builder: (context, state) => const RecipesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoute.auth.path,
              builder: (context, state) => const AuthScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
