import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';

class FilesScreen extends StatelessWidget {
  const FilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SolidScaffold(
      body: const SolidFile(),
    );
  }
}
