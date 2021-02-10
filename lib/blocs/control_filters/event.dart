import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/dc_object_type.dart';
import 'package:inspector/model/department_control/control_object.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlFiltersBlocEvent with _$ControlFiltersBlocEvent {

  const factory ControlFiltersBlocEvent.copyState(ControlFiltersBlocState state) = CopyStateEvent;
  // const factory ControlFiltersBlocEvent.changeDCObjectKind({DCObjectType type}) = ChangeDCObjectTypeEvent;


}