import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/control_object.dart';

part 'map_state.freezed.dart';

@freezed
abstract class ControlObjectsMapState with _$ControlObjectsMapState {
  const factory ControlObjectsMapState({
    ControlObject selectedObject
  }) = _ControlObjectsMapState;
}