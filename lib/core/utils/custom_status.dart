import 'package:equatable/equatable.dart';
import 'package:otus_food/core/enums/status_enum.dart';
import 'package:otus_food/core/errors/failures/failure.dart';

const initialStatus = InitialStatus();
const loadingStatus = LoadingStatus();
const successStatus = SuccessStatus();
const errorStatus = ErrorStatus();

sealed class NStatus extends Equatable {
  const NStatus();

  T map<T>({
    required T Function() onLoading,
    required T Function() onInitial,
    required T Function() onSuccess,
    required T Function(ErrorStatus) onError,
  }) =>
      switch (this) {
        LoadingStatus() => onLoading(),
        InitialStatus() => onInitial(),
        SuccessStatus() => onSuccess(),
        ErrorStatus() => onError(this as ErrorStatus),
      };

  @override
  List<Object?> get props => [];
}

class LoadingStatus extends NStatus {
  const LoadingStatus();
}

class InitialStatus extends NStatus {
  const InitialStatus();
}

class SuccessStatus extends NStatus {
  const SuccessStatus();
}

class ErrorStatus extends NStatus {
  final Failure? failure;

  const ErrorStatus([this.failure]);

  @override
  List<Object?> get props => [failure];
}

extension NStatusX on NStatus {
  bool get isLoading => this is LoadingStatus;

  bool get isInitial => this is InitialStatus;

  bool get isSuccess => this is SuccessStatus;

  bool get isError => this is ErrorStatus;

  Failure? get failure =>
      this is ErrorStatus ? (this as ErrorStatus).failure : null;
}

extension StatusToNStatusX on Status {
  NStatus toNStatus() => switch (this) {
        Status.initial => initialStatus,
        Status.loading => loadingStatus,
        Status.success => successStatus,
        Status.error => errorStatus,
      };
}
