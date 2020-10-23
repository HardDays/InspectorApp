
import 'package:dio/dio.dart';
import 'package:inspector/model/address.dart';

class HereProvider {
  
  static const _autcompleteUrl = 'https://autocomplete.geocoder.ls.hereapi.com/6.2/suggest.json';
  static const _geocodeUrl = 'https://geocode.search.hereapi.com/v1/geocode';

  static const _apiKey = 'RyX4XclwpNvvCDwtFpP9HrLnMBo67BmNP4Kud-0p_OQ';
  static const _mapview = '56.896398,34.862339;54.754490,39.546748';


  static final _instance = HereProvider._internal();

  final _dio = Dio(BaseOptions());

  factory HereProvider() {
    return _instance;
  }

  HereProvider._internal();

  Future<dynamic> autocomplete(String query) async {
    try {
      final res = await _dio.get(_autcompleteUrl,
        queryParameters: {
          'apiKey': _apiKey,
          'mapview': _mapview,
          'query': query
        }
      );
      return res.data; 
    } catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> geocode(String query) async {
    try {
      final res = await _dio.get(_geocodeUrl,
        queryParameters: {
          'apiKey': _apiKey,
          'mapview': _mapview,
          'q': query
        }
      );
      return res.data; 
    } catch (ex) {
      print(ex);
    }
  }

}
