import 'package:equatable/equatable.dart';

class RecipeData extends Equatable {
  final int? id;
  final String? name;
  final int? duration;
  final String? photoUrl;

  const RecipeData({
    required this.id,
    required this.name,
    required this.duration,
    required this.photoUrl,
  });

  RecipeData copyWith({
    int? id,
    String? name,
    int? duration,
    String? photoUrl,
  }) {
    return RecipeData(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  @override
  List<Object?> get props => [id, name, duration, photoUrl];
}
