import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/department_control/api/department_control_api_client.dart';
import 'package:inspector/services/department_control/response.dart';
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
    ControlFiltersBlocState filtersState,
    String sortState,
    int from,
    int to,
  ) => location.when(
    (longitude, latitude) => _apiClient.getControlObjects(
        userPositionX: latitude,
        userPositionY: longitude,
        onlyNearObjects: true,
        from: from,
        to: to,
        // filtering
        searchRadius: filtersState.searchRadius,
        daysFromLastSurvey: filtersState.daysFromLastSurvey,
        dcObjectTypesIds: filtersState.dcObjectType?.id,
        dcObjectKind: filtersState.dcObjectType?.code,
        externalId: filtersState.externalId,
        objectName: filtersState.objectName,
        areaIds: filtersState.area?.id,
        districtIds: filtersState.district?.id,
        addressIds: filtersState.address?.id,
        balanceOwner: filtersState.balanceOwner,
        lastSurveyDateFrom: filtersState.lastSurveyDateFrom,
        lastSurveyDateTo: filtersState.lastSurveyDateTo,
        camerasExist: filtersState.camerasExist,
        ignoreViolations: filtersState.ignoreViolations,
        objectElementIds: filtersState.objectElement?.id,
        violationNameIds: filtersState.violationName?.id,
        violationStatusIds: filtersState.violationStatus?.id,
        sourceId: filtersState.source?.id,
        detectionDateFrom: filtersState.detectionDateFrom,
        detectionDateTo: filtersState.detectionDateTo,
        controlDateFrom: filtersState.controlDateFrom,
        controlDateTo: filtersState.controlDateTo,
        sort: sortState
    ),
    noLocationProvided: () => _apiClient.getControlObjects(
      from: from,
      to: to,
      searchRadius: filtersState.searchRadius,
      daysFromLastSurvey: filtersState.daysFromLastSurvey,
    ),
  );
  
  Future<ControlResult> registerControlResult(ControlObject object, {DCViolation violation}) async {
    final result = ControlResult(
      surveyDate: DateTime.now(),
      violation: violation,
      violationExists: violation != null,
    );
    final t  = await _apiClient.registerControlResult(object, result);
    return t;
  }

  Future<ControlResultsResponse> getControlResults(ControlObject object) async {
    try {
      final result = await _apiClient.getControlSearchResults(object.id);
      if(result.isEmpty)
        return ControlResultsResponse.emptyResultsListResponse();
      return ControlResultsResponse.controlResultsListResponse(result);
    } on ApiException catch (e) {
      return ControlResultsResponse.exceptionResponse(e);
    }
  }

}
