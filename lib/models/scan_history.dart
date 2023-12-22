import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_history.freezed.dart';
part 'scan_history.g.dart'; // For JSON serialization

@freezed
class QRScan with _$QRScan {
  const factory QRScan({
    required String content,
    required DateTime timestamp,
    required String image,
  }) = _QRScan;

  factory QRScan.fromJson(Map<String, dynamic> json) => _$QRScanFromJson(json);
}
