// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepartmentControlLocalServiceMetadata
    _$_$_DepartmentControlLocalServiceMetadataFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlLocalServiceMetadata(
    json['lastUpdatedDate'] == null
        ? null
        : DateTime.parse(json['lastUpdatedDate'] as String),
    json['count'] as int,
    json['loaded'] as bool,
  );
}

Map<String, dynamic> _$_$_DepartmentControlLocalServiceMetadataToJson(
        _$_DepartmentControlLocalServiceMetadata instance) =>
    <String, dynamic>{
      'lastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
      'count': instance.count,
      'loaded': instance.loaded,
    };
