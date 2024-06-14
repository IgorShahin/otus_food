import 'package:flutter/material.dart';

import '../config/route/app_routes.dart';

class AppRoot extends StatelessWidget {
  static late AppRoot instance;

  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title : 'Otus food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
