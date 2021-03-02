import 'package:flutter/foundation.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/services/department_control/client/department_control_service_client.dart';
import 'package:inspector/services/department_control/client/request.dart';

class DepartmentControlApiClient with DepartmentControlServiceClient {
  DepartmentControlApiClient({
    @required this.apiProvider,
  });

  final ApiProvider apiProvider;

  Future<ControlObject> getControlObjectById(int dcObjectId) async =>
      ControlObject.fromJson(
        await apiProvider.getControlObjectById(dcObjectId),
      );

  Future<List<ControlObject>> getControlObjects(DepartmentControlObjectsRequest request) async =>
      apiProvider.getControlObjects(
        dcObjectTypesIds: request.dcObjectTypesIds,
        dcObjectKind: request.dcObjectKind,
        externalId: request.externalId,
        objectName: request.objectName,
        areaIds: request.areaIds,
        districtIds: request.districtIds,
        addressIds: request.addressIds,
        onlyNearObjects: request.onlyNearObjects,
        userPositionX: request.userPositionX,
        userPositionY: request.userPositionY,
        searchRadius: request.searchRadius,
        balanceOwner: request.balanceOwner,
        daysFromLastSurvey: request.daysFromLastSurvey,
        lastSurveyDateFrom: request.lastSurveyDateFrom,
        lastSurveyDateTo: request.lastSurveyDateTo,
        camerasExist: request.camerasExist,
        ignoreViolations: request.ignoreViolations,
        forCurrentUser: request.forCurrentUser,
        objectElementIds: request.objectElementIds,
        violationNameIds: request.violationNameIds,
        sourceId: request.sourceId,
        violationNum: request.violationNum,
        violationStatusIds: request.violationStatusIds,
        detectionDateFrom: request.detectionDateFrom,
        detectionDateTo: request.detectionDateTo,
        controlDateFrom: request.controlDateFrom,
        controlDateTo: request.controlDateTo,
        from: request.from,
        to: request.to,
        sort: request.sort,
      ).then((response) => response['data']
          .map((e) => ControlObject.fromJson(e)).cast<ControlObject>().toList());

  Future<List<ControlResultSearchResult>> getControlSearchResults(DepartmentControlSearchResultsRequest request) async =>
      apiProvider.getControlSearchResults(
        request.dcObjectId,
        forCurrentUser: request.forCurrentUser,
        surveyDateFrom: request.surveyDateFrom,
        surveyDateTo: request.surveyDateTo,
        violationExists: request.violationExists,
        violationNum: request.violationNum,
        dcViolationStatusIds: request.dcViolationStatusIds,
        dcViolationTypeId: request.dcViolationTypeId,
        dcViolationKindId: request.dcViolationKindId,
        sourceId: request.sourceId,
        from: request.from,
        sort: request.sort,
      ).then((response) => response['data']
          .map((e) => ControlResultSearchResult.fromJson(e)).cast<ControlResultSearchResult>().toList());

  Future<ControlResultSearchResult> getControlSearchResultByIds(DepartmentControlSearchResultByIdsRequest request) async =>
      ControlResultSearchResult.fromJson(
        await apiProvider.getControlSearchResultsByIds(
          request.dcObjectId,
          request.dcControlResultId,
        ),
      );

  Future<ControlResult> registerControlResult(DepartmentControlRegisterControlRequest request) async {
    return ControlResult.fromJson(await apiProvider.createDCControlResult(request.object.id, request.controlResult));
  }

  Future<ControlResult> updateControlResult(DepartmentControlUpdateControlRequest request) async {
    return ControlResult.fromJson(await apiProvider.updateDCControlResult(request.object.id, request.dcControlResultId, request.violation));
  }

  Future<void> removeControlResult(DepartmentControlRemoveControlRequest request)
    => apiProvider.removeDCControlResult(request.object.id, request.resultId);

  Future<PerformControl> registerPerformControl(DepartmentControlRegisterPerformControlRequest request)
    async => PerformControl.fromJson(await apiProvider.createDCPerformControlResult(request.object.id, request.dcControlResultId, request.performControl));

  Future<PerformControl> updatePerformControl(DepartmentControlUpdatePerformControlRequest request)
    async => PerformControl.fromJson(await apiProvider.updateDCPerformControlResult(request.object.id, request.dcControlResultId, request.performControl));

  Future<void> removePerformControl(DepartmentControlRemovePerformControlRequest request)
    async => await apiProvider.removeDCPerformControlResult(request.object.id, request.dcControlResultId, request.performControl.id);

  Future<void> extendPeriod(DepartmentControlExtendControlPeriodRequest request) async {
    await apiProvider.extendPeriod(request.object.id, request.dcControlResultId, request.violationExtensionPeriod);
  }

}
