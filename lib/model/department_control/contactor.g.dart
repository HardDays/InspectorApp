// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contractor _$ContractorFromJson(Map<String, dynamic> json) {
  return Contractor(
    id: json['id'] as int,
    name: json['name'] as String,
    inn: json['inn'] as String,
  );
}

Map<String, dynamic> _$ContractorToJson(Contractor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'inn': instance.inn,
    };
