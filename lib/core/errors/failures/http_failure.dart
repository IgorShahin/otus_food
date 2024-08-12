part of 'failure.dart';

class HttpFailure extends Failure {
  const HttpFailure();

  @override
  String getMessage(AppLocalizations strings) => strings.unknownServerError;

  @override
  List<Object?> get props => [];
}

class HttpMethodFailure extends HttpFailure {
  final int? code;
  final String? message;

  const HttpMethodFailure({this.code, this.message});

  bool get is400 => code != null && code! >= 400 && code! < 500;

  @override
  String getMessage(AppLocalizations strings) => message == null
      ? strings.httpMethodError(code ?? -1)
      : '[${code ?? -1}] $message';

  @override
  List<Object?> get props => [code, message];
}

class ServerFailure extends HttpFailure {
  const ServerFailure();

  @override
  String getMessage(AppLocalizations strings) => strings.serverError;
}

class ServerConnectionFailure extends HttpFailure {
  const ServerConnectionFailure();

  @override
  String getMessage(AppLocalizations strings) => strings.serverConnectionError;
}

class ServerTimeoutFailure extends HttpFailure {
  const ServerTimeoutFailure();

  @override
  String getMessage(AppLocalizations strings) => strings.connectionTimeoutError;
}

class NoInternetFailure extends HttpFailure {
  const NoInternetFailure();

  @override
  String getMessage(AppLocalizations strings) => strings.noInternetError;
}
