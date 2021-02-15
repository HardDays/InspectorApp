import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/violation_extension_reason.dart';
import 'package:inspector/model/department_control/perform_control.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlListBlocEvent with _$ControlListBlocEvent {
  const factory ControlListBlocEvent.loadControlListEvent() =
      LoadControlListEvent;

  const factory ControlListBlocEvent.cantWorkInThisModeEvent() =
      CantWorkInThisModeEvent;

  const factory ControlListBlocEvent.refreshControlListEvent() =
      RefreshControlListEvent;

  const factory ControlListBlocEvent.loadNextPageControlListEvent() =
      LoadNextPageControlListEvent;

  const factory ControlListBlocEvent.changeFilters(
      ControlFiltersBlocState state) = ChangeFiltersEvent;

  const factory ControlListBlocEvent.changeSort(String state) = ChangeSortEvent;

  const factory ControlListBlocEvent.openInMapEvent(ControlObject object) =
      OpenInMapEvent;
  
  const factory ControlListBlocEvent.selectControlObject(ControlObject object) = SelectControlObjectEvent;

  const factory ControlListBlocEvent.createViolationEvent(
      ControlObject object) = CreateViolationEvent;

  const factory ControlListBlocEvent.registerSearchResultEvent(
      ControlObject object,
      {DCViolation violation}) = RegisterSearchResultEvent;

  const factory ControlListBlocEvent.removeViolationEvent(
    ControlObject object,
    int violationId,
  ) = RemoveViolationEvent;

  const factory ControlListBlocEvent.registerPerformControlEvent(
    PerformControl performControl,
    ControlObject object,
    int controlResultId,
  ) = RegisterPerformControlEvent;

  const factory ControlListBlocEvent.removePerformControlEvent(
    PerformControl performControl,
    ControlObject object,
    int controlResultId,
  ) = RemovePerformControlEvent;

  const factory ControlListBlocEvent.updatePerformControlEvent(
    PerformControl performControl,
    ControlObject object,
    int controlResultId,
  ) = UpdatePerformControlEvent;

  const factory ControlListBlocEvent.updateResolveDateEvent(
    ControlObject object,
    int controlResultId,
    DateTime resolveDate,
    ViolationExtensionReason reason,
    String comments,
  ) = UpdateResolveDateEvent;

  const factory ControlListBlocEvent.changeShowMapEvent(bool showMap) =
      ChangeShowMapEvent;
}
