// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ControlObject _$_$_ControlObjectFromJson(Map<String, dynamic> json) {
  return _$_ControlObject(
    id: json['id'] as int,
    externalId: json['externalId'] as int,
    type: json['type'] == null
        ? null
        : ObjectType.fromJson(json['type'] as Map<String, dynamic>),
    kind: json['kind'] as String,
    name: json['name'] as String,
    area: json['area'] as String,
    district: json['district'] as String,
    address: json['address'] as String,
    balanceOwner: json['balanceOwner'] as String,
    contractor: json['contractor'] == null
        ? null
        : Contractor.fromJson(json['contractor'] as Map<String, dynamic>),
    cameraCount: json['cameraCount'] as int,
    violationsCount: json['violationsCount'] as String,
    lastSurveyDate: json['lastSurveyDate'] == null
        ? null
        : DateTime.parse(json['lastSurveyDate'] as String),
    rowColor: json['rowColor'] as String,
    geometry: (json['geometry'] as List)
        ?.map((e) => e == null
            ? null
            : MapGeometricObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    violations: (json['violations'] as List)
        ?.map((e) => e == null
            ? null
            : ViolationShortSearchResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ControlObjectToJson(_$_ControlObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'externalId': instance.externalId,
      'type': instance.type,
      'kind': instance.kind,
      'name': instance.name,
      'area': instance.area,
      'district': instance.district,
      'address': instance.address,
      'balanceOwner': instance.balanceOwner,
      'contractor': instance.contractor,
      'cameraCount': instance.cameraCount,
      'violationsCount': instance.violationsCount,
      'lastSurveyDate': instance.lastSurveyDate?.toIso8601String(),
      'rowColor': instance.rowColor,
      'geometry': instance.geometry,
      'violations': instance.violations,
    };
