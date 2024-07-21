import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food/features/recipes/domain/entities/recipe_entity.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  const factory RecipeModel({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'duration') required final int duration,
    @JsonKey(name: 'photo') required final String photoUrl,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}

extension RecipeModelX on RecipeModel {
  RecipeEntity toEntity() => RecipeEntity(
        id: id,
        name: name,
        duration: duration,
        photoUrl: photoUrl,
      );
}
