// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ControlResult _$_$_ControlResultFromJson(Map<String, dynamic> json) {
  return _$_ControlResult(
    id: json['id'] as int,
    surveyDate: json['surveyDate'] == null
        ? null
        : DateTime.parse(json['surveyDate'] as String),
    geometryX: (json['geometryX'] as num)?.toDouble(),
    geometryY: (json['geometryY'] as num)?.toDouble(),
    violationExists: json['violationExists'] as bool,
    violation: json['violation'] == null
        ? null
        : DCViolation.fromJson(json['violation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ControlResultToJson(_$_ControlResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surveyDate': instance.surveyDate?.toIso8601String(),
      'geometryX': instance.geometryX,
      'geometryY': instance.geometryY,
      'violationExists': instance.violationExists,
      'violation': instance.violation,
    };
