import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:otus_food/domain/entities/recipe_data.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel extends RecipeData with EquatableMixin {
  @JsonKey(name: 'id')
  final int? recipeId;
  @JsonKey(name: 'name')
  final String? recipeName;
  @JsonKey(name: 'duration')
  final int? recipeDuration;
  @JsonKey(name: 'photo')
  final String? recipePhotoUrl;

  RecipeModel({
    required this.recipeId,
    required this.recipeName,
    required this.recipeDuration,
    required this.recipePhotoUrl,
  }) : super(
          id: recipeId,
          name: recipeName,
          duration: recipeDuration,
          photoUrl: recipePhotoUrl,
        );

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);

  @override
  List<Object?> get props =>
      [recipeId, recipeName, recipeDuration, recipePhotoUrl];
}
