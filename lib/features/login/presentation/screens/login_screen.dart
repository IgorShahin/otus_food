import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Auth'),
        ),
      ),
    );
}
