import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlObjectBlocEvent with _$ControlObjectBlocEvent {
  const factory ControlObjectBlocEvent.loadEvent() = _LoadEvent;
}