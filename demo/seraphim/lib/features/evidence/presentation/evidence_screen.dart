import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../credentials/application/credential_providers.dart';

class EvidenceScreen extends ConsumerWidget {
  const EvidenceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final credentialsAsync = ref.watch(credentialsProvider);

    return SolidScaffold(
      body: credentialsAsync.when(
        data: (creds) {
          if (creds.isEmpty) return const Center(child: Text('No evidence to present.'));
          
          final cred = creds.first; // Present the first credential for the POC
          final qrData = 'vp://seraphim.local/present/${cred.id}'; // Mock VP URI

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Verifiable Presentation',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                QrImageView(
                  data: qrData,
                  version: QrVersions.auto,
                  size: 250.0,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 16),
                Text('Scan to verify ${cred.issuer}'),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error loading evidence: $err')),
      ),
    );
  }
}
