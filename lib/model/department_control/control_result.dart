import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/dcviolation.dart';

part 'control_result.g.dart';
part 'control_result.freezed.dart';

@freezed
abstract class ControlResult with _$ControlResult {
  const factory ControlResult({
    int id,
    DateTime surveyDate,
    double geometryX,
    double geometryY,
    bool violationExists,
    DCViolation violation,
  }) = _ControlResult;

  factory ControlResult.fromJson(Map<String, dynamic> json) =>
      _$ControlResultFromJson(json);
}
