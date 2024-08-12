import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/errors/exceptions/exception.dart';
import 'package:otus_food/core/errors/failures/failure.dart';

@Singleton()
final class ExceptionToFailureConverter {
  const ExceptionToFailureConverter();

  Future<void> logException(
    Object exception,
    StackTrace s,
  ) async {
    if (exception is AppException) {
      log('${exception.message} $s');
    } else {
      log('$exception $s');
    }
  }

  Future<Failure> convertToFailure(
    Object exception,
    StackTrace s, {
    bool needToSaveLogs = true,
  }) async {
    if (needToSaveLogs) {
      await logException(exception, s);
    }
    return convertExceptionToFailureSync(exception, s);
  }

  Failure convertExceptionToFailureSync(Object exception, StackTrace s) =>
      switch (exception) {
        ConnectionErrorException() => const NoInternetFailure(),
        HttpMethodException() => HttpMethodFailure(
            code: exception.code,
            message: exception.message,
          ),
        DioException() => _handleDioException(exception),
        Failure() => exception,
        (_) => UnknownFailure(
            error: exception,
            st: s,
          ),
      };

  static Failure _handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ServerTimeoutFailure();
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return HttpMethodFailure(code: dioException.response?.statusCode);
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
        return const ServerConnectionFailure();
      case DioExceptionType.unknown:
        return const ServerFailure();
    }
  }
}
