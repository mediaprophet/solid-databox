import 'package:flutter/material.dart';
import 'package:solidui/solidui.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ReceiptsScreen extends StatefulWidget {
  const ReceiptsScreen({super.key});

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _receipts = [];

  Future<void> _captureReceipt() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _receipts.add(image);
      });
      // OCR processing would happen here, followed by Pod upload
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Receipt Captured! Pending OCR...')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SolidScaffold(
      body: _receipts.isEmpty
          ? const Center(child: Text('No receipts captured yet.'))
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _receipts.length,
              itemBuilder: (context, index) {
                return Image.file(
                  File(_receipts[index].path),
                  fit: BoxFit.cover,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _captureReceipt,
        tooltip: 'Capture Receipt',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
