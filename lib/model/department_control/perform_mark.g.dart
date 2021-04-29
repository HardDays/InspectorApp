// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_mark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PerformMark _$_$_PerformMarkFromJson(Map<String, dynamic> json) {
  return _$_PerformMark(
    id: json['id'] as int,
    resolveDate: json['resolveDate'] == null
        ? null
        : DateTime.parse(json['resolveDate'] as String),
    organization: json['organization'] as String,
    creator: json['creator'] as String,
    comments: json['comments'] as String,
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : DCPhoto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PerformMarkToJson(_$_PerformMark instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resolveDate': instance.resolveDate?.toIso8601String(),
      'organization': instance.organization,
      'creator': instance.creator,
      'comments': instance.comments,
      'photos': instance.photos?.map((e) => e?.toJson())?.toList(),
    };
