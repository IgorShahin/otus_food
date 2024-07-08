import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:otus_food/config/router/app_navigation_service.dart';

import '../../data/repositories/recipe_repository_impl.dart';
import '../../data/services/api_service.dart';
import '../../domain/repositories/recipe_repositories.dart';
import '../../presentation/recipes/bloc/recipes_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Api
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Repository
  getIt.registerLazySingleton<RecipeRepositories>(
      () => RecipeRepositoryImpl(getIt()));

  // Bloc
  getIt.registerFactory<RecipesBloc>(() => RecipesBloc(getIt()));

  // Services
  getIt.registerLazySingleton<AppNavigationService>(
    () => AppNavigationService(),
  );
}
