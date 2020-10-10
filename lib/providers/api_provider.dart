import 'package:dio/dio.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/providers/exceptions/server_exception.dart';
import 'package:inspector/providers/exceptions/timeout_exception.dart';
import 'package:inspector/providers/exceptions/unauthorized_exception.dart';

class ApiProvider {
  
  static const _url = 'http://212.46.14.26:9930/oati-integration-rest';
  static const _loginPath = '/login';
  static const _instructionsPath = '/instructions';

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

}