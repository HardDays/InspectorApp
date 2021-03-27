// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DepartmentControlObjectsRequest _$_$_DepartmentControlObjectsRequestFromJson(
    Map<String, dynamic> json) {
  return _$_DepartmentControlObjectsRequest(
    dcObjectTypesIds: json['dcObjectTypesIds'] as int,
    dcObjectKind: json['dcObjectKind'] as String,
    externalId: json['externalId'] as int,
    objectName: json['objectName'] as String,
    areaIds: json['areaIds'] as int,
    districtIds: json['districtIds'] as int,
    streetIds: json['streetIds'] as int,
    addressIds: json['addressIds'] as int,
    onlyNearObjects: json['onlyNearObjects'] as bool,
    userPositionX: (json['userPositionX'] as num)?.toDouble(),
    userPositionY: (json['userPositionY'] as num)?.toDouble(),
    searchRadius: json['searchRadius'] as int,
    balanceOwner: json['balanceOwner'] as String,
    daysFromLastSurvey: json['daysFromLastSurvey'] as int,
    lastSurveyDateFrom: json['lastSurveyDateFrom'] == null
        ? null
        : DateTime.parse(json['lastSurveyDateFrom'] as String),
    lastSurveyDateTo: json['lastSurveyDateTo'] == null
        ? null
        : DateTime.parse(json['lastSurveyDateTo'] as String),
    camerasExist: json['camerasExist'] as bool,
    ignoreViolations: json['ignoreViolations'] as bool,
    forCurrentUser: json['forCurrentUser'] as bool,
    objectElementIds: json['objectElementIds'] as int,
    violationNameIds: json['violationNameIds'] as int,
    sourceId: json['sourceId'] as int,
    violationNum: json['violationNum'] as String,
    violationStatusIds: json['violationStatusIds'] as int,
    detectionDateFrom: json['detectionDateFrom'] == null
        ? null
        : DateTime.parse(json['detectionDateFrom'] as String),
    detectionDateTo: json['detectionDateTo'] == null
        ? null
        : DateTime.parse(json['detectionDateTo'] as String),
    controlDateFrom: json['controlDateFrom'] == null
        ? null
        : DateTime.parse(json['controlDateFrom'] as String),
    controlDateTo: json['controlDateTo'] == null
        ? null
        : DateTime.parse(json['controlDateTo'] as String),
    from: json['from'] as int,
    to: json['to'] as int,
    sort: json['sort'] as String,
  );
}

Map<String, dynamic> _$_$_DepartmentControlObjectsRequestToJson(
        _$_DepartmentControlObjectsRequest instance) =>
    <String, dynamic>{
      'dcObjectTypesIds': instance.dcObjectTypesIds,
      'dcObjectKind': instance.dcObjectKind,
      'externalId': instance.externalId,
      'objectName': instance.objectName,
      'areaIds': instance.areaIds,
      'districtIds': instance.districtIds,
      'streetIds': instance.streetIds,
      'addressIds': instance.addressIds,
      'onlyNearObjects': instance.onlyNearObjects,
      'userPositionX': instance.userPositionX,
      'userPositionY': instance.userPositionY,
      'searchRadius': instance.searchRadius,
      'balanceOwner': instance.balanceOwner,
      'daysFromLastSurvey': instance.daysFromLastSurvey,
      'lastSurveyDateFrom': instance.lastSurveyDateFrom?.toIso8601String(),
      'lastSurveyDateTo': instance.lastSurveyDateTo?.toIso8601String(),
      'camerasExist': instance.camerasExist,
      'ignoreViolations': instance.ignoreViolations,
      'forCurrentUser': instance.forCurrentUser,
      'objectElementIds': instance.objectElementIds,
      'violationNameIds': instance.violationNameIds,
      'sourceId': instance.sourceId,
      'violationNum': instance.violationNum,
      'violationStatusIds': instance.violationStatusIds,
      'detectionDateFrom': instance.detectionDateFrom?.toIso8601String(),
      'detectionDateTo': instance.detectionDateTo?.toIso8601String(),
      'controlDateFrom': instance.controlDateFrom?.toIso8601String(),
      'controlDateTo': instance.controlDateTo?.toIso8601String(),
      'from': instance.from,
      'to': instance.to,
      'sort': instance.sort,
    };

