import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
class QRScannerProvider with ChangeNotifier {
  bool _isScanCompleted = false;
  bool _isFlashOn = false;
  bool _isFrontCamera = false;
  String _scannedCode = '';

  bool get isScanCompleted => _isScanCompleted;
  bool get isFlashOn => _isFlashOn;
  bool get isFrontCamera => _isFrontCamera;
  String get scannedCode => _scannedCode;

  void toggleFlash() {
    _isFlashOn = !_isFlashOn;

    notifyListeners();
  }
  void resetAndReactivateScan(MobileScannerController controller) {
    _isScanCompleted = false;
    controller.start(); // Reactivate the camera
    notifyListeners();
  }

  void switchCamera() {
    _isFrontCamera = !_isFrontCamera;

    notifyListeners();
  }

  void completeScan(String code) {
    _scannedCode = code;
    _isScanCompleted = true;
    notifyListeners();
  }

  void resetScan() {
    _isScanCompleted = false;
    notifyListeners();
  }
}
