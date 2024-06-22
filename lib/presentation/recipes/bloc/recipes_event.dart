part of 'recipes_bloc.dart';

sealed class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object?> get props => [];
}

final class GetRecipes extends RecipesEvent {}
