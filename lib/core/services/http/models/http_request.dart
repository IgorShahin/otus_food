import 'package:dio/dio.dart';

sealed class HttpRequest {
  final String url;
  final Object? data;
  final Map<String, dynamic>? queryParameters;
  final ProgressCallback? onReceiveProgress;
  final Options? options;

  const HttpRequest({
    required this.url,
    this.data,
    this.options,
    this.onReceiveProgress,
    this.queryParameters,
  });
}

final class GetRequest extends HttpRequest {
  const GetRequest({
    required super.url,
    super.data,
    super.options,
    super.onReceiveProgress,
    super.queryParameters,
  });
}

final class PostRequest extends HttpRequest {
  const PostRequest({
    required super.url,
    required super.data,
    super.options,
    super.queryParameters,
  });
}

final class PatchRequest extends HttpRequest {
  const PatchRequest({
    required super.url,
    required super.data,
    super.options,
    super.queryParameters,
  });
}

final class PutRequest extends HttpRequest {
  const PutRequest({
    required super.url,
    required super.data,
    super.options,
    super.queryParameters,
  });
}
