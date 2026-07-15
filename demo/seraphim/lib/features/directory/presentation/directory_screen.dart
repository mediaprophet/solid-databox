import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [
      {'name': 'Dr. Alice Smith', 'type': 'Psychologist', 'status': 'Available'},
      {'name': 'Serenity Clinic', 'type': 'Therapy Center', 'status': 'Waitlist'},
    ];

    return SolidScaffold(
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final p = providers[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.medical_services)),
              title: Text(p['name']!),
              subtitle: Text(p['type']!),
              trailing: Chip(label: Text(p['status']!)),
            ),
          );
        },
      ),
    );
  }
}
