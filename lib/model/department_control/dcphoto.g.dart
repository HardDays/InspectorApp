// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dcphoto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DCPhoto _$_$_DCPhotoFromJson(Map<String, dynamic> json) {
  return _$_DCPhoto(
    id: json['id'] as int,
    name: json['name'] as String,
    data: json['data'] as String,
    loadDate: json['loadDate'] as String,
    geometryX: (json['geometryX'] as num)?.toDouble(),
    geometryY: (json['geometryY'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_DCPhotoToJson(_$_DCPhoto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'data': instance.data,
      'loadDate': instance.loadDate,
      'geometryX': instance.geometryX,
      'geometryY': instance.geometryY,
    };
