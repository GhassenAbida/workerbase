import 'package:flutter/material.dart';
import 'package:workerbase/models/scan_history.dart';
import 'package:workerbase/services/storage_service.dart';

class ScanHistoryScreen extends StatefulWidget {
  const ScanHistoryScreen({super.key});

  @override
  State<ScanHistoryScreen> createState() => _ScanHistoryScreenState();
}

class _ScanHistoryScreenState extends State<ScanHistoryScreen> {
  List<QRScan> scans = [];
  int currentPage = 0;
  static const int pageSize = 10;

  @override
  void initState() {
    super.initState();
    _loadScans();
  }

  _loadScans({int page = 0}) async {
    List<QRScan> loadedScans = await DatabaseHelper.instance.getPaginatedScans(page * pageSize, pageSize);
    setState(() {
      if (loadedScans.isEmpty && page != 0) {
        currentPage = page - 1;
      } else {
        scans = loadedScans;
        currentPage = page;
      }
    });
  }

  Future<void> _deleteScan(int id) async {
    await DatabaseHelper.instance.deleteScan(id);
    _loadScans(page: currentPage);
  }

  Future<void> _promptDeleteScan(int id) async {
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

    if (result == true) {
      _deleteScan(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan History'),
      ),
      body: Column(
        children: [
          Expanded(
            child: scans.isNotEmpty
                ? ListView.builder(
              itemCount: scans.length,
              itemBuilder: (context, index) {
                final scan = scans[index];
                return ListTile(
                  title: Text(scan.content),
                  subtitle: Text(scan.timestamp.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _promptDeleteScan(scan),
                  ),
                );
              },
            )
                : const Center(child: Text("No scans available")),
          ),
          _buildPaginationControls(),
        ],
      ),
    );
  }


  Widget _buildPaginationControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return TextButton(
          onPressed: () => _loadScans(page: index),
          child: Text('${index * pageSize}'),
        );
      }),
    );
  }
}
