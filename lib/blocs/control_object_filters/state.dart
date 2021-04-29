import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/dcviolation_kind.dart';
import 'package:inspector/model/department_control/dcviolation_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_status.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlObjectFilters with _$ControlObjectFilters {
  const factory ControlObjectFilters({
    DateTime surveyDateFrom,
    DateTime surveyDateTo,
    bool violationExists,
    String violationNum,
    ViolationStatus violationStatus,
    DCViolationType dcViolationType,
    DCViolationKind dcViolationKind,
    Source source,
  }) = _ControlObjectFilters;
}