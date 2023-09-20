import 'dart:async';
import 'package:flutter/material.dart';
import 'app/app.dart';

void main() async {
  App.instance = const App();

  runZoned<Future<void>>(() async {
    runApp(App.instance);
  });
}
