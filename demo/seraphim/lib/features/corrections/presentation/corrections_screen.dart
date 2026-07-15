import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';

class CorrectionsScreen extends StatelessWidget {
  const CorrectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SolidScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Request Record Correction', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Original Record URI', border: OutlineInputBorder())),
            const SizedBox(height: 16),
            const TextField(decoration: InputDecoration(labelText: 'Proposed Correction', border: OutlineInputBorder()), maxLines: 3),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: const Text('Submit Correction Request')),
          ],
        ),
      ),
    );
  }
}
