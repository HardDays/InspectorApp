import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/perform_control_search_result.dart';
import 'package:inspector/model/department_control/violation_extension_period.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlViolationPageBlocEvent
    with _$ControlViolationPageBlocEvent {
  const factory ControlViolationPageBlocEvent.refresh() = RefreshEvent;
  const factory ControlViolationPageBlocEvent.extendPeriod({
    ViolationExtensionPeriod extensionPeriod,
  }) = ExtendPeriodEvent;
  const factory ControlViolationPageBlocEvent.editPerformControl({
    PerformControlSearchResult performControl,
  }) = EditPerformControlEvent;
  const factory ControlViolationPageBlocEvent.removePerformControl({
    PerformControlSearchResult performControl,
  }) = RemovePerformControlEvent;
  const factory ControlViolationPageBlocEvent.createPerformControl({
    PerformControl performControl,
  }) = CreatePerformControlEvent;
  const factory ControlViolationPageBlocEvent.saveChanges() = SaveChangesEvent;
  const factory ControlViolationPageBlocEvent.discardChanges() =
      DiscardChangesEvent;
}
