import 'package:dio/dio.dart';
import 'package:otus_food/core/constants/http_endpoints.dart';
import 'package:retrofit/retrofit.dart';

import '../model/recipe_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: HttpEndpoints.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/recipe')
  Future<HttpResponse<List<RecipeModel>>> getRecipes();
}
