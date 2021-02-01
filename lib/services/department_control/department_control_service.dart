import 'package:inspector/model/control_object.dart';
import 'package:inspector/services/department_control/api/department_control_api_client.dart';
import 'package:inspector/services/network_status_service/network_status.dart';

class DepartmentControlService {
  DepartmentControlService(this._apiClient);

  final DepartmentControlApiClient _apiClient;

  Future<List<ControlObject>> findByPosition(
    double userPositionX,
    double userPositionY, {
    NetworkStatus networkStatus = const NetworkStatus(ConnectionStatus.online, DataSendingMode.automatic),
  }) async {
    if (networkStatus.connectionStatus == ConnectionStatus.online) {
      return _apiClient.getControlObjects(
        userPositionX: userPositionX,
        userPositionY: userPositionY,
      );
    } else {
      return _apiClient.getControlObjects(
        userPositionX: userPositionX,
        userPositionY: userPositionY,
      );
    }
  }

  
}
