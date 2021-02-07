import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/control_object.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlListBlocEvent with _$ControlListBlocEvent {
  const factory ControlListBlocEvent.loadControlListEvent() = LoadControlListEvent;
  const factory ControlListBlocEvent.cantWorkInThisModeEvent() = CantWorkInThisModeEvent;
  const factory ControlListBlocEvent.refreshControlListEvent() = RefreshControlListEvent;
  const factory ControlListBlocEvent.loadNextPageControlListEvent() = LoadNextPageControlListEvent;

  const factory ControlListBlocEvent.openInMapEvent(ControlObject object) = OpenInMapEvent;

  const factory ControlListBlocEvent.changeShowMapEvent(bool showMap) = ChangeShowMapEvent;
}