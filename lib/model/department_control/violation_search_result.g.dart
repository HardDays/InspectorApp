// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationSearchResult _$_$_ViolationSearchResultFromJson(
    Map<String, dynamic> json) {
  return _$_ViolationSearchResult(
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
    btiRefAddress: json['btiRefAddress'] == null
        ? null
        : Address.fromJson(json['btiRefAddress'] as Map<String, dynamic>),
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
    violationNum: json['violationNum'] as String,
    violationStatus: json['violationStatus'] == null
        ? null
        : ViolationStatus.fromJson(
            json['violationStatus'] as Map<String, dynamic>),
    source: json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    violationKind: json['violationKind'] == null
        ? null
        : DCViolationKind.fromJson(
            json['violationKind'] as Map<String, dynamic>),
    cafapAssigmentId: json['cafapAssigmentId'] as String,
    cafapPrescriptionId: json['cafapPrescriptionId'] as String,
    cafapPrescriptionNum: json['cafapPrescriptionNum'] as int,
    cafapViolationConfirmed: json['cafapViolationConfirmed'] as bool,
    performMarks: (json['performMarks'] as List)
        ?.map((e) =>
            e == null ? null : PerformMark.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    performControls: (json['performControls'] as List)
        ?.map((e) => e == null
            ? null
            : PerformControlSearchResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    extensionPeriods: (json['extensionPeriods'] as List)
        ?.map((e) => e == null
            ? null
            : ViolationExtensionPeriodSearchResult.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    creationSentToCafap: json['creationSentToCafap'] as bool,
    closureSentToCafap: json['closureSentToCafap'] as bool,
  );
}

Map<String, dynamic> _$_$_ViolationSearchResultToJson(
        _$_ViolationSearchResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detectionDate': instance.detectionDate?.toIso8601String(),
      'eknViolationClassification': instance.eknViolationClassification,
      'otherViolationClassification': instance.otherViolationClassification,
      'btiAddress': instance.btiAddress,
      'address': instance.address,
      'btiRefAddress': instance.btiRefAddress,
      'refAddressTinao': instance.refAddressTinao,
      'objectElement': instance.objectElement,
      'description': instance.description,
      'violator': instance.violator,
      'critical': instance.critical,
      'resolveDate': instance.resolveDate?.toIso8601String(),
      'controlDate': instance.controlDate?.toIso8601String(),
      'additionalFeatures': instance.additionalFeatures,
      'photos': instance.photos,
      'violationNum': instance.violationNum,
      'violationStatus': instance.violationStatus,
      'source': instance.source,
      'violationKind': instance.violationKind,
      'cafapAssigmentId': instance.cafapAssigmentId,
      'cafapPrescriptionId': instance.cafapPrescriptionId,
      'cafapPrescriptionNum': instance.cafapPrescriptionNum,
      'cafapViolationConfirmed': instance.cafapViolationConfirmed,
      'performMarks': instance.performMarks,
      'performControls': instance.performControls,
      'extensionPeriods': instance.extensionPeriods,
      'creationSentToCafap': instance.creationSentToCafap,
      'closureSentToCafap': instance.closureSentToCafap,
    };
