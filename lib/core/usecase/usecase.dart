import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:otus_food/core/errors/failures/failure.dart';

const noParams = NoParams();

abstract interface class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
