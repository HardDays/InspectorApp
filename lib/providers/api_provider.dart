import 'package:dio/dio.dart';

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

  // todo: read token from localstorage etc and call it somewhere, just test login
  Future init() async {
    final response = await login('test_51_insp', 'TEST_51_INSP');
    dio.options.headers = {
      'Authorization': "Bearer " + response.data['token']
    };
  }

  Future<Response<dynamic>> login(String user, String password) async {
    final response = await dio.post(_loginPath,
      data: {
        'user': user,
        'password': password
      }
    );
    return response;
  }

  Future<Response<dynamic>> getInstructions() async {
    final response = await dio.get(_instructionsPath, 
      queryParameters: {
        'engagedUserId': 'me'
      }
    );
    return response;
  }

}