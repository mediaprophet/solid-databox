import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';
import 'package:go_router/go_router.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seraphim Login')),
      body: Center(
        child: SolidLogin(
          clientId: 'https://seraphim.app/id',
          redirectUris: const ['seraphim://callback'],
          child: Builder(
            builder: (context) {
              // This builder is only rendered when SolidLogin transitions to its child upon success
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  context.go('/');
                }
              });
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
