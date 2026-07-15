import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solidui/solidui.dart';
import '../../credentials/application/credential_providers.dart';

class RelationshipConnectionScreen extends ConsumerStatefulWidget {
  const RelationshipConnectionScreen({super.key});

  @override
  ConsumerState<RelationshipConnectionScreen> createState() => _RelationshipConnectionScreenState();
}

class _RelationshipConnectionScreenState extends ConsumerState<RelationshipConnectionScreen> {
  final _uriController = TextEditingController();

  @override
  void dispose() {
    _uriController.dispose();
    super.dispose();
  }

  void _simulateDataTransfer(String action, String institutionUri) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Successfully executed $action with $institutionUri')),
            );
          }
        });
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text('Initiating $action protocol with databox...'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final credentialsAsync = ref.watch(credentialsProvider);

    return SolidScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Establish Databox Connection', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _uriController,
                      decoration: const InputDecoration(
                        labelText: 'Institution Databox URI',
                        hintText: 'https://bank.example/databox',
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final uri = _uriController.text;
                        if (uri.isNotEmpty) {
                          final repo = ref.read(credentialRepositoryProvider);
                          await repo.addConnection(uri);
                          ref.invalidate(credentialsProvider);
                          _uriController.clear();
                        }
                      },
                      child: const Text('Connect'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Active Institutional Connections', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: credentialsAsync.when(
              data: (creds) {
                final connections = creds.where((c) => c.isConnectionCredential).toList();
                if (connections.isEmpty) {
                  return const Center(child: Text('No active connections.'));
                }
                return ListView.builder(
                  itemCount: connections.length,
                  itemBuilder: (context, index) {
                    final conn = connections[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.account_balance, color: Colors.blue),
                        title: Text(conn.issuer),
                        subtitle: const Text('Status: Connected'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.download, color: Colors.green),
                              tooltip: 'Get Data (e.g. CDR)',
                              onPressed: () => _simulateDataTransfer('GET DATA', conn.issuer),
                            ),
                            IconButton(
                              icon: const Icon(Icons.upload, color: Colors.orange),
                              tooltip: 'Share Data',
                              onPressed: () => _simulateDataTransfer('SHARE DATA', conn.issuer),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text('Error: $err')),
            ),
          ),
        ],
      ),
    );
  }
}
