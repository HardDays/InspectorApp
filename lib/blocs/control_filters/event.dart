import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_filters/state.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlFiltersBlocEvent with _$ControlFiltersBlocEvent {

  const factory ControlFiltersBlocEvent.copyState(ControlFiltersBlocState state) = CopyStateEvent;
  // const factory ControlFiltersBlocEvent.changeDCObjectKind({DCObjectType type}) = ChangeDCObjectTypeEvent;


}