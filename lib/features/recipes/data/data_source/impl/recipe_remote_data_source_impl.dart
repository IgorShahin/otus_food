import 'package:injectable/injectable.dart';
import 'package:otus_food/core/constants/http_endpoints.dart';
import 'package:otus_food/core/services/http/models/http_request.dart';
import 'package:otus_food/core/services/http/service/intf/http_service.dart';
import 'package:otus_food/features/recipes/data/data_source/intf/recipe_remote_data_source.dart';
import 'package:otus_food/features/recipes/data/model/recipe_model.dart';

@Singleton(as: RecipeRemoteDataSource)
class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final HttpService _httpService;

  RecipeRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<RecipeModel>> getRecipes() async {
    final response = await _httpService.makeRequest(
      request: const GetRequest(url: HttpEndpoints.recipe),
    );
    final data = response.data as List<dynamic>;
    return data
        .map((json) => RecipeModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
