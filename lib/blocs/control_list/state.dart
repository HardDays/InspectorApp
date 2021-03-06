import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/blocs/control_list/map_state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlListBlocState with _$ControlListBlocState {
  const factory ControlListBlocState.cantWorkInThisModeState({
    ControlObjectsListState listState,
    ControlFiltersBlocState filtersState,
    String sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) = CantWorkInThisModeState;

  const factory ControlListBlocState({
    ControlObjectsListState listState,
    ControlFiltersBlocState filtersState,
    String sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) = _ControlListBlocState;

  const factory ControlListBlocState.apiExceptionState({
    ControlObjectsListState listState,
    ControlFiltersBlocState filtersState,
    String sortState,
    ControlObjectsMapState mapState,
    bool showMap,
    ApiException exception,
  }) = _ControlListApiExceptionBlocState;

}

@freezed
abstract class ControlObjectsListState implements _$ControlObjectsListState {

  const ControlObjectsListState._();

  const factory ControlObjectsListState.emptyListLoadedState({
    bool refresh,
  }) = EmptyListLoadedState;

  const factory ControlObjectsListState.loadingListState() = LoadingListState;
  
  const factory ControlObjectsListState.loadedListState({
    List<ControlObject> objects,
    bool refresh,
  }) = LoadedListState;

  const factory ControlObjectsListState.loadedAllListState({
    List<ControlObject> objects,
    bool refresh,
  }) = LoadedAllListState;

  bool get refresh => false;

}
