import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/errors/exceptions/exception.dart';
import 'package:otus_food/core/services/http/models/http_request.dart';
import 'package:otus_food/core/services/http/provider/dio_provider.dart';
import 'package:otus_food/core/services/http/service/intf/http_service.dart';

@Singleton(as: HttpService)
final class HttpServiceImpl implements HttpService {
  final DioProvider _dioProvider;

  const HttpServiceImpl(this._dioProvider);

  @override
  Future<dynamic> makeRequest({
    required HttpRequest request,
  }) async {
    late final Response response;
    try {
      final dio = _dioProvider.dio;
      final endPoint = request.url;
      final data = request.data;

      final options = request.options;

      final onReceiveProgress = request.onReceiveProgress;
      final queryParameters = request.queryParameters;

      response = await switch (request) {
        GetRequest() => dio.get(
            endPoint,
            data: data,
            options: options,
            queryParameters: queryParameters,
            onReceiveProgress: onReceiveProgress,
          ),
        PostRequest() => dio.post(
            endPoint,
            data: data,
            options: options,
            queryParameters: queryParameters,
            onReceiveProgress: onReceiveProgress,
          ),
        PatchRequest() => dio.patch(
            endPoint,
            data: data,
            options: options,
            queryParameters: queryParameters,
            onReceiveProgress: onReceiveProgress,
          ),
        PutRequest() => dio.put(
            endPoint,
            data: data,
            options: options,
            queryParameters: queryParameters,
            onReceiveProgress: onReceiveProgress,
          ),
      };

      if (response.statusCode == 200) {
        return response;
      }
      _handleResponseException(response);
    } on SocketException catch (_) {
      throw const ConnectionErrorException();
    } on FormatException catch (e) {
      throw Exception('Bad response format $e');
    } on DioException catch (e) {
      if (e.response != null) _handleResponseException(e.response!);
      rethrow;
    } catch (e) {
      log('$e');
      throw Exception('Something went wrong');
    }
  }

  Never _handleResponseException(Response response) {
    final statusCode = response.statusCode;
    final data = response.data;

    String? message;

    if (data is Map<String, dynamic>) {
      message = data['error']['message'];
    } else if (data is String && !data.contains('html')) {
      message = jsonDecode(data)['error']['message'];
    }

    if (message != null) {
      throw HttpMethodException(message: message, code: statusCode, data: data);
    } else if (statusCode == 500) {
      throw const ServerErrorHttpException();
    } else {
      throw HttpMethodException(code: statusCode, data: data);
    }
  }
}
