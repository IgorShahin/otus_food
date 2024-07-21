import 'package:otus_food/core/services/http/models/http_request.dart';

abstract interface class HttpService {
  Future<dynamic> makeRequest({
    required HttpRequest request,
  });
}
