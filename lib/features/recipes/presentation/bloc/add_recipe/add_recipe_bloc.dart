import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/core/utils/custom_status.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';

part 'add_recipe_bloc.freezed.dart';
part 'add_recipe_event.dart';
part 'add_recipe_state.dart';

class AddRecipeBloc extends Bloc<AddRecipeEvent, AddRecipeState> {
  AddRecipeBloc() : super(const AddRecipeState(status: initialStatus)) {

  }
}
