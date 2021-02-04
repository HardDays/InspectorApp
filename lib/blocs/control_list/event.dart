import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlListBlocEvent with _$ControlListBlocEvent {
  const factory ControlListBlocEvent.loadControlListEvent() = _LoadControlListEvent;
  const factory ControlListBlocEvent.cantWorkInThisModeEvent() = _CantWorkInThisModeEvent;
}