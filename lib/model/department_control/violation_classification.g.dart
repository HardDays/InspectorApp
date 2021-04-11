// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_classification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ViolationClassification _$_$_ViolationClassificationFromJson(
    Map<String, dynamic> json) {
  return _$_ViolationClassification(
    id: json['id'] as int,
    violationName: json['violationName'] == null
        ? null
        : ViolationName.fromJson(json['violationName'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ViolationClassificationToJson(
        _$_ViolationClassification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'violationName': instance.violationName,
    };
