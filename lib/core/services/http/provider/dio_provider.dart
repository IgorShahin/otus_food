import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/constants/http_endpoints.dart';

@singleton
final class DioProvider {
  late final Dio _dioClient;
  final HttpClientAdapter httpClientAdapter;

  DioProvider(
    this.httpClientAdapter,
  ) {
    _dioClient = Dio(
      BaseOptions(
        baseUrl: HttpEndpoints.apiBaseUrl,
        headers: {
          'Accept': 'application/json',
          'content-type': 'application/json',
        },
        receiveTimeout: const Duration(
          seconds: 30,
        ),
        connectTimeout: const Duration(
          seconds: 30,
        ),
      ),
    )..httpClientAdapter = httpClientAdapter;
  }

  Dio get dio => _dioClient;
}
