import 'dart:io';

import 'package:dio/dio.dart';
import 'package:inspector/environment_config.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/department_control/control_result.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/object_kind.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';
import 'package:inspector/model/department_control/violation_extension_period.dart';
import 'package:inspector/model/department_control/violation_extension_reason.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/department_control/violation_status.dart' as dc;
import 'package:inspector/model/district.dart';
import 'package:inspector/model/employee.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/kladdr_address_object_type.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/oati_department.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/resolution_type.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_kind.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/providers/exceptions/server_exception.dart';
import 'package:inspector/providers/exceptions/timeout_exception.dart';
import 'package:inspector/providers/exceptions/unauthorized_exception.dart';
import 'package:inspector/providers/exceptions/unhadled_exception.dart';

class ApiProvider {
  static const _defaultUrl = '${EnvironmentConfig.API_URL}/oati-integration';
  static const _loginPath = '/auth/login';
  static const _refreshPath = '/auth/refresh';
  static const _instructionsPath = '/instructions';
  static const _reportsPath = '/reports';
  static const _departmentControlPath = '/dc-objects';

  static const Map<Type, String> _dictionaryMap = {
    SpecialObject: '/dict/special-objects',
    ObjectCategory: '/dict/object-categories',
    CheckStatus: '/dict/check-statuses',
    Address: '/dict/addresses',
    Area: '/dict/areas',
    District: '/dict/districts',
    Street: '/dict/streets',
    CheckType: '/dict/check-types',
    NormativeAct: '/dict/normative-acts',
    ViolationKind: '/dict/violation-kinds',
    ViolationType: '/dict/violation-types',
    Employee: '/dict/employees',
    ReportStatus: '/dict/report-statuses',
    ViolatorType: '/dict/violator-types',
    InstructionStatus: '/dict/instruction-statuses',
    ViolationStatus: '/dict/violation-statuses',
    OatiDepartment: '/dict/oati-departments',
    DepartmentCode: '/dict/department-codes',
    ViolatorDocumentType: '/dict/violator-doc-types',
    ViolatorInfoLegal: '/dict/violator-info-legal',
    ViolatorInfoOfficial: '/dict/violator-info-official',
    ViolatorInfoPrivate: '/dict/violator-info-private',
    ViolatorInfoIp: '/dict/violator-info-ip',
    ResolutionType: '/dict/resolution-types',
    NormativeActArticle: '/dict/normative-act-articles',
    // ControlObject: '/dc-objects',
    KladdrAddressObjectType: '/dict/kladr-address-object-types',
    ObjectElement: '/dict/dc-object-elements',
    ObjectKind: '/dict/dc-object-kinds',
    dc.ViolationStatus: '/dict/dc-violation-statuses',
    ObjectType: '/dict/dc-object-types',
    Contractor: '/dict/dc-contractors',
    ViolationName: '/dict/dc-violation-names',
    ViolationAdditionalFeature: '/dict/dc-violation-additional-features',
    Source: '/dict/dc-sources',
    ViolationClassificationSearchResult: '/dict/dc-violation-classifications',
    ViolationExtensionReason: '/dict/dc-extension-reasons',
  };

  final dio = Dio(BaseOptions(baseUrl: _defaultUrl));

  static final _instance = ApiProvider._internal();

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal();

  void addInterceptors(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
  }

  Future<dynamic> _request(Function request) async {
    try {
      final res = (await request());  
      //print(res.request.queryParameters);
      return res.data;
    } on DioError catch (ex) {
      print(ex);
      if (ex.type == DioErrorType.response) {
        if (ex.response.statusCode == 401)  {
          throw UnauthorizedException(
            ex.response.data?.toString()
          );
        } else {  
          print(ex.response.request.uri);
          print(ex.response.data);
          throw ServerException(
            ex.response.statusCode,
            ex.response.data?.toString(),
          );
        }
      } else if (ex.type == DioErrorType.connectTimeout || ex.type == DioErrorType.receiveTimeout || ex.type == DioErrorType.sendTimeout) {
        throw TimeoutException(ex.response.data?.toString());
      } else {
        if (ex.error is SocketException) {
          throw TimeoutException(
            ex.error.toString(),
          );
        } else {
          throw UnhandledException(ex.message);
        }
      }
    } 
  }

