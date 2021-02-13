// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_short_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationShortSearchResult _$_$_ViolationShortSearchResultFromJson(
    Map<String, dynamic> json) {
  return _$_ViolationShortSearchResult(
    id: json['id'] as int,
    violationNum: json['violationNum'] as String,
    violationStatus: json['violationStatus'] == null
        ? null
        : ViolationStatus.fromJson(
            json['violationStatus'] as Map<String, dynamic>),
    detectionDate: json['detectionDate'] == null
        ? null
        : DateTime.parse(json['detectionDate'] as String),
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    objectElement: json['objectElement'] == null
        ? null
        : ObjectElement.fromJson(json['objectElement'] as Map<String, dynamic>),
    eknViolationName: json['eknViolationName'] == null
        ? null
        : ViolationName.fromJson(
            json['eknViolationName'] as Map<String, dynamic>),
    otherViolationName: json['otherViolationName'] == null
        ? null
        : ViolationName.fromJson(
            json['otherViolationName'] as Map<String, dynamic>),
    resolveDate: json['resolveDate'] == null
        ? null
        : DateTime.parse(json['resolveDate'] as String),
    controlDate: json['controlDate'] == null
        ? null
        : DateTime.parse(json['controlDate'] as String),
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : DCPhoto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ViolationShortSearchResultToJson(
        _$_ViolationShortSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationNum': instance.violationNum,
      'violationStatus': instance.violationStatus,
      'detectionDate': instance.detectionDate?.toIso8601String(),
      'source': instance.source,
      'objectElement': instance.objectElement,
      'eknViolationName': instance.eknViolationName,
      'otherViolationName': instance.otherViolationName,
      'resolveDate': instance.resolveDate?.toIso8601String(),
      'controlDate': instance.controlDate?.toIso8601String(),
      'photos': instance.photos,
    };
