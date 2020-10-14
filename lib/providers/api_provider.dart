import 'package:dio/dio.dart';
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
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/providers/exceptions/server_exception.dart';
import 'package:inspector/providers/exceptions/timeout_exception.dart';
import 'package:inspector/providers/exceptions/unauthorized_exception.dart';

class ApiProvider {
  static const _url = 'http://212.46.14.26:9930/oati-integration-rest';
  static const _loginPath = '/login';
  static const _instructionsPath = '/instructions';

  static const Map<Type, String> _dictionaryMap = {
    SpecialObject: '/dict/special-objects',
    ObjectCategory: '/dict/object-categories',
    CheckStatus: '/dict/check-statuses',
    Address: '/dict/addresses',
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
      final t = (await request()).data;
      return t;
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.RESPONSE) {
        if (ex.response.statusCode == 401)  {
          throw UnauthorizedException();
        } else {
          throw ServerException(
            ex.response.statusCode,
            ex.response.data,
          );
        }
      } else if (ex.type == DioErrorType.CONNECT_TIMEOUT || ex.type == DioErrorType.RECEIVE_TIMEOUT || ex.type == DioErrorType.SEND_TIMEOUT) {
        throw TimeoutException();
      } else {
        throw ApiException();
      }
    }
  }

  // todo: read token from localstorage etc and call it somewhere, just test login
  Future init() async {
    // final data = await login('test_51_insp', 'TEST_51_INSP');
    // dio.options.headers = {
    //   'Authorization': "Bearer " + data['token']
    // };
  }

  void setToken(String token) {
    dio.options.headers = {
      'Authorization': "Bearer " + token
    };
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

  Future<dynamic> getDictionary<T>() async {
    return _request(() => dio.get(_dictionaryMap[T]));
  }
}
