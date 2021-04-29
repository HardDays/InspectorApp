import 'dart:async';

import 'package:inspector/services/network_status_service/data_sending_mode_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class MockNetworkStatusService with NetworkStatusService {

  MockNetworkStatusService(this._dataSendingModeStatusService) {
    _dataSendingModeStatusService.listenDataSendingMode.listen((value) async {
      _controller.add(NetworkStatus(value == DataSendingMode.automatic ? ConnectionStatus.online : ConnectionStatus.offline, value));
    });
  }

  final StreamController<NetworkStatus> _controller = StreamController.broadcast();

  final DataSendingModeStatusService _dataSendingModeStatusService;

  StreamSubscription<DataSendingMode> _dataSendingModeStatusstreamSubscription;

  @override
  Stream<NetworkStatus> get listenNetworkStatus => _controller.stream;

  @override
  Future<NetworkStatus> get actual async {
    final dataSendingMode = _dataSendingModeStatusService.actual ?? DataSendingMode.automatic;
    final connectionsStatus = dataSendingMode == DataSendingMode.automatic ? ConnectionStatus.online : ConnectionStatus.offline;
    return NetworkStatus(
      connectionsStatus,
      dataSendingMode,
    );
  }

  void close() {
    _controller.close();
    _dataSendingModeStatusstreamSubscription.cancel();
  }

}