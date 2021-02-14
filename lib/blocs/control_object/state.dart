import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlObjectBlocState with _$ControlObjectBlocState {
  const factory ControlObjectBlocState.loadingState({
    ControlObject object,
  }) = LoadingState;

  const factory ControlObjectBlocState.loadedWithListState({
    ControlObject object,
    List<ControlResultSearchResult> controlSearchResults,
  }) = LoadedWithListState;

  const factory ControlObjectBlocState.loadedState({
    ControlObject object,
  }) = LoadedState;
}
