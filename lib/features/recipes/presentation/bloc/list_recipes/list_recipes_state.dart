part of 'list_recipes_bloc.dart';

@freezed
class ListRecipesState with _$ListRecipesState {
  factory ListRecipesState({
    required final NStatus status,
    required final List<RecipeEntity>? recipes,
  }) = _ListRecipesState;
}
