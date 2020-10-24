import 'package:dio/dio.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/employee.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/oati_department.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/resolution_type.dart';
import 'package:inspector/model/special_object.dart';
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

import 'dart:convert' as c;

class ApiProvider {
  static const _url = 'http://212.46.14.26:9930/oati-integration-rest';
  static const _loginPath = '/login';
  static const _instructionsPath = '/instructions';
  static const _reportsPath = '/reports';

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
  };

  final dio = Dio(BaseOptions(baseUrl: _url));

  static final _instance = ApiProvider._internal();

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal();

  Future<dynamic> _request(Function request) async {
    try {
      final result = (await request()).data;
      return result;
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.RESPONSE) {
        if (ex.response.statusCode == 401)  {
          throw UnauthorizedException(
            ex.response.data?.toString()
          );
        } else {  
          throw ServerException(
            ex.response.statusCode,
            ex.response.data?.toString(),
          );
        }
      } else if (ex.type == DioErrorType.CONNECT_TIMEOUT || ex.type == DioErrorType.RECEIVE_TIMEOUT || ex.type == DioErrorType.SEND_TIMEOUT) {
        throw TimeoutException(ex.response.data?.toString());
      } else {
        throw UnhandledException(ex.message);
      }
    } 
  }

  void _removeJsonNulls(Map<String, dynamic> json) {
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
  }

  void setToken(String token) {
    if (token == null) {
      dio.options.headers.remove('Authorization');
    } else {
      dio.options.headers = {
        'Authorization': "Bearer " + token
      };
    }
  }

  Future<dynamic> login(String user, String password) async {
    return _request(
      ()=> dio.post(_loginPath,
        data: {
          'user': user,
          'password': password
        }
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

  Future<dynamic> getDictionary<T>(int from, int to) async {
    return _request(
      () => dio.get(_dictionaryMap[T], 
        queryParameters: {
          'from': from,
          'to': to,
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

  Future<dynamic> updateInstruction(int id, {InstructionStatus instructionStatus}) async {
    return _request(
      ()=> dio.patch(_instructionsPath + '/$id',
        data: {
          'instructionStatus': instructionStatus.toJson()
        }
      )
    );
  }

  Future<dynamic> createReport(Report report) async {
    final json = report.toJson();
    _removeJsonNulls(json);
    var t = c.json.encode(json);
    return _request(
      ()=> dio.post(_reportsPath,
        data: json
      )
    );
  }
}
