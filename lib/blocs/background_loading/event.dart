import 'package:async/async.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class BackgroundLoadingBlocEvent with _$BackgroundLoadingBlocEvent {
  const factory BackgroundLoadingBlocEvent.addOperationToQueueEvent(CancelableOperation operation) = AddOperationToQueueEvent;
  const factory BackgroundLoadingBlocEvent.updateStatusTextEvent(String text) = UpdateStatusTextEvent;
  const factory BackgroundLoadingBlocEvent.cancelEvent() = CancelEvent;
  const factory BackgroundLoadingBlocEvent.finishEvent() = FinishEvent;
}