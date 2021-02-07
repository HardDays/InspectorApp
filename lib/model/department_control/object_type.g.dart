// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObjectType _$ObjectTypeFromJson(Map<String, dynamic> json) {
  return ObjectType(
    id: json['id'] as int,
    name: json['name'] as String,
    code: json['code'] as String,
  );
}

Map<String, dynamic> _$ObjectTypeToJson(ObjectType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
