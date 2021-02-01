import 'package:inspector/services/network_status_service/network_status.dart';

mixin NetworkStatusService {
  Stream<NetworkStatus> get listenNetworkStatus;
}