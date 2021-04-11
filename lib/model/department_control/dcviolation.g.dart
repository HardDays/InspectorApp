// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dcviolation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DCViolation _$_$_DCViolationFromJson(Map<String, dynamic> json) {
  return _$_DCViolation(
    id: json['id'] as int,
    detectionDate: json['detectionDate'] == null
        ? null
        : DateTime.parse(json['detectionDate'] as String),
    eknViolationClassification: json['eknViolationClassification'] == null
        ? null
        : ViolationClassification.fromJson(
            json['eknViolationClassification'] as Map<String, dynamic>),
    otherViolationClassification: json['otherViolationClassification'] == null
        ? null
        : ViolationClassification.fromJson(
            json['otherViolationClassification'] as Map<String, dynamic>),
    btiAddress: json['btiAddress'] == null
        ? null
        : Address.fromJson(json['btiAddress'] as Map<String, dynamic>),
    address: json['address'] as String,
    refAddressTinao: json['refAddressTinao'] as bool,
    objectElement: json['objectElement'] == null
        ? null
        : ObjectElement.fromJson(json['objectElement'] as Map<String, dynamic>),
    description: json['description'] as String,
    violator: json['violator'] == null
        ? null
        : Contractor.fromJson(json['violator'] as Map<String, dynamic>),
    critical: json['critical'] as bool,
    resolveDate: json['resolveDate'] == null
        ? null
        : DateTime.parse(json['resolveDate'] as String),
    controlDate: json['controlDate'] == null
        ? null
        : DateTime.parse(json['controlDate'] as String),
    additionalFeatures: (json['additionalFeatures'] as List)
        ?.map((e) => e == null
            ? null
            : ViolationAdditionalFeature.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    photos: (json['photos'] as List)
        ?.map((e) =>
            e == null ? null : DCPhoto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_DCViolationToJson(_$_DCViolation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detectionDate': instance.detectionDate?.toIso8601String(),
      'eknViolationClassification': instance.eknViolationClassification,
      'otherViolationClassification': instance.otherViolationClassification,
      'btiAddress': instance.btiAddress,
      'address': instance.address,
      'refAddressTinao': instance.refAddressTinao,
      'objectElement': instance.objectElement,
      'description': instance.description,
      'violator': instance.violator,
      'critical': instance.critical,
      'resolveDate': instance.resolveDate?.toIso8601String(),
      'controlDate': instance.controlDate?.toIso8601String(),
      'additionalFeatures': instance.additionalFeatures,
      'photos': instance.photos,
    };
