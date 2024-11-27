import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/features/recipes/domain/entities/step_recipe_entity.dart';

part 'step_recipe_model.freezed.dart';
part 'step_recipe_model.g.dart';

@freezed
class StepRecipeModel with _$StepRecipeModel {
  const factory StepRecipeModel({
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'content') required final String content,
    @JsonKey(name: 'duration') required final int duration,
  }) = _StepRecipeModel;

  factory StepRecipeModel.fromJson(Map<String, dynamic> json) =>
      _$StepRecipeModelFromJson(json);
}

extension StepRecipeModelX on StepRecipeModel {
  StepRecipeEntity toStepRecipeEntity() => StepRecipeEntity(
        id: id,
        content: content,
        duration: duration,
      );
}