  Map<String, dynamic> _removeJsonNulls(Map<String, dynamic> json) {
    json.removeWhere((key, value) => key == null || value == null);
    for (final value in json.values) {
      if (value is Map) {
        _removeJsonNulls(value);
      } else if (value is List) {
        for (final item in value) {
          if (item is Map) {
            _removeJsonNulls(item);
          }
        }
      }
    }
    return json;
  }

  String _formatDate(DateTime date) 
    => date != null ? date.toIso8601String() : null;

  void setToken(String token) {
    if (token == null) {
      dio.options.headers.remove('Authorization');
    } else {
      print(token);
      dio.options.headers = {
        'Authorization': "Bearer " + token
      };
    }
  }

  void setUrl(String url) {
    if (url != null && url.isNotEmpty) {
      dio.options.baseUrl = url;
    } else {
      dio.options.baseUrl = _defaultUrl;
    }
  }

  Future<dynamic> login(String user, String password, String deviceId) async {
    return _request(
      ()=> dio.post(_loginPath,
        data: {
          'user': user,
          'password': password
        },
        options: Options(
          headers: {
            'Device-UID': deviceId
          }
        )
      )
    );
  }

  Future<dynamic> refresh(String refreshToken, String deviceId) async {
    return _request(
      ()=> dio.post(_refreshPath,
        data: refreshToken,
        options: Options(
          headers: {
            'Device-UID': deviceId
          }
        )
      )
    );
  }

  Future<dynamic> getInstructions() async {
    return _request(
      ()=> dio.get(_instructionsPath, 
        queryParameters: {
          'engagedUserId': 'me'
        }
      )
    );
  }

  Future<dynamic> getDictionary<T>(int from, int to, {String sort, String violationKindIds}) async {
    return _request(
      () => dio.get(_dictionaryMap[T], 
        queryParameters: {
          'from': from,
          'to': to,
          'sort': sort,
          'violationKindIds': violationKindIds,
        },
      ),
    );
  }

  Future<dynamic> getInstruction(int id) async {
    return _request(
      ()=> dio.get(_instructionsPath + '/$id')
    );
  }

  Future<dynamic> getInstructionReports(int id) async {
    return _request(
      ()=> dio.get(_instructionsPath + '/$id' + _reportsPath)
    );
  }

  Future<dynamic> updateInstruction(int id, {InstructionStatus instructionStatus, String rejectReason}) async {
    return _request(
      ()=> dio.patch(_instructionsPath + '/$id',
        data: {
          'instructionStatus': instructionStatus.toJson(),
          if(rejectReason != null)
            'rejectReason': rejectReason,
        }
      )
    );
  }
  
  Future<dynamic> createReport(Report report) async {
    final json = report.toJson();
    _removeJsonNulls(json);
    // var t = c.json.encode(json);
    //  print(report.reportNum);
    //  print(report.violations.first.violationDate);
     //print(t);
    return _request(
      ()=> dio.post(_reportsPath,
        data: json
      )
    );
  }

  Future<dynamic> updateReport(Report report) async {
    final json = report.toJson();
    _removeJsonNulls(json);
     //var t = c.json.encode(json);
    //  print(report.reportNum);
    //  print(report.violations.first.violationDate);
     //print(t);
    return _request(
      ()=> dio.put(_reportsPath + '/${report.id}',
        data: json
      )
    );
  }

  Future removeReport(Report report) async {
    return _request(
      ()=> dio.delete(_reportsPath + '/${report.id}', )
    );
  }

  Future<dynamic> getReportStatusInfo(Report report) async {
    return _request(
      () => dio.get('$_reportsPath/${report.id}/status'),
    );
  }

  Future<dynamic> getControlObjectById(int dcObjectId) {
    return _request(
      () => dio.get('$_departmentControlPath/$dcObjectId'),
    );
  }

