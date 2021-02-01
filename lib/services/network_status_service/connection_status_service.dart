import 'package:connectivity/connectivity.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';

class ConnectionStatusService {
  
  ConnectionStatusService(
    this._connectivity,
  );

  final Connectivity _connectivity;

  Future<ConnectionStatus> get actual async => getConnectionStatus(await _connectivity.checkConnectivity());

  Stream<ConnectionStatus> get listenConnectionStatus => _connectivity
    .onConnectivityChanged
    .map((e) => getConnectionStatus(e));
  
  ConnectionStatus getConnectionStatus(ConnectivityResult result) => result == ConnectivityResult.none ? ConnectionStatus.offline : ConnectionStatus.online;

}
