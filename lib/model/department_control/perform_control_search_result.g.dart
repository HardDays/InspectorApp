// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_control_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PerformControlSearchResult _$_$_PerformControlSearchResultFromJson(
    Map<String, dynamic> json) {
  return _$_PerformControlSearchResult(
    id: json['id'] as int,
    planDate: json['planDate'] == null
        ? null
        : DateTime.parse(json['planDate'] as String),
    factDate: json['factDate'] == null
        ? null
        : DateTime.parse(json['factDate'] as String),
    resolved: json['resolved'] as bool,
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : DCPhoto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creatorShortFio: json['creatorShortFio'] as String,
    sentToCafap: json['sentToCafap'] as bool,
  );
}

Map<String, dynamic> _$_$_PerformControlSearchResultToJson(
        _$_PerformControlSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planDate': instance.planDate?.toIso8601String(),
      'factDate': instance.factDate?.toIso8601String(),
      'resolved': instance.resolved,
      'photos': instance.photos,
      'creatorShortFio': instance.creatorShortFio,
      'sentToCafap': instance.sentToCafap,
    };
