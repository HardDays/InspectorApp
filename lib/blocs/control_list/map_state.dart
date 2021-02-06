import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_state.freezed.dart';

@freezed
abstract class ControlObjectsMapState with _$ControlObjectsMapState {
  const factory ControlObjectsMapState() = _ControlObjectsMapState;
}