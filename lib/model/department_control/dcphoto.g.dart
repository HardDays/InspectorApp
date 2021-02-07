// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dcphoto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DCPhoto _$DCPhotoFromJson(Map<String, dynamic> json) {
  return DCPhoto(
    id: json['id'] as int,
    name: json['name'] as String,
    data: json['data'] as String,
    loadDate: json['loadDate'] as String,
    geometryX: json['geometryX'] as int,
    geometryY: json['geometryY'] as int,
  );
}

Map<String, dynamic> _$DCPhotoToJson(DCPhoto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'data': instance.data,
      'loadDate': instance.loadDate,
      'geometryX': instance.geometryX,
      'geometryY': instance.geometryY,
    };
