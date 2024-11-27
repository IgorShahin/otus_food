part of 'add_recipe_bloc.dart';

@freezed
class AddRecipeState with _$AddRecipeState {
  const factory AddRecipeState({
    required NStatus status,
    final RecipeEntity? recipe,
  }) = _AddRecipeState;
}
