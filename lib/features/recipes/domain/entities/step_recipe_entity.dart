import 'package:equatable/equatable.dart';

class StepRecipeEntity extends Equatable {
  final String id;
  final String content;
  final int duration;

  const StepRecipeEntity({
    required this.id,
    required this.content,
    required this.duration,
  });

  @override
  List<Object?> get props => [
        id,
        content,
        duration,
      ];
}
