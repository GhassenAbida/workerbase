import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workerbase/providers/scan_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:workerbase/services/qr_scanner_service.dart';
import 'package:workerbase/utils/colors.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  _QRScannerState createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  late MobileScannerController controller;
  bool isFrontCamera = false;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController();
  }

  @override
  Widget build(BuildContext context) {
    final qrScannerProvider = Provider.of<QRScannerProvider>(context);

    void toggleFlash() {
      qrScannerProvider.toggleFlash();
      controller.toggleTorch();
    }

    void switchCamera() {
      setState(() {
        isFrontCamera = !isFrontCamera;
        controller.switchCamera();
      });
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: blackColor),
            onPressed: () {
              Navigator.pushNamed(context, '/history');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.flash_on,
              color: qrScannerProvider.isFlashOn ? Colors.yellow : Colors.grey,
            ),
            onPressed: toggleFlash,
          ),
          IconButton(
            icon: Icon(
              isFrontCamera ? Icons.camera_rear : Icons.camera_front,
              color: Colors.grey,
            ),
            onPressed: switchCamera,
          ),
        ],
        iconTheme: const IconThemeData(color: blackColor),
        title: const Text(
          "QRScanner",
          style: TextStyle(
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Place the QR code in the area",
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        MobileScanner(
                          controller: controller,
                          onDetect: (barcodeCapture) {
                            if (barcodeCapture.barcodes.isNotEmpty && !qrScannerProvider.isScanCompleted) {
                              final String code = barcodeCapture.barcodes.first.rawValue ?? '---';
                              // TODO: Add actual image handling logic here
                              String imagePlaceholder = 'path/to/qr/code/image';  // Placeholder for image path
                              controller.stop(); // Stop the camera
                              QRService().handleScan(context, code, imagePlaceholder, qrScannerProvider); // Now passing image as well
                            }
                          },
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Inside the onDetect of MobileScanner
                        MobileScanner(
                          controller: controller,
                          onDetect: (barcodeCapture) {
                            if (barcodeCapture.barcodes.isNotEmpty && !qrScannerProvider.isScanCompleted) {
                              final String code = barcodeCapture.barcodes.first.rawValue ?? '---';
                              String imagePlaceholder = 'path/to/qr/code/image';  // Placeholder for image path

                              // Stop the camera and handle the scan
                              controller.stop();
                              QRService().handleScan(context, code, imagePlaceholder, qrScannerProvider);
                            }
                          },
                        ),

                        // Scanner frame
                        Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5), // Semi-transparent black
                                  ),
                                ),
                              ),
                            const  Center(
                                child: const Icon(
                                  Icons.qr_code_scanner,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Positioned text
                        const Positioned(
                          bottom: 30,
                          child: Text(
                            'Hold the QR code inside the area',
                            style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "WorkerBase",
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
