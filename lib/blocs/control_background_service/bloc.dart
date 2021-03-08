import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/background_loading/bloc.dart';
import 'package:inspector/blocs/background_loading/event.dart';
import 'package:inspector/blocs/control_background_service/event.dart';
import 'package:inspector/blocs/control_background_service/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class ControlBackgroundServiceBloc extends Bloc<
    ControlBackgroundServiceBlocEvent, ControlBackgroundServiceBlocState> {
  ControlBackgroundServiceBloc({
    this.departmentControlService,
    this.notificationBloc,
    this.backgroundLoadingBloc,
    this.networkStatusService,
  }) : super(ControlBackgroundServiceBlocState.emptyState()) {
    add(ControlBackgroundServiceBlocEvent.initEvent());
    _networkStatusStreamSubscription =
        networkStatusService.listenNetworkStatus.listen((value) {
      _networkStatus = value;
    });
  }

  final DepartmentControlService departmentControlService;
  final NotificationBloc notificationBloc;
  final BackgroundLoadingBloc backgroundLoadingBloc;
  final NetworkStatusService networkStatusService;

  StreamSubscription<NetworkStatus> _networkStatusStreamSubscription;
  NetworkStatus _networkStatus;

  @override
  Stream<ControlBackgroundServiceBlocState> mapEventToState(
          ControlBackgroundServiceBlocEvent event) =>
      event.map(
        initEvent: _onInitEvent,
        acceptLoadingEvent: _onAcceptLoadingEvent,
        cancelLoadingEvent: _onCancelLoadingEvent,
      );

  Stream<ControlBackgroundServiceBlocState> _onInitEvent(
      InitEvent event) async* {
    if (_networkStatus?.connectionStatus == ConnectionStatus.online) {
      final metadata = await departmentControlService.localMetadata;
      if (metadata.loaded) {
        yield ControlBackgroundServiceBlocState.loaded(
            metadata.lastUpdatedDate);
      } else {
        yield ControlBackgroundServiceBlocState.notLoaded();
      }
    }
  }

  Stream<ControlBackgroundServiceBlocState> _onAcceptLoadingEvent(
      AcceptLoadingEvent event) async* {
    backgroundLoadingBloc.add(
        BackgroundLoadingBlocEvent.addOperationToQueueEvent(
            _cancelableOperation));
  }

  Stream<ControlBackgroundServiceBlocState> _onCancelLoadingEvent(
      CancelLoadingEvent event) async* {}

  CancelableOperation get _cancelableOperation =>
      CancelableOperation.fromFuture(
        Future(() async {
          backgroundLoadingBloc.add(
            BackgroundLoadingBlocEvent.updateStatusTextEvent(
              'Идет загрузка объектов ведомственного контроля',
            ),
          );
          await departmentControlService.saveControlObjectsLocally((count) {
            backgroundLoadingBloc.add(
              BackgroundLoadingBlocEvent.updateStatusTextEvent(
                'Загружено $count объектов ведомственного контроля',
              ),
            );
          });
          notificationBloc.add(SnackBarNotificationEvent(
              'Объекты ведомстенного контроля загружены'));
        }),
        onCancel: departmentControlService.cancelLoading,
      );
}
