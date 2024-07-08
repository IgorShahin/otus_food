import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:otus_food/data/services/api_service.dart';

import '../../core/errors/failure.dart';
import '../../domain/repositories/recipe_repositories.dart';
import '../model/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepositories {
  final ApiService _apiService;

  RecipeRepositoryImpl(this._apiService);

  @override
  Future<Either<Failure, List<RecipeModel>>> getRecipes() async {
    try {
      final response = await _apiService.getRecipes();
      if (response.response.statusCode == 200) {
        return Right(response.data);
      } else {
        return Left(ConnectionFailure(
          DioException(
            requestOptions: response.response.requestOptions,
            type: DioExceptionType.badResponse,
            error: response.response.statusMessage,
            response: response.response,
          ),
        ));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
