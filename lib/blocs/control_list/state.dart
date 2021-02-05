import 'package:inspector/blocs/control_list/filter_state.dart';
import 'package:inspector/blocs/control_list/map_state.dart';
import 'package:inspector/blocs/control_list/sort_state.dart';
import 'package:inspector/model/control_object.dart';

abstract class ControlListBlocState {
  ControlListBlocState({
    this.filtersState,
    this.sortState,
    this.mapState,
    this.showMap,
  });

  final ControlObjectsFilterState filtersState;
  final ControlObjectsSortState sortState;
  final ControlObjectsMapState mapState;
  final bool showMap;
}

class CantWorkInThisModeState extends ControlListBlocState {
  CantWorkInThisModeState({
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) : super(
          filtersState: filtersState,
          sortState: sortState,
          mapState: mapState,
          showMap: showMap,
        );
}

class LoadingState extends ControlListBlocState {
  LoadingState({
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) : super(
          filtersState: filtersState,
          sortState: sortState,
          mapState: mapState,
          showMap: showMap,
        );
}

class RefreshState extends ControlListBlocState
    with StateWithControlObjectsList {
  RefreshState({
    this.objects,
    this.loadingFuture,
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) : super(
          filtersState: filtersState,
          sortState: sortState,
          mapState: mapState,
          showMap: showMap,
        );

  final List<ControlObject> objects;
  final Future loadingFuture;
}

class LoadedState extends ControlListBlocState
    with StateWithControlObjectsList {
  LoadedState({
    this.objects,
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) : super(
          filtersState: filtersState,
          sortState: sortState,
          mapState: mapState,
          showMap: showMap,
        );

  final List<ControlObject> objects;
}

class LoadedAllState extends LoadedState {
  LoadedAllState({
    this.objects,
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) : super(
          filtersState: filtersState,
          sortState: sortState,
          mapState: mapState,
          showMap: showMap,
        );

  final List<ControlObject> objects;
}

class LoadedEmptyState extends ControlListBlocState {
  LoadedEmptyState({
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    ControlObjectsMapState mapState,
    bool showMap,
  }) : super(
          filtersState: filtersState,
          sortState: sortState,
          mapState: mapState,
          showMap: showMap,
        );
}

mixin StateWithControlObjectsList {
  int get objectsCount => objects.length;
  List<ControlObject> get objects;
}
