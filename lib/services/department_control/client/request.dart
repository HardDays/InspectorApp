import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/violation_extension_period.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
abstract class DepartmentControlObjectsRequest
    with _$DepartmentControlObjectsRequest {
  const factory DepartmentControlObjectsRequest({
    int dcObjectTypesIds,
    String dcObjectKind,
    int externalId,
    String objectName,
    int areaIds,
    int districtIds,
    int addressIds,
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
    int objectElementIds,
    int violationNameIds,
    int sourceId,
    String violationNum,
    int violationStatusIds,
    DateTime detectionDateFrom,
    DateTime detectionDateTo,
    DateTime controlDateFrom,
    DateTime controlDateTo,
    int from,
    int to,
    String sort,
  }) = _DepartmentControlObjectsRequest;

  factory DepartmentControlObjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$DepartmentControlObjectsRequestFromJson(json);
}

@freezed
abstract class DepartmentControlSearchResultsRequest
    with _$DepartmentControlSearchResultsRequest {
  const factory DepartmentControlSearchResultsRequest(
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
  }) = _DepartmentControlSearchResultsRequest;

  factory DepartmentControlSearchResultsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlSearchResultsRequestFromJson(json);
}

@freezed
abstract class DepartmentControlSearchResultByIdsRequest
    with _$DepartmentControlSearchResultByIdsRequest {
  const factory DepartmentControlSearchResultByIdsRequest(
    int dcObjectId,
    int dcControlResultId,
  ) = _DepartmentControlSearchResultByIdsRequest;

  factory DepartmentControlSearchResultByIdsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlSearchResultByIdsRequestFromJson(json);
}

@freezed
abstract class DepartmentControlRegisterControlRequest
    with _$DepartmentControlRegisterControlRequest {
  const factory DepartmentControlRegisterControlRequest(
    ControlObject object,
    ControlResult controlResult,
  ) = _DepartmentControlRegisterControlRequest;

  factory DepartmentControlRegisterControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlRegisterControlRequestFromJson(json);
}

@freezed
abstract class DepartmentControlUpdateControlRequest
    with _$DepartmentControlUpdateControlRequest {
  const factory DepartmentControlUpdateControlRequest(
    ControlObject object,
    int dcControlResultId,
    DCViolation violation,
  ) = _DepartmentControlUpdateControlRequest;

  factory DepartmentControlUpdateControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlUpdateControlRequestFromJson(json);
}

@freezed
abstract class DepartmentControlRemoveControlRequest
    with _$DepartmentControlRemoveControlRequest {
  const factory DepartmentControlRemoveControlRequest(
    ControlObject object,
    int resultId,
  ) = _DepartmentControlRemoveControlRequest;

  factory DepartmentControlRemoveControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlRemoveControlRequestFromJson(json);
}

@freezed
abstract class DepartmentControlRegisterPerformControlRequest
    with _$DepartmentControlRegisterPerformControlRequest {
  const factory DepartmentControlRegisterPerformControlRequest(
    ControlObject object,
    int dcControlResultId,
    PerformControl performControl,
  ) = _DepartmentControlRegisterPerformControlRequest;

  factory DepartmentControlRegisterPerformControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlRegisterPerformControlRequestFromJson(json);
}

@freezed
abstract class DepartmentControlUpdatePerformControlRequest
    with _$DepartmentControlUpdatePerformControlRequest {
  const factory DepartmentControlUpdatePerformControlRequest(
    ControlObject object,
    int dcControlResultId,
    PerformControl performControl,
  ) = _DepartmentControlUpdatePerformControlRequest;

  factory DepartmentControlUpdatePerformControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlUpdatePerformControlRequestFromJson(json);
}

@freezed
abstract class DepartmentControlRemovePerformControlRequest
    with _$DepartmentControlRemovePerformControlRequest {
  const factory DepartmentControlRemovePerformControlRequest(
    ControlObject object,
    int dcControlResultId,
    PerformControl performControl,
  ) = _DepartmentControlRemovePerformControlRequest;

  factory DepartmentControlRemovePerformControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlRemovePerformControlRequestFromJson(json);
}

@freezed
abstract class DepartmentControlExtendControlPeriodRequest
    with _$DepartmentControlExtendControlPeriodRequest {
  const factory DepartmentControlExtendControlPeriodRequest(
    ControlObject object,
    int dcControlResultId,
    ViolationExtensionPeriod violationExtensionPeriod,
  ) = _DepartmentControlExtendControlPeriodRequest;

  factory DepartmentControlExtendControlPeriodRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DepartmentControlExtendControlPeriodRequestFromJson(json);
}
