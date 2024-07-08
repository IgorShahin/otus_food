import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/recipe_data.dart';

abstract interface class RecipeRepositories {
  Future<Either<Failure, List<RecipeData>>> getRecipes();
}
