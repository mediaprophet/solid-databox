import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solidui/solidui.dart';
import '../application/credential_providers.dart';

class CredentialWalletScreen extends ConsumerWidget {
  const CredentialWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credentialsAsync = ref.watch(credentialsProvider);

    return SolidScaffold(
      body: credentialsAsync.when(
        data: (creds) => ListView.builder(
          itemCount: creds.length,
          itemBuilder: (context, index) {
            final cred = creds[index];
                
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: const Icon(Icons.badge, color: Colors.blue),
                title: Text(cred.type.join(', ')),
                subtitle: Text('Issuer: ${cred.issuer}'),
                trailing: IconButton(
                  icon: const Icon(Icons.qr_code),
                  tooltip: 'Present Credential',
                  onPressed: () => context.go('/evidence'),
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
