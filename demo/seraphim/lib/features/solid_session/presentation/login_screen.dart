import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seraphim Login')),
      body: const Center(
        child: SolidLogin(
          clientId: 'https://seraphim.app/id',
          redirectUris: ['seraphim://callback'],
          child: Text('Login to Pod'),
        ),
      ),
    );
  }
}
