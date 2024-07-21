import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:otus_food/config/theme/app_theme.dart';

import 'config/router/app_navigation_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final GoRouter _routerConfig;

  @override
  void initState() {
    super.initState();
    _routerConfig = AppNavigationService.appNavigationServiceConfig;
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Otus food',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru'),
        ],
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        routerConfig: _routerConfig,
      );
}
