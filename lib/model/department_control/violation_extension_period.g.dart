// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_extension_period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationExtensionPeriod _$_$_ViolationExtensionPeriodFromJson(
    Map<String, dynamic> json) {
  return _$_ViolationExtensionPeriod(
    resolveDate: json['resolveDate'] == null
        ? null
        : DateTime.parse(json['resolveDate'] as String),
    extensionReason: json['extensionReason'] == null
        ? null
        : ViolationExtensionReason.fromJson(
            json['extensionReason'] as Map<String, dynamic>),
    comments: json['comments'] as String,
  );
}

Map<String, dynamic> _$_$_ViolationExtensionPeriodToJson(
        _$_ViolationExtensionPeriod instance) =>
    <String, dynamic>{
      'resolveDate': instance.resolveDate?.toIso8601String(),
      'extensionReason': instance.extensionReason?.toJson(),
      'comments': instance.comments,
    };
