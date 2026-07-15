import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:go_router/go_router.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final MobileScannerController controller = MobileScannerController();
  bool _hasScanned = false;

  void _onDetect(BarcodeCapture capture) async {
    if (_hasScanned) return;
    
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final code = barcodes.first.rawValue;
      if (code != null) {
        setState(() {
          _hasScanned = true;
        });
        
        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()),
        );

        String resolvedData = 'Unknown Data';
        // Simulate resolving a Solid endpoint query
        if (code.startsWith('http')) {
          try {
            // Attempt to fetch the Solid endpoint directly
            // final response = await readPod(code); 
            // resolvedData = response;
            await Future.delayed(const Duration(seconds: 1)); // Mock network delay
            resolvedData = 'Solid Node Resolved:\nType: CheckInEvent\nLocation: $code';
          } catch (e) {
            resolvedData = 'Failed to read Solid Pod at: $code\nError: $e';
          }
        } else {
          resolvedData = 'Raw Data: $code';
        }

        // Pop loading dialog
        if (mounted) context.pop();

        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text('Solid Endpoint Resolved'),
                content: Text('Endpoint: $code\n\n$resolvedData\n\nSave this record to your Solid Pod?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                      context.pop(); // Go back to home
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.pop();
                      context.pop(); // Go back to home
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Record appended to your Pod!')),
                      );
                    },
                    child: const Text('Save to Pod'),
                  ),
                ],
              );
            },
          ).then((_) {
            if (mounted) {
              setState(() {
                _hasScanned = false;
              });
            }
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        actions: [
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: controller.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            onPressed: () => controller.toggleTorch(),
          ),
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: controller.cameraFacingState,
              builder: (context, state, child) {
                switch (state) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            onPressed: () => controller.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: controller,
        onDetect: _onDetect,
      ),
    );
  }
}
