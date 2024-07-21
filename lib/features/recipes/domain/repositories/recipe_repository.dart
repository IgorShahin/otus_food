import 'package:dartz/dartz.dart';
import 'package:otus_food/core/errors/failures/failure.dart';
import '../entities/recipe_entity.dart';

abstract interface class RecipeRepository {
  Future<Either<Failure, List<RecipeEntity>>> getRecipes();
}
