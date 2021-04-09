import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_object_filters/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlObjectBlocState with _$ControlObjectBlocState {
  const factory ControlObjectBlocState.loadingState({
    ControlObject object,
    ControlObjectFilters filters,
  }) = LoadingState;

  const factory ControlObjectBlocState.loadedWithListState({
    ControlObject object,
    List<ControlResultSearchResult> controlSearchResults,
    ControlObjectFilters filters,
  }) = LoadedWithListState;

  const factory ControlObjectBlocState.loadedState({
    ControlObject object,
    bool needRefresh,
    ControlObjectFilters filters,
  }) = LoadedState;
}
