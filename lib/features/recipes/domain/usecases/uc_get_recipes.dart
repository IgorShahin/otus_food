import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/errors/failures/failure.dart';
import 'package:otus_food/core/usecase/usecase.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';
import 'package:otus_food/features/recipes/domain/repositories/recipe_repository.dart';

@injectable
final class UcGetRecipes implements UseCase<List<RecipeEntity>, NoParams> {
  final RecipeRepository _recipeRepository;

  const UcGetRecipes(this._recipeRepository);

  @override
  Future<Either<Failure, List<RecipeEntity>>> call(NoParams params) =>
      _recipeRepository.getRecipes();
}
