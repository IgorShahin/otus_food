import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final DioException? error;

  const Failure(this.error);

  @override
  List<Object?> get props => [error];
}

class ServerFailure extends Failure {
  const ServerFailure(super.error);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.error);
}
