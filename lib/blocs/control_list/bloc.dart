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
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/services/location/location_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:intl/intl.dart';

class ControlListBloc extends Bloc<ControlListBlocEvent, ControlListBlocState> {
  static const pageCapacity = 10;

  final LocationService _locationService;
  StreamSubscription<Location> _locationStreamSubscription;
  StreamSubscription<NetworkStatus> _networkStatusStreamSubscription;

  final DepartmentControlService _departmentControlService;
  final NotificationBloc _notificationBloc;

  NetworkStatus _networkStatus;
  final NetworkStatusService networkStatusService;

  List<ControlObject> _objects;
  Location _location;

  ControlListBloc(
    this._departmentControlService,
    this.networkStatusService,
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
      add(ControlListBlocEvent.changeNetworkStatusEvent(value));
    });
    _locationStreamSubscription = _locationService.subscribeToLocation.listen((location) {
      _location = location;
    });
  }

  @override
  Stream<ControlListBlocState> mapEventToState(ControlListBlocEvent event) =>
      event.map(
        loadControlListEvent: _onLoadControlListEvent,
        cantWorkInThisModeEvent: _onCantWorkInThisModeEvent,
        loadNextPageControlListEvent: _onLoadNextPageEvent,
        selectControlObject: _onSelectControlObject,
        changeFilters: _onChangeFilters,
        changeSort: _onChangeSort,
        refreshControlListEvent: _onRefreshControlListEvent,
        changeShowMapEvent: _onChangeShowMapEvent,
        openInMapEvent: _onOpenInMapEvent,
        registerSearchResultEvent: _onRegisterSearchResultEvent,
        removePerformControlEvent: _onRemovePerformControlEvent,
        registerPerformControlEvent: onRegisterPerformControlEvent,
        updatePerformControlEvent: onUpdatePerformControlEvent,
        updateResolveDateEvent: _onUpdateResolveDateEvent,
        removeViolationEvent: _onRemoveViolationEvent,
        updateControlResultEvent: _onUpdateControlResultEvent,
        changeNetworkStatusEvent: (event) async* {},
      );

  Stream<ControlListBlocState> _onUpdateControlResultEvent(event) async* {
    try {
      _notificationBloc
          .add(SnackBarNotificationEvent('Обновление результата обследования'));
      await _departmentControlService.updateControlResult(
        event.object,
        event.controlResultId,
        event.violation,
        _networkStatus,
      );
      _notificationBloc.add(OkDialogNotificationEvent('Обновлено успешно'));
    } on ApiException catch (e) {
      print(e.message);
      print(e.details);
      yield* (_onApiException(e));
    }
  }

  Stream<ControlListBlocState> _onRemoveViolationEvent(event) async* {
    try {
      await _departmentControlService.removeControlResult(
        event.object,
        event.violationId,
        _networkStatus,
      );
      _notificationBloc.add(OkDialogNotificationEvent('Удалено успешно'));
    } on ApiException catch (e) {
      print(e.message);
      print(e.details);
      yield* (_onApiException(e));
    }
  }

  Stream<ControlListBlocState> _onUpdateResolveDateEvent(event) async* {
    _notificationBloc.add(OkDialogNotificationEvent('Функционал в разработке'));
  }

  Stream<ControlListBlocState> onUpdatePerformControlEvent(event) async* {
    try {
      await _departmentControlService.updatePerformControl(
        event.object,
        event.controlResultId,
        event.performControl,
        _networkStatus,
      );
      _notificationBloc.add(OkDialogNotificationEvent('Обновлено успешно'));
    } on ApiException catch (e) {
      print(e.message);
      print(e.details);
      yield* (_onApiException(e));
    }
  }

  Stream<ControlListBlocState> onRegisterPerformControlEvent(
      RegisterPerformControlEvent event) async* {
    if (!_checkIfCanCreatePerformControl(event.performControl)) {
      _notificationBloc.add(OkDialogNotificationEvent(
          'На ${DateFormat("dd.MM.yyyy").format(DateTime.now())} уже зарегистрирован контроль устранения'));
    } else {
      try {
        await _departmentControlService.registerPerformControl(
          event.object,
          event.controlResultId,
          event.performControl,
          _networkStatus,
        );
        _notificationBloc.add(OkDialogNotificationEvent('Сохранено успешно'));
      } on ApiException catch (e) {
        print(e.message);
        print(e.details);
        yield* (_onApiException(e));
      }
    }
  }

  Stream<ControlListBlocState> _onRemovePerformControlEvent(event) async* {
    try {
      _notificationBloc
          .add(SnackBarNotificationEvent('Удаление контроля устранения'));
      await _departmentControlService.removePerformControl(
        event.object,
        event.controlResultId,
        event.performControl,
        _networkStatus,
      );
      _notificationBloc.add(OkDialogNotificationEvent('Удалено успешно'));
    } on ApiException catch (e) {
      print(e.message);
      print(e.details);
      yield* (_onApiException(e));
    }
  }

  Stream<ControlListBlocState> _onRegisterSearchResultEvent(
      RegisterSearchResultEvent event) async* {
    yield* _checkIfThereAreViolations(
      () async* {
        _notificationBloc.add(
            SnackBarNotificationEvent('Сохранение результата обследования'));
        ControlResult result = ControlResult(
          violation: event.violation,
          surveyDate: DateTime.now(),
          violationExists: event.violation != null,
        );
        try {
          await _departmentControlService.registerControlResult(
            event.object,
            result,
            _networkStatus,
          );
          final resultString = event.violation == null
              ? 'Нарушений не выявлено'
              : 'Выявлено нарушение';
          _notificationBloc.add(SnackBarNotificationEvent(
              'Результат обследования "$resultString" сохранен успешно'));
        } on ApiException catch (e) {
          print(e.message);
          print(e.details);
          yield* (_onApiException(e));
        } on Exception catch (e) {
          print(e);
          _notificationBloc.add(SnackBarNotificationEvent(e.toString()));
        }
      },
      event.object,
      violationExists: event.violation != null,
    );
  }

  Stream<ControlListBlocState> _onOpenInMapEvent(OpenInMapEvent event) async* {
    if (event.object.geometry == null || event.object.geometry.isEmpty) {
      _notificationBloc.add(SnackBarNotificationEvent(
          'Просмотр этого объекта на карте недоступен'));
    } else {
      _location = Location(
        latitude: event.object.geometry.first.points.first.x,
        longitude: event.object.geometry.first.points.first.y,
      );
      yield state.copyWith(
        showMap: true,
        mapState: state.mapState.copyWith(
          selectedObject: event.object,
        ),
      );
    }
  }

  Stream<ControlListBlocState> _onChangeShowMapEvent(ChangeShowMapEvent event) async* {
    yield state.copyWith(
      showMap: event.showMap,
      mapState: state.mapState.copyWith(
        userLocation: this.location,
        selectedObject: null,
      ),
    );
  }

  Stream<ControlListBlocState> _onRefreshControlListEvent(event) async* {
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
  }

  Stream<ControlListBlocState> _onChangeSort(event) async* {
    yield (state.copyWith(
      sortState: event.state,
    ));
    print('Sorting');
    add(RefreshControlListEvent());
  }

  Stream<ControlListBlocState> _onChangeFilters(event) async* {
    yield (state.copyWith(filtersState: event.state));
    print('Filtering');
    add(RefreshControlListEvent());
  }

  Stream<ControlListBlocState> _onSelectControlObject(event) async* {
    yield (state.copyWith(
      mapState: ControlObjectsMapState(selectedObject: event.object),
    ));
  }

  Stream<ControlListBlocState> _onLoadControlListEvent(
      LoadControlListEvent event) async* {
    print('Loading');
    if (_networkStatus == null) {
      _networkStatus = await networkStatusService.actual;
    }
    _objects = await _departmentControlService.find(
        //Location(latitude: 55.74, longitude: 37.63),
        this.location,
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
        this.location,
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

  Location get location => _location ?? Location.noLocationProvided();

  Stream<ControlListBlocState> _checkIfThereAreViolations(
    Stream<ControlListBlocState> Function() f,
    ControlObject object, {
    bool violationExists,
  }) async* {
    // _notificationBloc.add(
    //     SnackBarNotificationEvent('Проверка на наличие связанных нарушений'));
    try {
      final checkResult = await _departmentControlService.checkIfViolationsExists(
        object,
        _networkStatus,
        violationExists: violationExists,
      );
      if (!checkResult) {
      // if(true) {
        yield* f();
      } else {
        _notificationBloc.add(OkDialogNotificationEvent(
            'У объекта присутствует связанное нарушение на текущую дату'));
      }
    } on ApiException catch (e) {
      yield* _onApiException(e);
    } on Exception catch (e) {
      print(e);
    }
  }

  bool _checkIfCanCreatePerformControl(PerformControl performControl) {
    if (performControl.factDate.difference(DateTime.now()).inDays < 1) {
      return false;
    }
    return true;
  }

  @override
  Future<void> close() async {
    await super.close();
    _networkStatusStreamSubscription.cancel();
    _locationStreamSubscription.cancel();
  }
}
