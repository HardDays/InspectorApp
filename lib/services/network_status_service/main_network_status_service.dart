import 'dart:async';

import 'package:inspector/services/network_status_service/connection_status_service.dart';
import 'package:inspector/services/network_status_service/data_sending_mode_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class MainNetworkStatusService with NetworkStatusService {

  MainNetworkStatusService(this._connectionStatusService, this._dataSendingModeStatusService) {
    _connectionStatusStreamSubscription = _connectionStatusService.listenConnectionStatus.listen((value) {
      final dataSendingMode = _dataSendingModeStatusService.actual ?? DataSendingMode.automatic;
      _controller.add(NetworkStatus(value, dataSendingMode));
    });

    _dataSendingModeStatusService.listenDataSendingMode.listen((value) async {
      final networkStatus = await _connectionStatusService.actual;
      _controller.add(NetworkStatus(networkStatus, value));
    });
  }

  final StreamController<NetworkStatus> _controller = StreamController.broadcast();

  final ConnectionStatusService _connectionStatusService;
  final DataSendingModeStatusService _dataSendingModeStatusService;

  StreamSubscription<ConnectionStatus> _connectionStatusStreamSubscription;
  StreamSubscription<DataSendingMode> _dataSendingModeStatusstreamSubscription;

  @override
  Stream<NetworkStatus> get listenNetworkStatus => _controller.stream;

  @override
  Future<NetworkStatus> get actual async => NetworkStatus(await _connectionStatusService.actual, _dataSendingModeStatusService.actual ?? DataSendingMode.automatic);

  void close() {
    _controller.close();
    _connectionStatusStreamSubscription.cancel();
    _dataSendingModeStatusstreamSubscription.cancel();
  }

}