// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_result_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ControlResultSearchResult _$_$_ControlResultSearchResultFromJson(
    Map<String, dynamic> json) {
  return _$_ControlResultSearchResult(
    id: json['id'] as int,
    surveyDate: json['surveyDate'] == null
        ? null
        : DateTime.parse(json['surveyDate'] as String),
    geometryX: (json['geometryX'] as num)?.toDouble(),
    geometryY: (json['geometryY'] as num)?.toDouble(),
    violationExists: json['violationExists'] as bool,
    violation: json['violation'] == null
        ? null
        : ViolationSearchResult.fromJson(
            json['violation'] as Map<String, dynamic>),
    creationSentToCafap: json['creationSentToCafap'] as bool,
    closureSentToCafap: json['closureSentToCafap'] as bool,
  );
}

Map<String, dynamic> _$_$_ControlResultSearchResultToJson(
        _$_ControlResultSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'surveyDate': instance.surveyDate?.toIso8601String(),
      'geometryX': instance.geometryX,
      'geometryY': instance.geometryY,
      'violationExists': instance.violationExists,
      'violation': instance.violation?.toJson(),
      'creationSentToCafap': instance.creationSentToCafap,
      'closureSentToCafap': instance.closureSentToCafap,
    };
