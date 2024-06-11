import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  static late AppRoot instance;

  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Otus food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(),
    );
  }
}
