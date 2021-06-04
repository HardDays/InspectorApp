// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_extension_period_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationExtensionPeriodSearchResult
    _$_$_ViolationExtensionPeriodSearchResultFromJson(
        Map<String, dynamic> json) {
  return _$_ViolationExtensionPeriodSearchResult(
    resolveDate: json['resolveDate'] == null
        ? null
        : DateTime.parse(json['resolveDate'] as String),
    extensionReason: json['extensionReason'] == null
        ? null
        : ViolationExtensionReason.fromJson(
            json['extensionReason'] as Map<String, dynamic>),
    comments: json['comments'] as String,
    id: json['id'] as int,
    decisionPersonFio: json['decisionPersonFio'] as String,
    decisionPersonOccupation: json['decisionPersonOccupation'] as String,
    sentToCafap: json['sentToCafap'] as bool,
  );
}

Map<String, dynamic> _$_$_ViolationExtensionPeriodSearchResultToJson(
        _$_ViolationExtensionPeriodSearchResult instance) =>
    <String, dynamic>{
      'resolveDate': instance.resolveDate?.toIso8601String(),
      'extensionReason': instance.extensionReason?.toJson(),
      'comments': instance.comments,
      'id': instance.id,
      'decisionPersonFio': instance.decisionPersonFio,
      'decisionPersonOccupation': instance.decisionPersonOccupation,
      'sentToCafap': instance.sentToCafap,
    };
