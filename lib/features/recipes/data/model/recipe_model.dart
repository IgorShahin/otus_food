import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/features/recipes/data/model/ingredient_model.dart';
import 'package:otus_food/features/recipes/data/model/step_recipe_model.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';

part 'recipe_model.freezed.dart';

part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'duration') required final int duration,
    @JsonKey(name: 'photo') required final String? photoUrl,
    @JsonKey(name: 'ingredients')
    required final List<IngredientModel> ingredients,
    @JsonKey(name: 'steps') required final List<StepRecipeModel> steps,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}

extension RecipeModelX on RecipeModel {
  RecipeEntity toRecipeEntity() => RecipeEntity(
        id: id,
        name: name,
        duration: duration,
        photoUrl: photoUrl,
        ingredients: ingredients.map((e) => e.toIngredientEntity()).toList(),
        steps: steps.map((e) => e.toStepRecipeEntity()).toList(),
      );
}
