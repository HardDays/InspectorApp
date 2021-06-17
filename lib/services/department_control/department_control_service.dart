import 'package:async/async.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/blocs/control_object_filters/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/violation_extension_period.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/department_control/client/api/department_control_api_client.dart';
import 'package:inspector/services/department_control/client/department_control_service_client.dart';
import 'package:inspector/services/department_control/client/local/department_control_local_service.dart';
import 'package:inspector/services/department_control/client/local/metadata.dart';
import 'package:inspector/services/department_control/client/request.dart';
import 'package:inspector/services/department_control/client/response.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/extensions.dart';
import 'package:flutter/foundation.dart';

class DepartmentControlService {
  DepartmentControlService(
      this._apiClient, this._localClient, this._dictionaryService);

  final DepartmentControlApiClient _apiClient;
  final DepartmentControlLocalService _localClient;
  final DictionaryService _dictionaryService;

  bool _canceled = false;

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
      dcObjectKind: filtersState.dcObjectKind?.name,
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
          userPositionX: latitude,
          userPositionY: longitude,
          onlyNearObjects: true,
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
    ControlObjectFilters filters,
  ) async {
    try {
      final result = await _getClient(networkStatus).getControlSearchResults(
        DepartmentControlSearchResultsRequest(
          object.id,
          dcViolationKindId: filters?.dcViolationKind?.id,
          dcViolationStatusIds: [filters?.violationStatus?.id],
          dcViolationTypeId: filters?.dcViolationType?.id,
          sourceId: filters?.source?.id,
          violationExists: filters?.violationExists,
          violationNum: filters?.violationNum,
          surveyDateFrom: filters?.surveyDateFrom,
          surveyDateTo: filters?.surveyDateTo,
        ),
      );
      if (result.isEmpty)
        return ControlResultsResponse.emptyResultsListResponse();
      return ControlResultsResponse.controlResultsListResponse(result);
    } on ApiException catch (e) {
      return ControlResultsResponse.exceptionResponse(e);
    }
  }

  Future<bool> checkIfViolationsExists(
    ControlObject object,
    NetworkStatus networkStatus, {
    bool violationExists,
  }) async {
    if (networkStatus.connectionStatus == ConnectionStatus.online) {
      final results = await _getClient(networkStatus)
          .getControlSearchResults(DepartmentControlSearchResultsRequest(
        object.id,
        dcViolationStatusIds: (await _dictionaryService.getViolationTypes())
            .where((element) => [
                  'Новое',
                  'На контроле инспектора',
                  'На устранении',
                  'Снят с контроля',
                ].contains(element))
            .map((e) => e.id)
            .toList(),
        surveyDateFrom: DateTime.now(),
        surveyDateTo: DateTime.now(),
        violationExists: violationExists,
      ));
      return results.isNotEmpty;
    } else {
      return false;
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
      networkStatus.connectionStatus == ConnectionStatus.online || !kReleaseMode
          ? _apiClient
          : _localClient;
  //TODO: в случае когда сборка Debug версии, подключение к интрнету всегда будет возвращать true(сделано для отладки) позже удалить

  Future<void> saveControlObjectsLocally(void Function(int) notifier) async {
    _canceled = false;
    await _localClient.saveMetadata(
      DepartmentControlLocalServiceMetadata(
        false,
      ),
    );
    int start = 0;
    int page = 10000;
    bool loaded = false;
    while (!_canceled && !loaded) {
      await _apiClient
          .getControlObjects(
        DepartmentControlObjectsRequest(
          from: start,
          to: start + page,
          ignoreViolations: true,
        ),
      )
          .then(
        (x) async {
          if (x.isNotEmpty) {
            await _localClient.saveObjects(x);
            await _localClient.saveMetadata(
              DepartmentControlLocalServiceMetadata(
                false,
              ),
            );
            start += x.length;
            notifier(start);
            print(start);
          } else {
            loaded = true;
            await _localClient.saveMetadata(
              DepartmentControlLocalServiceMetadata(
                true,
                lastUpdatedDate: DateTime.now(),
                count: start + page,
              ),
            );
            print(await _localClient.metadata);
          }
        },
      );
    }
    _canceled = false;
  }

  Future<void> saveSearchResultsLocally(void Function(int) notifier) async {
    _canceled = false;
    int start = 0;
    int page = 500;
    bool loaded = false;
    while (!_canceled && !loaded) {
      await _apiClient
          .getControlResults(DepartmentControlControlResultsRequest(
              from: start, to: start + page, forCurrentUser: true))
          .then((list) {
        if (list.isNotEmpty) {
          _localClient.saveSearchResults(list);
          start += list.length;
          notifier(start);
        } else {
          loaded = true;
        }
      });
    }
    _canceled = false;
  }

  Future<DepartmentControlLocalServiceMetadata> get localMetadata =>
      _localClient.metadata;

  void cancelLoading() {
    _canceled = true;
  }

  CancelableOperation getUploadOperation(
          Future<void> Function(ApiException) exceptionHandler) =>
      CancelableOperation.fromFuture(Future(() async {
        (await _localClient.registerRequests).let(
            (Iterable<DepartmentControlRegisterControlRequest>
                registerRequests) async {
          print('registerRequests: ${registerRequests.length}');
          final it = registerRequests.iterator;
          int t = 0;
          while (!_canceled && it.moveNext()) {
            try {
              print('registerRequests: $t/${registerRequests.length}');
              await _apiClient.registerControlResult(it.current);
              t++;
            } on ApiException catch (e) {
              await exceptionHandler(e);
            }
          }
        });
        (await _localClient.removeRequests).let((removeRequests) async {
          final it = removeRequests.iterator;
          int t = 0;
          while (!_canceled && it.moveNext()) {
            try {
              print('registerRequests: $t/${removeRequests.length}');
              await _apiClient.removeControlResult(it.current);
              t++;
            } on ApiException catch (e) {
              await exceptionHandler(e);
            }
          }
        });
        (await _localClient.updateRequests).let((updateRequests) async {
          final it = updateRequests.iterator;
          int t = 0;
          while (!_canceled && it.moveNext()) {
            try {
              print('registerRequests: $t/${updateRequests.length}');
              await _apiClient.updateControlResult(it.current);
              t++;
            } on ApiException catch (e) {
              await exceptionHandler(e);
            }
          }
        });
        await _localClient.removeLocalRequests();
      }));
}
