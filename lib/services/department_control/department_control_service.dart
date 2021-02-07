import 'package:inspector/blocs/control_list/filter_state.dart';
import 'package:inspector/blocs/control_list/sort_state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/api/department_control_api_client.dart';
import 'package:inspector/services/location/location.dart';
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

  Future<List<ControlObject>> find(
    Location location,
    NetworkStatus networkStatus,
    ControlObjectsFilterState filtersState,
    ControlObjectsSortState sortState,
    int from,
    int to,
  ) => location.when(
    (longitude, latitude) => _apiClient.getControlObjects(
        userPositionX: latitude,
        userPositionY: longitude,
        searchRadius: 500,
        onlyNearObjects: true,
        from: from,
        to: to,
        daysFromLastSurvey: 7,
    ),
    noLocationProvided: () => _apiClient.getControlObjects(
      from: from,
      to: to,
      daysFromLastSurvey: 7,
    ),
  );
  
}
