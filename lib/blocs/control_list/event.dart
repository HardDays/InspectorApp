import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/dcviolation.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlListBlocEvent with _$ControlListBlocEvent {
  const factory ControlListBlocEvent.loadControlListEvent() = LoadControlListEvent;
  const factory ControlListBlocEvent.cantWorkInThisModeEvent() = CantWorkInThisModeEvent;
  const factory ControlListBlocEvent.refreshControlListEvent() = RefreshControlListEvent;
  const factory ControlListBlocEvent.loadNextPageControlListEvent() = LoadNextPageControlListEvent;
  
  const factory ControlListBlocEvent.changeFilters(ControlFiltersBlocState state) = ChangeFiltersEvent;
  const factory ControlListBlocEvent.changeSort(String state) = ChangeSortEvent;

  const factory ControlListBlocEvent.openInMapEvent(ControlObject object) = OpenInMapEvent;
  const factory ControlListBlocEvent.createViolationEvent(ControlObject object) = CreateViolationEvent;
  const factory ControlListBlocEvent.registerViolationEvent(ControlObject object, DCViolation violation) = RegisterViolationEvent;

  const factory ControlListBlocEvent.changeShowMapEvent(bool showMap) = ChangeShowMapEvent;
}