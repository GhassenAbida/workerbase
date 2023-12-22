import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:workerbase/providers/scan_history_provider.dart';

=======
import 'package:workerbase/providers/scan_history_provider.dart'; // Adjust this path to where your provider is located
import 'package:flutter_spinkit/flutter_spinkit.dart';
>>>>>>> dev
class ScanHistoryScreen extends StatelessWidget {
  const ScanHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: const Text('Scan History',style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ChangeNotifierProvider<ScanHistoryProvider>(
        create: (_) => ScanHistoryProvider(),
        child: Consumer<ScanHistoryProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Expanded(
                  child: provider.isLoading
                      ? const Center(
                    child: SpinKitFadingCircle(
                      color: Colors.red, // specify the color for the loader
                      size: 50.0, // specify the size of the loader
                    ),
                  )
                      : provider.scans.isEmpty
                      ? const Center(child: Text("No scans available"))
                      : ListView.builder(
                    itemCount: provider.scans.length,
                    itemBuilder: (context, index) {
                      final scan = provider.scans[index];
                      return Card(
                        color: Colors.grey[100],
                        elevation: 4.0, // Adjust the elevation for shadow effect
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          scan.content, // Scan content
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          scan.timestamp.toString(), // Scan timestamp
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[150],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                                    onPressed: () {
                                      provider.promptDeleteScan(
                                          context, scan.timestamp);

                                    }  ),
                                ],
                              ),
                              // Add more content or buttons if necessary
                            ],
                          ),
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
<<<<<<< HEAD
                backgroundColor: isCurrentPage ? Colors.grey[300] : Colors.transparent,
=======
                backgroundColor: isCurrentPage ? Colors.grey[100] : Colors.transparent,
>>>>>>> dev
              ),
              child: Text(
                'Page ${index + 1}',
                style: TextStyle(
                  color: isCurrentPage ? Colors.red[100] : Colors.black,
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