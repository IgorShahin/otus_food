part of 'exception.dart';

sealed class HttpException extends AppException {
  const HttpException({
    super.message,
  });
}

final class ConnectionErrorException extends HttpException {
  const ConnectionErrorException({
    super.message,
  });
}

final class ServerErrorHttpException extends HttpException {
  const ServerErrorHttpException({
    super.message,
  });
}

class HttpMethodException extends HttpException {
  final int? code;
  final dynamic data;

  const HttpMethodException({
    super.message,
    this.code,
    this.data,
  });
}
