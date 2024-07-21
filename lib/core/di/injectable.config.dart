// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:otus_food/config/router/app_navigation_service.dart' as _i4;
import 'package:otus_food/core/di/register_modules.dart' as _i14;
import 'package:otus_food/core/services/http/provider/dio_provider.dart' as _i5;
import 'package:otus_food/core/services/http/service/impl/http_service_impl.dart'
    as _i7;
import 'package:otus_food/core/services/http/service/intf/http_service.dart'
    as _i6;
import 'package:otus_food/features/recipes/data/data_source/impl/recipe_remote_data_source_impl.dart'
    as _i9;
import 'package:otus_food/features/recipes/data/data_source/intf/recipe_remote_data_source.dart'
    as _i8;
import 'package:otus_food/features/recipes/data/repositories/recipe_repository_impl.dart'
    as _i11;
import 'package:otus_food/features/recipes/domain/repositories/recipe_repository.dart'
    as _i10;
import 'package:otus_food/features/recipes/domain/usecases/uc_get_recipes.dart'
    as _i12;
import 'package:otus_food/features/recipes/presentation/bloc/recipes_bloc.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.singleton<_i3.HttpClientAdapter>(
        () => registerModules.provideHttpClientAdapter());
    gh.lazySingleton<_i4.AppNavigationService>(
        () => _i4.AppNavigationService());
    gh.singleton<_i5.DioProvider>(
        () => _i5.DioProvider(gh<_i3.HttpClientAdapter>()));
    gh.singleton<_i6.HttpService>(
        () => _i7.HttpServiceImpl(gh<_i5.DioProvider>()));
    gh.singleton<_i8.RecipeRemoteDataSource>(
        () => _i9.RecipeRemoteDataSourceImpl(gh<_i6.HttpService>()));
    gh.singleton<_i10.RecipeRepository>(
        () => _i11.RecipeRepositoryImpl(gh<_i8.RecipeRemoteDataSource>()));
    gh.factory<_i12.UcGetRecipes>(
        () => _i12.UcGetRecipes(gh<_i10.RecipeRepository>()));
    gh.factory<_i13.RecipesBloc>(
        () => _i13.RecipesBloc(gh<_i12.UcGetRecipes>()));
    return this;
  }
}

class _$RegisterModules extends _i14.RegisterModules {}
