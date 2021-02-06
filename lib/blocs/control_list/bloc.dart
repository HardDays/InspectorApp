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

  NetworkStatus _networkStatus;

  List<ControlObject> _objects;
  Location _location;
  bool _isLoading = false;

  ControlListBloc(
    this._departmentControlService,
    NetworkStatusService networkStatusService,
    this._locationService,
  ) : super(
          ControlListBlocState(
            filtersState: ControlObjectsFilterState(),
            listState: ControlObjectsListState.loadingListState(),
            mapState: ControlObjectsMapState(),
            showMap: false,
            sortState: ControlObjectsSortState.byLastSurveyDate,
          ),
        ) {
    add(ControlListBlocEvent.loadControlListEvent());
    _networkStatusStreamSubscription =
        networkStatusService.listenNetworkStatus.listen((value) {
      _networkStatus = value;
      if (value.connectionStatus == ConnectionStatus.offline) {
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
          yield (state.copyWith(
              listState: state.listState.maybeMap(
            emptyListLoadedState: (emptyListLoadedState) =>
                emptyListLoadedState.copyWith(refresh: true),
            loadedAllListState: (loadedAllListState) =>
                loadedAllListState.copyWith(refresh: true),
            loadedListState: (loadedListState) =>
                loadedListState.copyWith(refresh: true),
            orElse: () => state.listState,
          )));
          print('Refreshing');
          add(LoadControlListEvent());
        },
        changeShowMapEvent: (event) async* {
          yield (state.copyWith(showMap: event.showMap));
        }));
  }

  Stream<ControlListBlocState> _onLoadControlListEvent(
      LoadControlListEvent event) async* {
    try {
      print('Loading');
      if (!_isLoading) {
        _isLoading = true;
        _location = await _locationService.actualLocation;
        _objects = await _departmentControlService.find(
            _location,
            _networkStatus,
            state.filtersState,
            state.sortState,
            0,
            pageCapacity);
        if (_objects.length > 0) {
          yield (state.copyWith(
            listState: ControlObjectsListState.loadedListState(
                objects: _objects, refresh: false),
          ));
          print('Loaded');
        } else {
          yield (state.copyWith(
            listState:
                ControlObjectsListState.emptyListLoadedState(refresh: false),
          ));
          print('Loaded');
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
    if (!(state.listState is LoadedListState ||
        state.listState is LoadedAllListState)) {
      yield (ControlListBlocState.cantWorkInThisModeState(
        filtersState: state.filtersState,
        listState: state.listState,
        mapState: state.mapState,
        showMap: state.showMap,
        sortState: state.sortState,
      ));
    }
  }

  Stream<ControlListBlocState> _onLoadNextPageEvent(
      LoadNextPageControlListEvent event) async* {
    if (!_isLoading) {
      _isLoading = true;
      final _newObjects = await _departmentControlService.find(
          _location,
          _networkStatus,
          state.filtersState,
          state.sortState,
          _objects.length,
          _objects.length + pageCapacity);
      if (_newObjects.length == 0) {
        yield (state.copyWith(
          listState: ControlObjectsListState.loadedAllListState(
              objects: _objects, refresh: false),
        ));
      } else {
        _objects += _newObjects;
        yield (state.copyWith(
          listState: ControlObjectsListState.loadedListState(
              objects: _objects, refresh: false),
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
