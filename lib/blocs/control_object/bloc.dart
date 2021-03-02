import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_object/event.dart';
import 'package:inspector/blocs/control_object/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class ControlObjectBloc
    extends Bloc<ControlObjectBlocEvent, ControlObjectBlocState> {
  ControlObjectBloc({
    @required this.object,
    @required this.departmentControlService,
    @required this.notificationBloc,
    @required this.networkStatusService,
  }) : super(ControlObjectBlocState.loadedState(
          object: object,
          needRefresh: true,
        )) {
    _networkStatusStreamSubscription =
        networkStatusService.listenNetworkStatus.listen((value) {
      _networkStatus = value;
    });
  }

  final ControlObject object;
  final DepartmentControlService departmentControlService;
  final NotificationBloc notificationBloc;
  final NetworkStatusService networkStatusService;

  NetworkStatus _networkStatus;
  StreamSubscription<NetworkStatus> _networkStatusStreamSubscription;

  @override
  Stream<ControlObjectBlocState> mapEventToState(
          ControlObjectBlocEvent event) =>
      event.map(
        loadEvent: (event) async* {
          yield (ControlObjectBlocState.loadingState(object: object));
          final results = await departmentControlService.getControlResults(
              object, _networkStatus);
          yield* (results.map(
            controlResultsListResponse: (response) async* {
              yield (ControlObjectBlocState.loadedWithListState(
                object: object,
                controlSearchResults: response.results,
              ));
            },
            emptyResultsListResponse: (response) async* {
              yield (ControlObjectBlocState.loadedState(
                object: object,
                needRefresh: false,
              ));
            },
            exceptionResponse: (response) async* {
              notificationBloc.add(
                SnackBarNotificationEvent(
                  'При загрузке информации о нарушениях произошла ошибка ${response.e.message}: ${response.e.details}',
                ),
              );
              yield (ControlObjectBlocState.loadedState(
                object: object,
                needRefresh: false,
              ));
            },
          ));
        },
      );

  @override
  Future<void> close() async {
    await super.close();
    _networkStatusStreamSubscription.cancel();
  }
}
