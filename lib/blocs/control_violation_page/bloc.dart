import 'dart:async';
import 'dart:core';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_page/event.dart';
import 'package:inspector/blocs/control_violation_page/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/perform_control_search_result.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class ControlViolationPageBloc
    extends Bloc<ControlViolationPageBlocEvent, ControlViolationPageBlocState> {
  ControlViolationPageBloc(
    this.controlObject,
    this.searchResult,
    this.departmentControlService,
    this.notificationBloc,
    this.networkStatusService,
  ) : super(
          ControlViolationPageBlocState.initialState(
            controlObject: controlObject,
            searchResult: searchResult,
          ),
        ) {
    _initialperformControls = searchResult.violation.performControls ??
        List<PerformControlSearchResult>();
    add(ControlViolationPageBlocEvent.refresh());
    _networkStatusStreamSubscription =
        networkStatusService.listenNetworkStatus.listen((value) {
      _networkStatus = value;
    });
  }

  final DepartmentControlService departmentControlService;
  final NotificationBloc notificationBloc;
  final NetworkStatusService networkStatusService;

  final ControlObject controlObject;
  final ControlResultSearchResult searchResult;

  List<PerformControlSearchResult> _initialperformControls;

  List<PerformControlSearchResult> _updatedperformControls =
      List<PerformControlSearchResult>();
  List<PerformControlSearchResult> _removedPerformCotronls =
      List<PerformControlSearchResult>();

  NetworkStatus _networkStatus;
  StreamSubscription<NetworkStatus> _networkStatusStreamSubscription;

  @override
  Stream<ControlViolationPageBlocState> mapEventToState(
          ControlViolationPageBlocEvent event) =>
      event.map(
        createPerformControl: (event) async* {
          notificationBloc.add(SnackBarNotificationEvent('Сохранение данных'));
          try {
            await departmentControlService.registerPerformControl(
              controlObject,
              searchResult.id,
              event.performControl,
              _networkStatus,
            );
            yield ControlViolationPageBlocState.initialState(
              controlObject: state.controlObject,
              searchResult: state.searchResult,
            );
            notificationBloc
                .add(OkDialogNotificationEvent('Успешно сохранено'));
          } on ApiException catch (e) {
            print(e.message);
            print(e.details);
            notificationBloc.add(SnackBarNotificationEvent(
                'Произошла ошибка: ${e.message}, ${e.details}'));
          }
        },
        discardChanges: (event) async* {
          _updatedperformControls = List<PerformControlSearchResult>();
          _removedPerformCotronls = List<PerformControlSearchResult>();
          yield ControlViolationPageBlocState.loadedState(
            controlObject: state.controlObject,
            searchResult: state.searchResult.copyWith
                .violation(performControls: _initialperformControls),
            hasUnsavedChanges: false,
            editable: true,
          );
        },
        editPerformControl: (event) async* {
          if (state is LoadedControlViolationPageBlocState || state.refresh) {
            _updatedperformControls.add(event.performControl);
            yield state.copyWith.searchResult.violation(
              performControls: state.searchResult.violation.performControls
                  .map((x) => x.id != event.performControl.id
                      ? x
                      : event.performControl)
                  .toList(),
            );
            yield ControlViolationPageBlocState.loadedState(
              controlObject: state.controlObject,
              searchResult: state.searchResult.copyWith.violation(
                performControls: state.searchResult.violation.performControls
                    .map((x) => x.id != event.performControl.id
                        ? x
                        : event.performControl)
                    .toList(),
              ),
              hasUnsavedChanges: true,
              editable: true,
            );
          } else {
            notificationBloc.add(SnackBarNotificationEvent(
                'Редактирование доступно только после загрузки'));
          }
        },
        extendPeriod: (event) async* {
          try {
            notificationBloc
                .add(SnackBarNotificationEvent('Сохранение данных'));
            await departmentControlService.extendPeriod(
              controlObject,
              searchResult.id,
              event.extensionPeriod,
              _networkStatus,
            );
            notificationBloc
                .add(OkDialogNotificationEvent('Успешно сохранено'));
          } on ApiException catch (e) {
            print(e.message);
            print(e.details);
            notificationBloc.add(SnackBarNotificationEvent(
                'Произошла ошибка: ${e.message}, ${e.details}'));
          }
        },
        refresh: (event) async* {
          yield state.copyWith(refresh: true);
          yield ControlViolationPageBlocState.loadedState(
            controlObject: state.controlObject,
            searchResult: await departmentControlService.getControlResult(
              state.controlObject,
              state.searchResult,
              _networkStatus,
            ),
            editable: true,
          );
        },
        removePerformControl: (event) async* {
          if (state is LoadedControlViolationPageBlocState || state.refresh) {
            _updatedperformControls.remove(event.performControl);
            _removedPerformCotronls.add(event.performControl);
            state.searchResult.violation.performControls
                .remove(event.performControl);
            yield ControlViolationPageBlocState.loadedState(
              controlObject: state.controlObject,
              searchResult: state.searchResult,
              hasUnsavedChanges: true,
              editable: true,
            );
          } else {
            notificationBloc.add(SnackBarNotificationEvent(
                'Редактирование доступно только после загрузки'));
          }
        },
        saveChanges: (event) async* {
          notificationBloc.add(SnackBarNotificationEvent('Сохранение данных'));
          await sendUpdated();
          await sendRemoved();
          _initialperformControls =
              state.searchResult.violation.performControls;
          notificationBloc.add(OkDialogNotificationEvent('Успешно сохранено'));
          yield ControlViolationPageBlocState.initialState(
            controlObject: state.controlObject,
            searchResult: state.searchResult,
          );
        },
      );

  Future<void> sendUpdated() async {
    _updatedperformControls.forEach(
      (x) async {
        try {
          await departmentControlService.updatePerformControl(
            controlObject,
            searchResult.id,
            convert(x),
            _networkStatus,
          );
        } on ApiException catch (e) {
          print(e.message);
          print(e.details);
          notificationBloc.add(SnackBarNotificationEvent(
              'Произошла ошибка: ${e.message}, ${e.details}'));
        }
      },
    );
    _updatedperformControls = List<PerformControlSearchResult>();
  }

  Future<void> sendRemoved() async {
    _removedPerformCotronls.forEach(
      (x) async {
        try {
          await departmentControlService.removePerformControl(
            controlObject,
            searchResult.id,
            convert(x),
            _networkStatus,
          );
        } on ApiException catch (e) {
          print(e.message);
          print(e.details);
          notificationBloc.add(SnackBarNotificationEvent(
              'Произошла ошибка: ${e.message}, ${e.details}'));
        }
      },
    );
    _removedPerformCotronls = List<PerformControlSearchResult>();
  }

  PerformControl convert(PerformControlSearchResult performControl) =>
      PerformControl(
        id: performControl.id,
        factDate: performControl.factDate,
        photos: performControl.photos,
        planDate: performControl.planDate,
        resolved: performControl.resolved,
      );

  @override
  Future<void> close() async {
    await super.close();
    _networkStatusStreamSubscription.cancel();
  }
}
