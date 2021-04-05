import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlBackgroundServiceBlocEvent with _$ControlBackgroundServiceBlocEvent {
  const factory ControlBackgroundServiceBlocEvent.initEvent() = InitEvent;
  const factory ControlBackgroundServiceBlocEvent.acceptLoadingEvent(bool loadSearchResults) = AcceptLoadingEvent;
  const factory ControlBackgroundServiceBlocEvent.cancelLoadingEvent() = CancelLoadingEvent;
}