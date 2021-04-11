// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_classification_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationClassificationSearchResult
    _$_$_ViolationClassificationSearchResultFromJson(
        Map<String, dynamic> json) {
  return _$_ViolationClassificationSearchResult(
    id: json['id'] as int,
    violationName: json['violationName'] == null
        ? null
        : ViolationName.fromJson(json['violationName'] as Map<String, dynamic>),
    violationType: json['violationType'] == null
        ? null
        : DCViolationType.fromJson(
            json['violationType'] as Map<String, dynamic>),
    violationKind: json['violationKind'] == null
        ? null
        : DCViolationKind.fromJson(
            json['violationKind'] as Map<String, dynamic>),
    objectType: json['objectType'] == null
        ? null
        : ObjectType.fromJson(json['objectType'] as Map<String, dynamic>),
    objectElement: json['objectElement'] == null
        ? null
        : ObjectElement.fromJson(json['objectElement'] as Map<String, dynamic>),
    ekn: json['ekn'] as bool,
    warning: json['warning'] as String,
    regulations: json['regulations'] as String,
    npa: json['npa'] as String,
    article: json['article'] as String,
  );
}

Map<String, dynamic> _$_$_ViolationClassificationSearchResultToJson(
        _$_ViolationClassificationSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationName': instance.violationName,
      'violationType': instance.violationType,
      'violationKind': instance.violationKind,
      'objectType': instance.objectType,
      'objectElement': instance.objectElement,
      'ekn': instance.ekn,
      'warning': instance.warning,
      'regulations': instance.regulations,
      'npa': instance.npa,
      'article': instance.article,
    };
