import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food/domain/repositories/recipe_repositories.dart';

import '../../../core/error/failure.dart';
import '../../../domain/entities/recipe_data.dart';

part 'recipes_event.dart';

part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipeRepositories _recipeRepositories;

  RecipesBloc(this._recipeRepositories) : super(RecipesLoading()) {
    on<GetRecipes>(onGetRecipes);
  }

  FutureOr<void> onGetRecipes(
      GetRecipes event, Emitter<RecipesState> emit) async {
    emit(RecipesLoading());
    final result = await _recipeRepositories.getRecipes();
    result.fold(
      (failure) => emit(RecipesError(failure)),
      (recipes) => emit(RecipesLoaded(recipes)),
    );
  }
}
