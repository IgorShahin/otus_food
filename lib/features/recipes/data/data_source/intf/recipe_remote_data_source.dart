import 'package:otus_food/features/recipes/data/model/recipe_model.dart';

abstract interface class RecipeRemoteDataSource {
  Future<List<RecipeModel>> getRecipes();
}