import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food/app.dart';
import 'package:otus_food/core/constants/http_endpoints.dart';
import 'package:otus_food/core/di/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init();

  await setupSentry(
    () => runApp(const App()),
  );
}

Future<void> _init() async {
  await configureDependencies(Environment.prod);
}

Future<void> setupSentry(AppRunner appRunner) async => SentryFlutter.init(
      (options) {
        options
          ..dsn = HttpEndpoints.sentryEndpoint
          ..tracesSampleRate = 1.0
          ..profilesSampleRate = 1.0
          ..reportPackages = true
          ..sendDefaultPii = true
          ..reportSilentFlutterErrors = true
          ..maxRequestBodySize = MaxRequestBodySize.small
          ..maxResponseBodySize = MaxResponseBodySize.small;
      },
      appRunner: appRunner,
    );
