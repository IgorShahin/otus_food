import 'package:dartz/dartz.dart';
import 'package:otus_food/core/error/failure.dart';

import '../entities/recipe_data.dart';

abstract interface class RecipeRepositories {
  Future<Either<Failure, List<RecipeData>>> getRecipes();
}
