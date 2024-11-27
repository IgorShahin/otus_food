import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/usecase/usecase.dart';
import 'package:otus_food/core/utils/custom_status.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';
import 'package:otus_food/features/recipes/domain/usecases/uc_get_recipes.dart';

part 'list_recipes_bloc.freezed.dart';

part 'list_recipes_event.dart';

part 'list_recipes_state.dart';

@injectable
class ListRecipesBloc extends Bloc<ListRecipesEvent, ListRecipesState> {
  final UcGetRecipes _ucGetRecipes;

  ListRecipesBloc(this._ucGetRecipes)
      : super(
          ListRecipesState(
            status: loadingStatus,
            recipes: [],
          ),
        ) {
    on<GetRecipes>(onGetRecipes);
  }

  FutureOr<void> onGetRecipes(
    GetRecipes event,
    emit,
  ) async {
    final result = await _ucGetRecipes(noParams);
    result.fold(
      (failure) => emit(state.copyWith(status: errorStatus)),
      (recipes) =>
          emit(state.copyWith(recipes: recipes, status: successStatus)),
    );
  }
}
