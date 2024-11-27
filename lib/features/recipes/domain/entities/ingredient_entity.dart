import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  final String id;
  final String name;
  final String count;

  const IngredientEntity({
    required this.id,
    required this.name,
    required this.count,
  });

  @override
  List<Object?> get props => [id, name, count];
}
