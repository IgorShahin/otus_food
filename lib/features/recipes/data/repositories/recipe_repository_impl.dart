import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/errors/failures/failure.dart';
import 'package:otus_food/features/recipes/data/data_source/intf/recipe_remote_data_source.dart';
import 'package:otus_food/features/recipes/data/model/recipe_model.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';

import '../../domain/repositories/recipe_repository.dart';

@Singleton(as: RecipeRepository)
class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource _recipeRemoteDataSource;

  RecipeRepositoryImpl(this._recipeRemoteDataSource);

  @override
  Future<Either<Failure, List<RecipeEntity>>> getRecipes() async {
    try {
      final result = await _recipeRemoteDataSource.getRecipes();
      return Right(result.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
