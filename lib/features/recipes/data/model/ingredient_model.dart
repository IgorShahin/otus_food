import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/features/recipes/domain/entities/ingredient_entity.dart';

part 'ingredient_model.freezed.dart';

part 'ingredient_model.g.dart';

@freezed
class IngredientModel with _$IngredientModel {
  const factory IngredientModel({
    @JsonKey(name: 'id') required final String id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'count') required final String count,
  }) = _IngredientModel;

  factory IngredientModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientModelFromJson(json);
}

extension IngredientModelX on IngredientModel {
  IngredientEntity toIngredientEntity() => IngredientEntity(
        id: id,
        name: name,
        count: count,
      );
}
