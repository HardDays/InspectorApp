import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_object_filters/state.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlObjectBlocEvent with _$ControlObjectBlocEvent {
  const factory ControlObjectBlocEvent.loadEvent() = LoadEvent;
  const factory ControlObjectBlocEvent.changeFitersEvent(ControlObjectFilters filters) = ChangeFitersEvent;
}