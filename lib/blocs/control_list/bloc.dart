import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/filter_state.dart';
import 'package:inspector/blocs/control_list/map_state.dart';
import 'package:inspector/blocs/control_list/sort_state.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/services/location/location_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class ControlListBloc extends Bloc<ControlListBlocEvent, ControlListBlocState> {
  static const pageCapacity = 10;

  final LocationService _locationService;
  StreamSubscription<NetworkStatus> _networkStatusStreamSubscription;

  final DepartmentControlService _departmentControlService;

  ControlObjectsFilterState _filterState = ControlObjectsFilterState();
  ControlObjectsMapState _mapState = ControlObjectsMapState();
  ControlObjectsSortState _sortState = ControlObjectsSortState();
  bool showMap = false;
  NetworkStatus _networkStatus;

  List<ControlObject> _objects;
  Location _location;
  bool _isLoading = false;

  ControlListBloc(
    this._departmentControlService,
    NetworkStatusService networkStatusService,
    this._locationService,
  ) : super(LoadingState()) {
    add(ControlListBlocEvent.loadControlListEvent());
    _networkStatusStreamSubscription =
        networkStatusService.listenNetworkStatus.listen((value) {
      _networkStatus = value;
      if (value.connectionStatus == ConnectionStatus.offline) {
        //value.dataSendingMode == DataSendingMode.manual) {
        add(ControlListBlocEvent.cantWorkInThisModeEvent());
      } else {
        add(ControlListBlocEvent.loadControlListEvent());
      }
    });
  }

  @override
  Stream<ControlListBlocState> mapEventToState(
      ControlListBlocEvent event) async* {
    yield* (event.map(
      loadControlListEvent: _onLoadControlListEvent,
      cantWorkInThisModeEvent: _onCantWorkInThisModeEvent,
      loadNextPageControlListEvent: _onLoadNextPageEvent,
      refreshControlListEvent: (event) async* {
        yield* (_onLoadControlListEvent(null));
      },
    ));
  }

  Stream<ControlListBlocState> _onLoadControlListEvent(
      LoadControlListEvent event) async* {
    try {
      if (!_isLoading) {
        _isLoading = true;
        yield (LoadingState(
          filtersState: _filterState,
          mapState: _mapState,
          sortState: _sortState,
          showMap: showMap,
        ));
        _location = await _locationService.actualLocation;
        _objects = await _departmentControlService.find(_location,
            _networkStatus, _filterState, _sortState, 0, pageCapacity);
        if (_objects.length > 0) {
          yield (LoadedState(
            objects: _objects,
            filtersState: _filterState,
            mapState: _mapState,
            sortState: _sortState,
            showMap: showMap,
          ));
        } else {
          yield (LoadedEmptyState(
            filtersState: _filterState,
            mapState: _mapState,
            sortState: _sortState,
            showMap: showMap,
          ));
        }
        _isLoading = false;
      }
    } on ApiException catch (e) {
      print(e.message);
      print(e.details);
    }
  }

  Stream<ControlListBlocState> _onCantWorkInThisModeEvent(
      CantWorkInThisModeEvent event) async* {
    yield (CantWorkInThisModeState(
      filtersState: _filterState,
      mapState: _mapState,
      sortState: _sortState,
      showMap: showMap,
    ));
  }

  Stream<ControlListBlocState> _onLoadNextPageEvent(
      LoadNextPageControlListEvent event) async* {
    if (!_isLoading) {
      _isLoading = true;
      final _newObjects = await _departmentControlService.find(
          _location,
          _networkStatus,
          _filterState,
          _sortState,
          _objects.length,
          _objects.length + pageCapacity);
      if (_newObjects.length == 0) {
        yield (LoadedAllState(
          objects: _objects,
          filtersState: _filterState,
          mapState: _mapState,
          sortState: _sortState,
          showMap: showMap,
        ));
      } else {
        _objects += _newObjects;
        yield (LoadedState(
          objects: _objects,
          filtersState: _filterState,
          mapState: _mapState,
          sortState: _sortState,
          showMap: showMap,
        ));
      }
      _isLoading = false;
    }
  }

  @override
  Future<void> close() async {
    await super.close();
    _networkStatusStreamSubscription.cancel();
  }
}
