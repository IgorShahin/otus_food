import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:otus_food/app/app_route.dart';
import 'package:otus_food/common/res/app_colors.dart';

class App extends StatelessWidget {
  static late App instance;

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru', '')],
      onGenerateRoute: (settings) {
        var routeKey = AppRoutes.routes.keys
            .firstWhereOrNull((x) => x.name == settings.name);
        if (routeKey != null) {
          var routeData = AppRoutes.routes[routeKey]!;
          return MaterialPageRoute(
            builder: routeData.builder,
            settings: settings,
          );
        } else {
          return null;
        }
      },
      initialRoute: AppRoute.home.name,
      theme: ThemeData(
        fontFamily: "Roboto",
        useMaterial3: false,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(background: AppColors.backgroundApp),
      ),
    );
  }
}
