import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/violation_extension_period.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/department_control/client/api/department_control_api_client.dart';
import 'package:inspector/services/department_control/client/department_control_service_client.dart';
import 'package:inspector/services/department_control/client/request.dart';
import 'package:inspector/services/department_control/client/response.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/services/network_status_service/network_status.dart';

class DepartmentControlService {
  DepartmentControlService(this._apiClient, this._localClient);

  final DepartmentControlApiClient _apiClient;
  final DepartmentControlServiceClient _localClient;

  Future<List<ControlObject>> find(
    Location location,
    NetworkStatus networkStatus,
    ControlFiltersBlocState filtersState,
    String sortState,
    int from,
    int to,
  ) async {
    final client = _getClient(networkStatus);
    final request = DepartmentControlObjectsRequest(
      onlyNearObjects: true,
      from: from,
      to: to,
      // filtering
      searchRadius: filtersState.searchRadius,
      daysFromLastSurvey: filtersState.daysFromLastSurvey,
      dcObjectTypesIds: filtersState.dcObjectType?.id,
      dcObjectKind: filtersState.dcObjectType?.name,
      externalId: filtersState.externalId,
      objectName: filtersState.objectName,
      areaIds: filtersState.area?.id,
      districtIds: filtersState.district?.id,
      streetIds: filtersState.street?.id,
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
      sort: sortState,
    );
    return location.when(
      (longitude, latitude) => client.getControlObjects(
        request.copyWith(
          userPositionX: longitude,
          userPositionY: latitude,
        ),
      ),
      noLocationProvided: () => client.getControlObjects(request),
    );
  }

  Future<ControlResult> registerControlResult(
    ControlObject object,
    ControlResult controlResult,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).registerControlResult(
        DepartmentControlRegisterControlRequest(
          object,
          controlResult,
        ),
      );

  Future<ControlResultsResponse> getControlResults(
    ControlObject object,
    NetworkStatus networkStatus,
  ) async {
    try {
      final result = await _getClient(networkStatus).getControlSearchResults(
          DepartmentControlSearchResultsRequest(object.id));
      if (result.isEmpty)
        return ControlResultsResponse.emptyResultsListResponse();
      return ControlResultsResponse.controlResultsListResponse(result);
    } on ApiException catch (e) {
      return ControlResultsResponse.exceptionResponse(e);
    }
  }

  Future<ControlResultSearchResult> getControlResult(
    ControlObject object,
    ControlResultSearchResult result,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).getControlSearchResultByIds(
        DepartmentControlSearchResultByIdsRequest(
          object.id,
          result.id,
        ),
      );

  Future<ControlResult> updateControlResult(
    ControlObject object,
    int dcControlResultId,
    DCViolation violation,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).updateControlResult(
        DepartmentControlUpdateControlRequest(
          object,
          dcControlResultId,
          violation,
        ),
      );

  Future<void> removeControlResult(
    ControlObject object,
    int resultId,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).removeControlResult(
        DepartmentControlRemoveControlRequest(
          object,
          resultId,
        ),
      );

  Future<PerformControl> registerPerformControl(
    ControlObject object,
    int dcControlResultId,
    PerformControl performControl,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).registerPerformControl(
        DepartmentControlRegisterPerformControlRequest(
          object,
          dcControlResultId,
          performControl,
        ),
      );

  Future<PerformControl> updatePerformControl(
    ControlObject object,
    int dcControlResultId,
    PerformControl performControl,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).updatePerformControl(
        DepartmentControlUpdatePerformControlRequest(
          object,
          dcControlResultId,
          performControl,
        ),
      );

  Future<void> removePerformControl(
    ControlObject object,
    int dcControlResultId,
    PerformControl performControl,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).removePerformControl(
        DepartmentControlRemovePerformControlRequest(
          object,
          dcControlResultId,
          performControl,
        ),
      );

  Future<void> extendPeriod(
    ControlObject object,
    int dcControlResultId,
    ViolationExtensionPeriod violationExtensionPeriod,
    NetworkStatus networkStatus,
  ) =>
      _getClient(networkStatus).extendPeriod(
        DepartmentControlExtendControlPeriodRequest(
          object,
          dcControlResultId,
          violationExtensionPeriod,
        ),
      );

  DepartmentControlServiceClient _getClient(NetworkStatus networkStatus) =>
      networkStatus.connectionStatus == ConnectionStatus.online
          ? _apiClient
          : _localClient;
}
