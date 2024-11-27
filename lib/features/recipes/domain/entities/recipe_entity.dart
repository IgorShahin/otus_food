import 'package:equatable/equatable.dart';
import 'package:otus_food/features/recipes/domain/entities/ingredient_entity.dart';
import 'package:otus_food/features/recipes/domain/entities/step_recipe_entity.dart';

class RecipeEntity extends Equatable {
  final String id;
  final String name;
  final int duration;
  final String? photoUrl;
  final List<IngredientEntity> ingredients;
  final List<StepRecipeEntity> steps;

  const RecipeEntity({
    required this.id,
    required this.name,
    required this.duration,
    required this.photoUrl,
    required this.ingredients,
    required this.steps,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        duration,
        photoUrl,
        ingredients,
        steps,
      ];
}
