import 'package:dio/dio.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/providers/exceptions/server_exception.dart';
import 'package:inspector/providers/exceptions/timeout_exception.dart';
import 'package:inspector/providers/exceptions/unauthorized_exception.dart';
import 'package:inspector/providers/exceptions/unhadled_exception.dart';

class ApiProvider {
  
  static const _url = 'http://212.46.14.26:9930/oati-integration-rest';
  static const _loginPath = '/login';
  static const _instructionsPath = '/instructions';
  static const _dictPath = '/dict';
  static const _instructionStatusesPath = '/instruction-statuses';
  static const _areasPath = '/areas';
  static const _streetsPath = '/streets';
  static const _districtsPath = '/districts';
  static const _addressesPath = '/addresses';
  static const _specialObjectsPath = '/special-objects';

  final dio = Dio(
    BaseOptions(
      baseUrl: _url
    )
  );

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

  Future<dynamic> getInstruction(int id) async {
    return _request(
      ()=> dio.get(_instructionsPath + '/$id')
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
  
  Future<dynamic> getInstructionStatuses() async {
    return _request(
      ()=> dio.get(_dictPath + _instructionStatusesPath)
    );
  }

  Future<dynamic> getAreas() async {
    return _request(
      ()=> dio.get(_dictPath + _areasPath)
    );
  }

  Future<dynamic> getStreets() async {
    return _request(
      ()=> dio.get(_dictPath + _streetsPath)
    );
  }

  Future<dynamic> getDistricts() async {
    return _request(
      ()=> dio.get(_dictPath + _districtsPath)
    );
  }

  Future<dynamic> getAddresses() async {
    return _request(
      ()=> dio.get(_dictPath + _addressesPath)
    );
  }

  Future<dynamic> getSpecialObjects() async {
    return _request(
      ()=> dio.get(_dictPath + _specialObjectsPath)
    );
  }

}