import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solidui/solidui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SolidScaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildCard(context, 'Files', Icons.folder, '/files'),
          _buildCard(context, 'Receipts', Icons.receipt, '/receipts'),
          _buildCard(context, 'Directory', Icons.contact_page, '/directory'),
          _buildCard(context, 'Referrals', Icons.send, '/referrals'),
          _buildCard(context, 'Corrections', Icons.edit, '/corrections'),
          _buildCard(context, 'Communications', Icons.chat, '/communications'),
          _buildCard(context, 'Cost Disclosure', Icons.attach_money, '/cost_disclosure'),
          _buildCard(context, 'Connections', Icons.people, '/relationship_connection'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/scan'),
        icon: const Icon(Icons.qr_code_scanner),
        label: const Text('Scan'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, String route) {
    return Card(
      child: InkWell(
        onTap: () => context.go(route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
