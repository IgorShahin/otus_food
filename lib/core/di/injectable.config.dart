// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:otus_food/config/router/app_navigation_service.dart' as _i1001;
import 'package:otus_food/core/di/register_modules.dart' as _i351;
import 'package:otus_food/core/errors/exceptions/exception_to_failure_converter.dart'
    as _i203;
import 'package:otus_food/core/services/http/provider/dio_provider.dart'
    as _i498;
import 'package:otus_food/core/services/http/service/impl/http_service_impl.dart'
    as _i657;
import 'package:otus_food/core/services/http/service/intf/http_service.dart'
    as _i242;
import 'package:otus_food/features/recipes/data/data_source/impl/recipe_remote_data_source_impl.dart'
    as _i552;
import 'package:otus_food/features/recipes/data/data_source/intf/recipe_remote_data_source.dart'
    as _i60;
import 'package:otus_food/features/recipes/data/repositories/recipe_repository_impl.dart'
    as _i486;
import 'package:otus_food/features/recipes/domain/repositories/recipe_repository.dart'
    as _i558;
import 'package:otus_food/features/recipes/domain/usecases/uc_get_recipes.dart'
    as _i759;
import 'package:otus_food/features/recipes/presentation/bloc/recipes_bloc.dart'
    as _i17;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.singleton<_i361.HttpClientAdapter>(
        () => registerModules.provideHttpClientAdapter());
    gh.singleton<_i203.ExceptionToFailureConverter>(
        () => const _i203.ExceptionToFailureConverter());
    gh.lazySingleton<_i1001.AppNavigationService>(
        () => _i1001.AppNavigationService());
    gh.singleton<_i498.DioProvider>(
        () => _i498.DioProvider(gh<_i361.HttpClientAdapter>()));
    gh.singleton<_i242.HttpService>(
        () => _i657.HttpServiceImpl(gh<_i498.DioProvider>()));
    gh.singleton<_i60.RecipeRemoteDataSource>(
        () => _i552.RecipeRemoteDataSourceImpl(gh<_i242.HttpService>()));
    gh.singleton<_i558.RecipeRepository>(() => _i486.RecipeRepositoryImpl(
          gh<_i60.RecipeRemoteDataSource>(),
          gh<_i203.ExceptionToFailureConverter>(),
        ));
    gh.factory<_i759.UcGetRecipes>(
        () => _i759.UcGetRecipes(gh<_i558.RecipeRepository>()));
    gh.factory<_i17.RecipesBloc>(
        () => _i17.RecipesBloc(gh<_i759.UcGetRecipes>()));
    return this;
  }
}

class _$RegisterModules extends _i351.RegisterModules {}
