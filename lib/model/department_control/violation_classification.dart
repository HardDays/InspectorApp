import 'package:inspector/model/department_control/violation_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_classification.g.dart';
part 'violation_classification.freezed.dart';

@freezed
abstract class ViolationClassification with _$ViolationClassification {
  const factory ViolationClassification({
    int id,
    ViolationName violationName,
  }) = _ViolationClassification;

  factory ViolationClassification.fromJson(Map<String, dynamic> json) =>
      _$ViolationClassificationFromJson(json);

}