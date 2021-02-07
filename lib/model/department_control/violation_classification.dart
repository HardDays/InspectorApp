import 'package:inspector/model/department_control/violation_name.dart';
import 'package:json_annotation/json_annotation.dart';

part 'violation_classification.g.dart';

@JsonSerializable()
class ViolationClassification {
  ViolationClassification({
    this.id,
    this.violationName,
  });

  final int id;
  final ViolationName violationName;

  factory ViolationClassification.fromJson(Map<String, dynamic> json) =>
      _$ViolationClassificationFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationClassificationToJson(this);
}