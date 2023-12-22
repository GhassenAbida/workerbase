import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workerbase/providers/scan_provider.dart'; // Import your provider here
import 'package:workerbase/screens/home_screen.dart';
import 'package:workerbase/screens//history_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => QRScannerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => QRScanner(),
          '/history': (context) => ScanHistoryScreen(),
          // Add other routes as needed
        },
        // Other MaterialApp properties...
      ),
    ),
  );
}
