import 'package:flutter/foundation.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/providers/api_provider.dart';

class DepartmentControlApiClient {
  DepartmentControlApiClient({
    @required this.apiProvider,
  });

  final ApiProvider apiProvider;

  Future<ControlObject> getControlObjectById(int dcObjectId) async =>
      ControlObject.fromJson(
        await apiProvider.getControlObjectById(dcObjectId),
      );

  Future<List<ControlObject>> getControlObjects({
    List<int> dcObjectTypesIds,
    String dcObjectKind,
    int externalId,
    String objectName,
    List<int> areaIds,
    List<int> districtIds,
    List<int> addressIds,
    bool onlyNearObjects,
    double userPositionX,
    double userPositionY,
    int searchRadius,
    String balanceOwner,
    int daysFromLastSurvey,
    DateTime lastSurveyDateFrom,
    DateTime lastSurveyDateTo,
    bool camerasExist,
    bool ignoreViolations,
    bool forCurrentUser,
    List<int> objectElementIds,
    List<int> violationNameIds,
    int sourceId,
    String violationNum,
    List<int> violationStatusIds,
    DateTime detectionDateFrom,
    DateTime detectionDateTo,
    DateTime controlDateFrom,
    DateTime controlDateTo,
    int from,
    int to,
    List<String> sort,
  }) async =>
      apiProvider.getControlObjects(
        dcObjectTypesIds: dcObjectTypesIds,
        dcObjectKind: dcObjectKind,
        externalId: externalId,
        objectName: objectName,
        areaIds: areaIds,
        districtIds: districtIds,
        addressIds: addressIds,
        onlyNearObjects: onlyNearObjects,
        userPositionX: userPositionX,
        userPositionY: userPositionY,
        searchRadius: searchRadius,
        balanceOwner: balanceOwner,
        daysFromLastSurvey: daysFromLastSurvey,
        lastSurveyDateFrom: lastSurveyDateFrom,
        lastSurveyDateTo: lastSurveyDateTo,
        camerasExist: camerasExist,
        ignoreViolations: ignoreViolations,
        forCurrentUser: forCurrentUser,
        objectElementIds: objectElementIds,
        violationNameIds: violationNameIds,
        sourceId: sourceId,
        violationNum: violationNum,
        violationStatusIds: violationStatusIds,
        detectionDateFrom: detectionDateFrom,
        detectionDateTo: detectionDateTo,
        controlDateFrom: controlDateFrom,
        controlDateTo: controlDateTo,
        from: from,
        to: to,
        sort: sort,
      ).then((response) => response['data']
          .map((e) => ControlObject.fromJson(e)).cast<ControlObject>().toList());

  Future<List<ControlResultSearchResult>> getControlSearchResults(
    int dcObjectId, {
    bool forCurrentUser,
    DateTime surveyDateFrom,
    DateTime surveyDateTo,
    bool violationExists,
    String violationNum,
    List<int> dcViolationStatusIds,
    int dcViolationTypeId,
    int dcViolationKindId,
    int sourceId,
    int from,
    int to,
    List<String> sort,
  }) async =>
      apiProvider.getControlSearchResults(
        dcObjectId,
        forCurrentUser: forCurrentUser,
        surveyDateFrom: surveyDateFrom,
        surveyDateTo: surveyDateTo,
        violationExists: violationExists,
        violationNum: violationNum,
        dcViolationStatusIds: dcViolationStatusIds,
        dcViolationTypeId: dcViolationTypeId,
        dcViolationKindId: dcViolationKindId,
        sourceId: sourceId,
        from: from,
        sort: sort,
      ).then((response) => response['data']
          .map((e) => ControlObject.fromJson(e)).cast<ControlObject>().toList());

  Future<ControlResultSearchResult> getControlSearchResultByIds(
    int dcObjectId,
    int dcControlResultId,
  ) async =>
      ControlResultSearchResult.fromJson(
        await apiProvider.getControlSearchResultsByIds(
          dcObjectId,
          dcControlResultId,
        ),
      );

  Future<ControlResult> registerControlResult(ControlObject object, ControlResult result) async {
    return ControlResult.fromJson(await apiProvider.createDCControlResult(object.id, result));
  }
}
