// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ObjectElement _$_$_ObjectElementFromJson(Map<String, dynamic> json) {
  return _$_ObjectElement(
    id: json['id'] as int,
    name: json['name'] as String,
    objectType: json['objectType'] == null
        ? null
        : ObjectType.fromJson(json['objectType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ObjectElementToJson(_$_ObjectElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'objectType': instance.objectType,
    };
