// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllState _$_$AllStateFromJson(Map<String, dynamic> json) {
  return _$AllState(
    dcObjectType: json['dcObjectType'] == null
        ? null
        : ObjectType.fromJson(json['dcObjectType'] as Map<String, dynamic>),
    dcObjectKind: json['dcObjectKind'] == null
        ? null
        : ObjectKind.fromJson(json['dcObjectKind'] as Map<String, dynamic>),
    externalId: json['externalId'] as int,
    objectName: json['objectName'] as String,
    area: json['area'] == null
        ? null
        : Area.fromJson(json['area'] as Map<String, dynamic>),
    district: json['district'] == null
        ? null
        : District.fromJson(json['district'] as Map<String, dynamic>),
    street: json['street'] == null
        ? null
        : Street.fromJson(json['street'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    searchRadius: json['searchRadius'] as int,
    balanceOwner: json['balanceOwner'] as String,
    daysFromLastSurvey: json['daysFromLastSurvey'] as int,
    lastSurveyDates: (json['lastSurveyDates'] as List)
        ?.map((e) => e == null ? null : DateTime.parse(e as String))
        ?.toList(),
    camerasExist: json['camerasExist'] as bool,
    ignoreViolations: json['ignoreViolations'] as bool,
    objectElement: json['objectElement'] == null
        ? null
        : ObjectElement.fromJson(json['objectElement'] as Map<String, dynamic>),
    violationName: json['violationName'] == null
        ? null
        : ViolationName.fromJson(json['violationName'] as Map<String, dynamic>),
    violationStatus: json['violationStatus'] == null
        ? null
        : ViolationStatus.fromJson(
            json['violationStatus'] as Map<String, dynamic>),
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    controlDates: (json['controlDates'] as List)
        ?.map((e) => e == null ? null : DateTime.parse(e as String))
        ?.toList(),
    detectionDates: (json['detectionDates'] as List)
        ?.map((e) => e == null ? null : DateTime.parse(e as String))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$AllStateToJson(_$AllState instance) =>
    <String, dynamic>{
      'dcObjectType': instance.dcObjectType?.toJson(),
      'dcObjectKind': instance.dcObjectKind?.toJson(),
      'externalId': instance.externalId,
      'objectName': instance.objectName,
      'area': instance.area?.toJson(),
      'district': instance.district?.toJson(),
      'street': instance.street?.toJson(),
      'address': instance.address?.toJson(),
      'searchRadius': instance.searchRadius,
      'balanceOwner': instance.balanceOwner,
      'daysFromLastSurvey': instance.daysFromLastSurvey,
      'lastSurveyDates':
          instance.lastSurveyDates?.map((e) => e?.toIso8601String())?.toList(),
      'camerasExist': instance.camerasExist,
      'ignoreViolations': instance.ignoreViolations,
      'objectElement': instance.objectElement?.toJson(),
      'violationName': instance.violationName?.toJson(),
      'violationStatus': instance.violationStatus?.toJson(),
      'source': instance.source?.toJson(),
      'controlDates':
          instance.controlDates?.map((e) => e?.toIso8601String())?.toList(),
      'detectionDates':
          instance.detectionDates?.map((e) => e?.toIso8601String())?.toList(),
    };
