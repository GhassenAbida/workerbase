// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QRScan _$QRScanFromJson(Map<String, dynamic> json) {
  return _QRScan.fromJson(json);
}

/// @nodoc
mixin _$QRScan {
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QRScanCopyWith<QRScan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRScanCopyWith<$Res> {
  factory $QRScanCopyWith(QRScan value, $Res Function(QRScan) then) =
      _$QRScanCopyWithImpl<$Res, QRScan>;
  @useResult
  $Res call({String content, DateTime timestamp, String image});
}

/// @nodoc
class _$QRScanCopyWithImpl<$Res, $Val extends QRScan>
    implements $QRScanCopyWith<$Res> {
  _$QRScanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? timestamp = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QRScanImplCopyWith<$Res> implements $QRScanCopyWith<$Res> {
  factory _$$QRScanImplCopyWith(
          _$QRScanImpl value, $Res Function(_$QRScanImpl) then) =
      __$$QRScanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, DateTime timestamp, String image});
}

/// @nodoc
class __$$QRScanImplCopyWithImpl<$Res>
    extends _$QRScanCopyWithImpl<$Res, _$QRScanImpl>
    implements _$$QRScanImplCopyWith<$Res> {
  __$$QRScanImplCopyWithImpl(
      _$QRScanImpl _value, $Res Function(_$QRScanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? timestamp = null,
    Object? image = null,
  }) {
    return _then(_$QRScanImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QRScanImpl implements _QRScan {
  const _$QRScanImpl(
      {required this.content, required this.timestamp, required this.image});

  factory _$QRScanImpl.fromJson(Map<String, dynamic> json) =>
      _$$QRScanImplFromJson(json);

  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  final String image;

  @override
  String toString() {
    return 'QRScan(content: $content, timestamp: $timestamp, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QRScanImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, timestamp, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QRScanImplCopyWith<_$QRScanImpl> get copyWith =>
      __$$QRScanImplCopyWithImpl<_$QRScanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QRScanImplToJson(
      this,
    );
  }
}

abstract class _QRScan implements QRScan {
  const factory _QRScan(
      {required final String content,
      required final DateTime timestamp,
      required final String image}) = _$QRScanImpl;

  factory _QRScan.fromJson(Map<String, dynamic> json) = _$QRScanImpl.fromJson;

  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$QRScanImplCopyWith<_$QRScanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
