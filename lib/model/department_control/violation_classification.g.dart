// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_classification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationClassification _$ViolationClassificationFromJson(
    Map<String, dynamic> json) {
  return ViolationClassification(
    id: json['id'] as int,
    violationName: json['violationName'] == null
        ? null
        : ViolationName.fromJson(json['violationName'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ViolationClassificationToJson(
        ViolationClassification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationName': instance.violationName,
    };
