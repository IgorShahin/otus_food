import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/recipe_repository_impl.dart';
import 'data/services/api_service.dart';
import 'domain/repositories/recipe_repositories.dart';
import 'presentation/recipes/bloc/recipes_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Api
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<Dio>()));

  // Repository
  sl.registerLazySingleton<RecipeRepositories>(
      () => RecipeRepositoryImpl(sl()));

  // Bloc
  sl.registerFactory<RecipesBloc>(() => RecipesBloc(sl()));
}
