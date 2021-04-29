import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/dcviolation_kind.dart';
import 'package:inspector/model/department_control/dcviolation_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/model/violation.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlObjectFiltersBlocEvent
    with _$ControlObjectFiltersBlocEvent {
  const factory ControlObjectFiltersBlocEvent.changeDatesEvent({
    DateTime startDate,
    DateTime finishDate,
  }) = ChangeDatesEvent;

  const factory ControlObjectFiltersBlocEvent.changeViolationExistsEvent({
    bool result,
  }) = ChangeViolationExistsEvent;

  const factory ControlObjectFiltersBlocEvent.changeViolationStatusEvent(
    ViolationStatus violationStatus,
  ) = ChangeViolationStatusEvent;

  const factory ControlObjectFiltersBlocEvent.changeViolationNumEvent(
    String value,
  ) = ChangeViolationNumEvent;

  const factory ControlObjectFiltersBlocEvent.changeViolationTypeEvent(
    DCViolationType type,
  ) = ChangeViolationTypeEvent;

  const factory ControlObjectFiltersBlocEvent.changeViolationKindEvent(
    DCViolationKind kind,
  ) = ChangeViolationKindEvent;

  const factory ControlObjectFiltersBlocEvent.changeSourceEvent(Source source) =
      ChangeSourceEvent;
}
