import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/core/di/injectable.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
Future<void> configureDependencies(String environment) async {
  getIt.init(environment: environment);
}
