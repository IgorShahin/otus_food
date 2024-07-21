part 'http_exception.dart';

abstract class AppException implements Exception {
  final String? message;

  const AppException({this.message});
}

final class IncompatibleTypeException extends AppException {
  const IncompatibleTypeException({super.message});
}
