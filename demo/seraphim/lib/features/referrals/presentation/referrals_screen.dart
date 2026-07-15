import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';

class ReferralsScreen extends StatelessWidget {
  const ReferralsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SolidScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Compose Referral', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Provider Name', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Reason for Referral', border: OutlineInputBorder()), maxLines: 3),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text('Send to Solid Pod')),
          ],
        ),
      ),
    );
  }
}
