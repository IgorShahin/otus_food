part of 'add_recipe_bloc.dart';

@freezed
class AddRecipeEvent with _$AddRecipeEvent {
  const factory AddRecipeEvent.addIngredient() = _AddIngredient;
  const factory AddRecipeEvent.addStep() = _AddStep;
}
