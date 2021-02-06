import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
abstract class ControlObjectsFilterState with _$ControlObjectsFilterState {
  const factory ControlObjectsFilterState() = _ControlObjectsFilterState;
}