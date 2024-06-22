part of 'recipes_bloc.dart';

sealed class RecipesState extends Equatable {
  final List<RecipeData>? recipes;
  final Failure? failure;

  const RecipesState({this.recipes, this.failure});

  @override
  List<Object?> get props => [recipes, failure];
}

final class RecipesLoading extends RecipesState {}

final class RecipesLoaded extends RecipesState {
  const RecipesLoaded(List<RecipeData> recipes) : super(recipes: recipes);
}

final class RecipesError extends RecipesState {
  const RecipesError(Failure failure) : super(failure: failure);
}
