// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationName _$_$_ViolationNameFromJson(Map<String, dynamic> json) {
  return _$_ViolationName(
    id: json['id'] as int,
    name: json['name'] as String,
    violationFullName: json['violationFullName'] as String,
    externalId: json['externalId'] as int,
  );
}

Map<String, dynamic> _$_$_ViolationNameToJson(_$_ViolationName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'violationFullName': instance.violationFullName,
      'externalId': instance.externalId,
    };
