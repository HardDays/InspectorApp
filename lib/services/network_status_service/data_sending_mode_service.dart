import 'dart:async';

import 'package:inspector/services/network_status_service/network_status.dart';

class DataSendingModeStatusService {
  
  DataSendingMode _actual;
  DataSendingMode get actual => _actual;

  Stream<DataSendingMode> get listenDataSendingMode => _controller.stream;

  final StreamController _controller = StreamController<DataSendingMode>.broadcast();

  void add(bool state) {
    _actual = state ? DataSendingMode.automatic : DataSendingMode.manual;
    _controller.add(actual);
  }

  void close() {
    _controller.close();
  }

}