  Future<dynamic> getControlObjects({
    int dcObjectTypesIds, 
    String dcObjectKind,
    int externalId,
    String objectName,
    int areaIds,
    int districtIds,
    int addressIds,
    int streetIds,
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
  }) async => 
    _request(() => dio.get('$_departmentControlPath', queryParameters: _removeJsonNulls({
      'dcObjectTypesIds': dcObjectTypesIds,
      'dcObjectKind': dcObjectKind,
      'externalId': externalId,
      'objectName': objectName,
      'areaIds': areaIds,
      'districtIds': districtIds,
      'streetIds': streetIds,
      'addressIds': addressIds,
      'onlyNearObjects': onlyNearObjects,
      'userPositionX': userPositionX,
      'userPositionY': userPositionY,
      'searchRadius': searchRadius,
      'balanceOwner': balanceOwner,
      'daysFromLastSurvey': daysFromLastSurvey,
      'lastSurveyDateFrom': _formatDate(lastSurveyDateFrom),
      'lastSurveyDateTo': _formatDate(lastSurveyDateTo),
      'camerasExist': camerasExist,
      'ignoreViolations': ignoreViolations,
      'forCurrentUser': forCurrentUser,
      'objectElementIds': objectElementIds,
      'violationNameIds': violationNameIds,
      'sourceId': sourceId,
      'violationNum': violationNum,
      'violationStatusIds': violationStatusIds,
      'detectionDateFrom': _formatDate(detectionDateFrom),
      'detectionDateTo': _formatDate(detectionDateTo),
      'controlDateFrom': _formatDate(controlDateFrom),
      'controlDateTo': _formatDate(controlDateTo),
      'from': from,
      'to': to,
      'sort': sort,
    })),
  );

  Future<dynamic> getControlSearchResults(int dcObjectId, {
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
  }) async {
    return _request(() => dio.get('/dc-objects/$dcObjectId/control-results', queryParameters: _removeJsonNulls({
      'forCurrentUser': forCurrentUser,
      'surveyDateFrom': surveyDateFrom,
      'surveyDateTo': surveyDateTo,
      'violationExists': violationExists,
      'violationNum': violationNum,
      'dcViolationStatusIds': dcViolationStatusIds,
      'dcViolationTypeId': dcViolationTypeId,
      'dcViolationKindId': dcViolationKindId,
      'sourceId': sourceId,
      'from': from,
      'sort': sort,
    })));
  }

  Future<dynamic> getControlSearchResultsByIds(int dcObjectId, int dcControlResultId) {
    return _request(() => dio.get('/dc-objects/$dcObjectId/control-results/$dcControlResultId'));
  }

  Future<dynamic> createDCControlResult(int dcObjectId, ControlResult result) {
    return _request(() => dio.post('/dc-objects/$dcObjectId/control-results', data: result.toJson()));
  }

  Future<dynamic> updateDCControlResult(int dcObjectId, int dcControlResultId, DCViolation violation) {
    return _request(() => dio.patch('/dc-objects/$dcObjectId/control-results/$dcControlResultId', data: {"violation": violation.toJson()}));
  }

  Future<dynamic> removeDCControlResult(int dcObjectId, int dcControlResultId) {
    return _request(() => dio.delete('/dc-objects/$dcObjectId/control-results/$dcControlResultId'));
  }

  Future<dynamic> createDCPerformControlResult(int dcObjectId, int dcControlResultId, PerformControl performControl) {
    return _request(() => dio.post('/dc-objects/$dcObjectId/control-results/$dcControlResultId/perform-controls', data: performControl.toJson()));
  }

  Future<dynamic> updateDCPerformControlResult(int dcObjectId, int dcControlResultId, PerformControl performControl) {
    return _request(() => dio.patch('/dc-objects/$dcObjectId/control-results/$dcControlResultId/perform-controls', data: performControl.toJson()));
  }

  Future<dynamic> removeDCPerformControlResult(int dcObjectId, int dcControlResultId, int performControlId) {
    return _request(() => dio.delete('/dc-objects/$dcObjectId/control-results/$dcControlResultId/perform-controls/$performControlId'));
  }

  Future<dynamic> extendPeriod(int dcObjectId, int dcControlResultId, ViolationExtensionPeriod violationExtensionPeriod) {
    return _request(() => dio.post('/dc-objects/${dcObjectId}/control-results/${dcControlResultId}/op/extend-resolution-period', data: violationExtensionPeriod.toJson()));
  }

  Future<dynamic> getControlResults({
    int dcObjectId,
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
  }) => _request(() => dio.get('/dc-objects/control-results', queryParameters: _removeJsonNulls({
    "dcObjectId": dcObjectId,
    "forCurrentUser": forCurrentUser,
    "surveyDateFrom": surveyDateFrom,
    "surveyDateTo": surveyDateTo,
    "violationExists": violationExists,
    "violationNum": violationNum,
    "dcViolationStatusIds": dcViolationStatusIds,
    "dcViolationTypeId": dcViolationTypeId,
    "dcViolationKindId": dcViolationKindId,
    "sourceId": sourceId,
    "from": from,
    "to": to,
    "sort": sort,
  })));

  Future<dynamic> getParams() 
    => _request(() => dio.get('/parameters'));
}