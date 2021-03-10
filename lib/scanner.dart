import 'package:flutter/material.dart';
import 'package:scan/scan.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  ScanController controller = ScanController();
  String qr = 'Unknown';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ScanView(
              controller: controller,
              onCapture: (data) {
                setState(() {
                  qr = data;
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                qr
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () => controller.resume(),
      ),
    );
  }
}
