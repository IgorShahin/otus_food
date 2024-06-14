import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otus_food/presentation/app_root.dart';

void main() async {
  AppRoot.instance = const AppRoot();

  runZoned<Future<void>>(() async {
    runApp(AppRoot.instance);
  });
}
