// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PerformControl _$_$_PerformControlFromJson(Map<String, dynamic> json) {
  return _$_PerformControl(
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
  );
}

Map<String, dynamic> _$_$_PerformControlToJson(_$_PerformControl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planDate': instance.planDate?.toIso8601String(),
      'factDate': instance.factDate?.toIso8601String(),
      'resolved': instance.resolved,
      'photos': instance.photos?.map((e) => e?.toJson())?.toList(),
    };
