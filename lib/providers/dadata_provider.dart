
import 'package:dio/dio.dart';
import 'package:inspector/model/address.dart';

class DadataProvider {
  
  static const _url = 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address';
  static const _apiKey = '5c04478b7c60e7bee16dc5088c2d713a8c61eb54';

  static final _instance = DadataProvider._internal();

  final _dio = Dio(
    BaseOptions(
      headers: {
        'Authorization': 'Token $_apiKey'
      }
    )
  );

  factory DadataProvider() {
    return _instance;
  }

  DadataProvider._internal();

  Future<dynamic> suggest(String query, {List<Map<String, String>> locations = const [], String fromBound, String toBound}) async {
    try {
      final res = await _dio.post(_url,
        data: {
          'query': query,
          'locations': locations,
          "from_bound": {
            "value": fromBound
          },
          "to_bound": {
            "value": toBound
          }
        }
      );
      return res.data; 
    } catch (ex) {
      print(ex);
    }
  }


}
