import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workerbase/providers/scan_history_provider.dart';

class ScanHistoryScreen extends StatelessWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan History'),
      ),
      body: ChangeNotifierProvider<ScanHistoryProvider>(
        create: (_) => ScanHistoryProvider(),
        child: Consumer<ScanHistoryProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: provider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : provider.scans.isEmpty
                      ? const Center(child: Text("No scans available"))
                      : ListView.builder(
                    itemCount: provider.scans.length,
                    itemBuilder: (context, index) {
                      final scan = provider.scans[index];
                      return ListTile(
                        title: Text(scan.content),
                        subtitle: Text(scan.timestamp.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => provider.promptDeleteScan(context, scan.timestamp),
                        ),
                      );
                    },
                  ),
                ),
                _buildPaginationControls(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaginationControls(BuildContext context) {
    return Consumer<ScanHistoryProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            bool isCurrentPage = index == provider.currentPage;
            return TextButton(
              onPressed: () => provider.loadScans(page: index),
              style: TextButton.styleFrom(
                backgroundColor: isCurrentPage ? Colors.grey[300] : Colors.transparent,
              ),
              child: Text(
                'Page ${index + 1}',
                style: TextStyle(
                  color: isCurrentPage ? Colors.blue : Colors.black,
                  fontWeight: isCurrentPage ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
