import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlViolationPageBlocState with _$ControlViolationPageBlocState {
  const factory ControlViolationPageBlocState.initialState({
    ControlObject controlObject,
    ControlResultSearchResult searchResult,
    @Default(false) bool refresh,
  }) = InitialControlViolationPageBlocState;

  const factory ControlViolationPageBlocState.loadedState({
    ControlObject controlObject,
    ControlResultSearchResult searchResult,
    @Default(false) bool refresh,
    @Default(false) bool hasUnsavedChanges,
    @Default(false) bool editable,
  }) = LoadedControlViolationPageBlocState;
}