_$_DepartmentControlSearchResultsRequest
    _$_$_DepartmentControlSearchResultsRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlSearchResultsRequest(
    json['dcObjectId'] as int,
    forCurrentUser: json['forCurrentUser'] as bool,
    surveyDateFrom: json['surveyDateFrom'] == null
        ? null
        : DateTime.parse(json['surveyDateFrom'] as String),
    surveyDateTo: json['surveyDateTo'] == null
        ? null
        : DateTime.parse(json['surveyDateTo'] as String),
    violationExists: json['violationExists'] as bool,
    violationNum: json['violationNum'] as String,
    dcViolationStatusIds:
        (json['dcViolationStatusIds'] as List)?.map((e) => e as int)?.toList(),
    dcViolationTypeId: json['dcViolationTypeId'] as int,
    dcViolationKindId: json['dcViolationKindId'] as int,
    sourceId: json['sourceId'] as int,
    from: json['from'] as int,
    to: json['to'] as int,
    sort: (json['sort'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_DepartmentControlSearchResultsRequestToJson(
        _$_DepartmentControlSearchResultsRequest instance) =>
    <String, dynamic>{
      'dcObjectId': instance.dcObjectId,
      'forCurrentUser': instance.forCurrentUser,
      'surveyDateFrom': instance.surveyDateFrom?.toIso8601String(),
      'surveyDateTo': instance.surveyDateTo?.toIso8601String(),
      'violationExists': instance.violationExists,
      'violationNum': instance.violationNum,
      'dcViolationStatusIds': instance.dcViolationStatusIds,
      'dcViolationTypeId': instance.dcViolationTypeId,
      'dcViolationKindId': instance.dcViolationKindId,
      'sourceId': instance.sourceId,
      'from': instance.from,
      'to': instance.to,
      'sort': instance.sort,
    };

_$_DepartmentControlSearchResultByIdsRequest
    _$_$_DepartmentControlSearchResultByIdsRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlSearchResultByIdsRequest(
    json['dcObjectId'] as int,
    json['dcControlResultId'] as int,
  );
}

Map<String, dynamic> _$_$_DepartmentControlSearchResultByIdsRequestToJson(
        _$_DepartmentControlSearchResultByIdsRequest instance) =>
    <String, dynamic>{
      'dcObjectId': instance.dcObjectId,
      'dcControlResultId': instance.dcControlResultId,
    };

_$_DepartmentControlRegisterControlRequest
    _$_$_DepartmentControlRegisterControlRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlRegisterControlRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['controlResult'] == null
        ? null
        : ControlResult.fromJson(json['controlResult'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DepartmentControlRegisterControlRequestToJson(
        _$_DepartmentControlRegisterControlRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'controlResult': instance.controlResult,
    };

_$_DepartmentControlUpdateControlRequest
    _$_$_DepartmentControlUpdateControlRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlUpdateControlRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['dcControlResultId'] as int,
    json['violation'] == null
        ? null
        : DCViolation.fromJson(json['violation'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DepartmentControlUpdateControlRequestToJson(
        _$_DepartmentControlUpdateControlRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'dcControlResultId': instance.dcControlResultId,
      'violation': instance.violation,
    };

_$_DepartmentControlRemoveControlRequest
    _$_$_DepartmentControlRemoveControlRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlRemoveControlRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['resultId'] as int,
  );
}

Map<String, dynamic> _$_$_DepartmentControlRemoveControlRequestToJson(
        _$_DepartmentControlRemoveControlRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'resultId': instance.resultId,
    };

_$_DepartmentControlRegisterPerformControlRequest
    _$_$_DepartmentControlRegisterPerformControlRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlRegisterPerformControlRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['dcControlResultId'] as int,
    json['performControl'] == null
        ? null
        : PerformControl.fromJson(
            json['performControl'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DepartmentControlRegisterPerformControlRequestToJson(
        _$_DepartmentControlRegisterPerformControlRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'dcControlResultId': instance.dcControlResultId,
      'performControl': instance.performControl,
    };

_$_DepartmentControlUpdatePerformControlRequest
    _$_$_DepartmentControlUpdatePerformControlRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlUpdatePerformControlRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['dcControlResultId'] as int,
    json['performControl'] == null
        ? null
        : PerformControl.fromJson(
            json['performControl'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DepartmentControlUpdatePerformControlRequestToJson(
        _$_DepartmentControlUpdatePerformControlRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'dcControlResultId': instance.dcControlResultId,
      'performControl': instance.performControl,
    };

_$_DepartmentControlRemovePerformControlRequest
    _$_$_DepartmentControlRemovePerformControlRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlRemovePerformControlRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['dcControlResultId'] as int,
    json['performControl'] == null
        ? null
        : PerformControl.fromJson(
            json['performControl'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DepartmentControlRemovePerformControlRequestToJson(
        _$_DepartmentControlRemovePerformControlRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'dcControlResultId': instance.dcControlResultId,
      'performControl': instance.performControl,
    };

_$_DepartmentControlExtendControlPeriodRequest
    _$_$_DepartmentControlExtendControlPeriodRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlExtendControlPeriodRequest(
    json['object'] == null
        ? null
        : ControlObject.fromJson(json['object'] as Map<String, dynamic>),
    json['dcControlResultId'] as int,
    json['violationExtensionPeriod'] == null
        ? null
        : ViolationExtensionPeriod.fromJson(
            json['violationExtensionPeriod'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_DepartmentControlExtendControlPeriodRequestToJson(
        _$_DepartmentControlExtendControlPeriodRequest instance) =>
    <String, dynamic>{
      'object': instance.object,
      'dcControlResultId': instance.dcControlResultId,
      'violationExtensionPeriod': instance.violationExtensionPeriod,
    };

_$_DepartmentControlControlResultsRequest
    _$_$_DepartmentControlControlResultsRequestFromJson(
        Map<String, dynamic> json) {
  return _$_DepartmentControlControlResultsRequest(
    dcObjectId: json['dcObjectId'] as int,
    forCurrentUser: json['forCurrentUser'] as bool,
    surveyDateFrom: json['surveyDateFrom'] == null
        ? null
        : DateTime.parse(json['surveyDateFrom'] as String),
    surveyDateTo: json['surveyDateTo'] == null
        ? null
        : DateTime.parse(json['surveyDateTo'] as String),
    violationExists: json['violationExists'] as bool,
    violationNum: json['violationNum'] as String,
    dcViolationStatusIds:
        (json['dcViolationStatusIds'] as List)?.map((e) => e as int)?.toList(),
    dcViolationTypeId: json['dcViolationTypeId'] as int,
    dcViolationKindId: json['dcViolationKindId'] as int,
    sourceId: json['sourceId'] as int,
    from: json['from'] as int,
    to: json['to'] as int,
    sort: (json['sort'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$_$_DepartmentControlControlResultsRequestToJson(
        _$_DepartmentControlControlResultsRequest instance) =>
    <String, dynamic>{
      'dcObjectId': instance.dcObjectId,
      'forCurrentUser': instance.forCurrentUser,
      'surveyDateFrom': instance.surveyDateFrom?.toIso8601String(),
      'surveyDateTo': instance.surveyDateTo?.toIso8601String(),
      'violationExists': instance.violationExists,
      'violationNum': instance.violationNum,
      'dcViolationStatusIds': instance.dcViolationStatusIds,
      'dcViolationTypeId': instance.dcViolationTypeId,
      'dcViolationKindId': instance.dcViolationKindId,
      'sourceId': instance.sourceId,
      'from': instance.from,
      'to': instance.to,
      'sort': instance.sort,
    };
