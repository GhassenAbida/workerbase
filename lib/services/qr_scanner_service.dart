import 'package:flutter/material.dart';
import 'package:workerbase/models/scan_history.dart';
import 'package:workerbase/screens/result_screen.dart';
import 'package:workerbase/services/storage_service.dart';
import 'package:workerbase/providers/scan_provider.dart';


class QRService {
  void handleScan(BuildContext context, String code, QRScannerProvider provider) async {
    final newScan = QRScan(content: code, timestamp: DateTime.now());
    await DatabaseHelper.instance.insertScan(newScan);

    provider.completeScan(code);

    // Show the result in a dialog
    showDialog(
      context: context,
      builder: (context) => ResultScreen(code: code, closeScreen: () => provider.resetScan()),
    );
  }
}
