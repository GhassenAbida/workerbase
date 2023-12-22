import 'package:flutter/material.dart';
import 'package:workerbase/models/scan_history.dart';
import 'package:workerbase/services/storage_service.dart';

class ScanHistoryProvider with ChangeNotifier {
  List<QRScan> scans = [];
  int currentPage = 0;
  static const int pageSize = 10;
  bool isLoading = false;

  ScanHistoryProvider() {
    loadScans(); // Load the first page by default when the provider is initialized
  }

  Future<void> loadScans({int page = 0}) async {
    isLoading = true;
    notifyListeners();

    try {
      int start = page * pageSize;
      List<QRScan> loadedScans = await DatabaseHelper.instance.getPaginatedScans(start, pageSize);
      scans = loadedScans;  // Update scans whether it's empty or not
      currentPage = page;   // Update currentPage to the requested page
    } catch (e) {
      // Handle errors, possibly setting an error state or logging the error
      print('Error loading scans: $e');  // Consider a better error handling strategy
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }



  Future<void> deleteScanByTimestamp(DateTime timestamp) async {
    await DatabaseHelper.instance.deleteScanByTimestamp(timestamp);
    await loadScans(page: currentPage); // Reload the current page
    notifyListeners(); // Notify listeners to rebuild the widget as data has changed
  }

  Future<void> promptDeleteScan(BuildContext context, DateTime timestamp) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this scan?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        );
      },
    );

    // If the user confirmed, delete the scan and reload the list
    if (result == true) {
      await deleteScanByTimestamp(timestamp);
    }
  }
}
