import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/map_state.dart';
import 'package:inspector/blocs/control_list/sort_state.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/model/department_control/control_object.dart';
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
  final NotificationBloc _notificationBloc;

  NetworkStatus _networkStatus;

  List<ControlObject> _objects;
  Location _location;

  ControlListBloc(
    this._departmentControlService,
    NetworkStatusService networkStatusService,
    this._locationService,
    this._notificationBloc,
  ) : super(
          ControlListBlocState(
            filtersState: ControlFiltersBlocState(
                searchRadius: 500,
                daysFromLastSurvey: 7,
                camerasExist: true,
                ignoreViolations: false),
            listState: ControlObjectsListState.loadingListState(),
            mapState: ControlObjectsMapState(),
            showMap: false,
            sortState: ControlObjectSortStrings.lastSurveyDate,
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
    try {
      yield* (event.map(
        loadControlListEvent: _onLoadControlListEvent,
        cantWorkInThisModeEvent: _onCantWorkInThisModeEvent,
        loadNextPageControlListEvent: _onLoadNextPageEvent,
        changeFilters: (event) async* {
          yield (state.copyWith(
            filtersState: event.state,
          ));
          print('Filtering');
          add(LoadControlListEvent());
        },
        changeSort: (event) async* {
          yield (state.copyWith(
            sortState: event.state,
          ));
          print('Sorting');
          add(LoadControlListEvent());
        },
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
        },
        openInMapEvent: (OpenInMapEvent event) async* {
          if (event.object.geometry == null) {
            _notificationBloc.add(SnackBarNotificationEvent(
                'Просмотр этого объекта на карте недоступен'));
          } else {
            _notificationBloc.add(SnackBarNotificationEvent(
                'Данный функционал пока не реализован'));
          }
        },
        createViolationEvent: (event) async* {},
      ));
    } on ApiException catch (e) {
      print(e.message);
      print(e.details);
      yield* (_onApiException(e));
    }
  }

  Stream<ControlListBlocState> _onLoadControlListEvent(
      LoadControlListEvent event) async* {
    print('Loading');
    _location = await _locationService.actualLocation;
    _objects = await _departmentControlService.find(
        Location(latitude: 55.74, longitude: 37.63),
        //_location,
        _networkStatus,
        state.filtersState,
        state.sortState,
        0,
        pageCapacity);
    if (_objects.length > 0) {
      if (_objects.length < pageCapacity) {
        yield (state.copyWith(
          listState: ControlObjectsListState.loadedAllListState(
              objects: _objects, refresh: false),
        ));
      } else {
        yield (state.copyWith(
          listState: ControlObjectsListState.loadedListState(
              objects: _objects, refresh: false),
        ));
      }
      print('Loaded');
    } else {
      yield (state.copyWith(
        listState: ControlObjectsListState.emptyListLoadedState(refresh: false),
      ));
      print('Loaded');
    }
  }

  Stream<ControlListBlocState> _onApiException(ApiException exception) async* {
    if (state.listState.maybeMap(
      emptyListLoadedState: (state) => true,
      loadingListState: (state) => true,
      orElse: () => false,
    )) {
      yield (_createApiExceptionState(exception, state));
    } else {
      _notificationBloc.add(SnackBarNotificationEvent(
          'Произошла ошибка: ${exception.message}, ${exception.details}'));
    }
  }

  ControlListBlocState _createApiExceptionState(
          ApiException exception, ControlListBlocState prev) =>
      ControlListBlocState.apiExceptionState(
        exception: exception,
        filtersState: prev.filtersState,
        listState: prev.listState,
        mapState: prev.mapState,
        showMap: prev.showMap,
        sortState: prev.sortState,
      );

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
    final _newObjects = await _departmentControlService.find(
        _location,
        _networkStatus,
        state.filtersState,
        state.sortState,
        _objects.length,
        _objects.length + pageCapacity);
    if (_newObjects.length == 0 || _newObjects.length < pageCapacity) {
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
  }

  @override
  Future<void> close() async {
    await super.close();
    _networkStatusStreamSubscription.cancel();
  }
}
