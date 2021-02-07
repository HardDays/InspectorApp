// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_short_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationShortSearchResult _$ViolationShortSearchResultFromJson(
    Map<String, dynamic> json) {
  return ViolationShortSearchResult(
    id: json['id'] as int,
    violationNum: json['violationNum'] as String,
    violationStatus: json['violationStatus'] == null
        ? null
        : ViolationStatus.fromJson(
            json['violationStatus'] as Map<String, dynamic>),
    detectionDate: json['detectionDate'] as String,
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
    resolveDate: json['resolveDate'] as String,
    controlDate: json['controlDate'] as String,
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : DCPhoto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ViolationShortSearchResultToJson(
        ViolationShortSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationNum': instance.violationNum,
      'violationStatus': instance.violationStatus,
      'detectionDate': instance.detectionDate,
      'source': instance.source,
      'objectElement': instance.objectElement,
      'eknViolationName': instance.eknViolationName,
      'otherViolationName': instance.otherViolationName,
      'resolveDate': instance.resolveDate,
      'controlDate': instance.controlDate,
      'photos': instance.photos,
    };
