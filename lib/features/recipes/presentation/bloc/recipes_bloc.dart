import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/errors/failures/failure.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';
import 'package:otus_food/features/recipes/domain/usecases/uc_get_recipes.dart';

import '../../../../core/usecase/usecase.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

@injectable
class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final UcGetRecipes _ucGetRecipes;

  RecipesBloc(this._ucGetRecipes) : super(RecipesLoading()) {
    on<GetRecipes>(onGetRecipes);
  }

  FutureOr<void> onGetRecipes(
    GetRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    final result = await _ucGetRecipes(noParams);
    result.fold(
      (failure) => emit(RecipesError(failure)),
      (recipes) => emit(RecipesLoaded(recipes)),
    );
  }
}
