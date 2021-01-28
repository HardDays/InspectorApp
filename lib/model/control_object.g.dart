// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'control_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ControlObject _$ControlObjectFromJson(Map<String, dynamic> json) {
  return ControlObject(
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

Map<String, dynamic> _$ControlObjectToJson(ControlObject instance) =>
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

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    x: json['x'] as int,
    y: json['y'] as int,
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };

MapGeometricObject _$MapGeometricObjectFromJson(Map<String, dynamic> json) {
  return MapGeometricObject(
    type: _$enumDecodeNullable(_$MapGeometricObjectTypeEnumMap, json['type']),
    color: json['color'] as String,
    label: json['label'] as String,
    points: (json['points'] as List)
        ?.map(
            (e) => e == null ? null : Point.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MapGeometricObjectToJson(MapGeometricObject instance) =>
    <String, dynamic>{
      'type': _$MapGeometricObjectTypeEnumMap[instance.type],
      'color': instance.color,
      'label': instance.label,
      'points': instance.points,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MapGeometricObjectTypeEnumMap = {
  MapGeometricObjectType.point: 'point',
  MapGeometricObjectType.polyline: 'polyline',
  MapGeometricObjectType.polygon: 'polygon',
};

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

ViolationShortSearchResult _$ViolationShortSearchResultFromJson(
    Map<String, dynamic> json) {
  return ViolationShortSearchResult(
    id: json['id'] as int,
    violationNum: json['violationNum'] as String,
    violationStatus: json['violationStatus'] == null
        ? null
        : ViolationStatus.fromJson(
            json['violationStatus'] as Map<String, dynamic>),
    detectionDate: json['detectionDate'] as String,
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    objectElement: json['objectElement'] == null
        ? null
        : ObjectElement.fromJson(json['objectElement'] as Map<String, dynamic>),
    eknViolationName: json['eknViolationName'] == null
        ? null
        : ViolationName.fromJson(
            json['eknViolationName'] as Map<String, dynamic>),
    otherViolationName: json['otherViolationName'] == null
        ? null
        : ViolationName.fromJson(
            json['otherViolationName'] as Map<String, dynamic>),
    resolveDate: json['resolveDate'] as String,
    controlDate: json['controlDate'] as String,
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : DCPhoto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ViolationShortSearchResultToJson(
        ViolationShortSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationNum': instance.violationNum,
      'violationStatus': instance.violationStatus,
      'detectionDate': instance.detectionDate,
      'source': instance.source,
      'objectElement': instance.objectElement,
      'eknViolationName': instance.eknViolationName,
      'otherViolationName': instance.otherViolationName,
      'resolveDate': instance.resolveDate,
      'controlDate': instance.controlDate,
      'photos': instance.photos,
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ObjectElement _$ObjectElementFromJson(Map<String, dynamic> json) {
  return ObjectElement(
    id: json['id'] as int,
    name: json['name'] as String,
    objectType: json['objectType'] == null
        ? null
        : ObjectType.fromJson(json['objectType'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ObjectElementToJson(ObjectElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'objectType': instance.objectType,
    };

ViolationName _$ViolationNameFromJson(Map<String, dynamic> json) {
  return ViolationName(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ViolationNameToJson(ViolationName instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

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
