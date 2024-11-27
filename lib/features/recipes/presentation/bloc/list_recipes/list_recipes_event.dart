part of 'list_recipes_bloc.dart';

@freezed
class ListRecipesEvent with _$ListRecipesEvent {
  const factory ListRecipesEvent.getRecipes() = GetRecipes;
}
