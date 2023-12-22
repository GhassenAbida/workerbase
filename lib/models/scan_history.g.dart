// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QRScanImpl _$$QRScanImplFromJson(Map<String, dynamic> json) => _$QRScanImpl(
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$QRScanImplToJson(_$QRScanImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'image': instance.image,
    };
