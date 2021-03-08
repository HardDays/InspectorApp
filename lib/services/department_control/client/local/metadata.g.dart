// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepartmentControlLocalServiceMetadata
    _$_$_DepartmentControlLocalServiceMetadataFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlLocalServiceMetadata(
    json['loaded'] as bool,
    lastUpdatedDate: json['lastUpdatedDate'] == null
        ? null
        : DateTime.parse(json['lastUpdatedDate'] as String),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$_$_DepartmentControlLocalServiceMetadataToJson(
        _$_DepartmentControlLocalServiceMetadata instance) =>
    <String, dynamic>{
      'loaded': instance.loaded,
      'lastUpdatedDate': instance.lastUpdatedDate?.toIso8601String(),
      'count': instance.count,
    };
