import 'package:inspector/model/address_search.dart';
import 'package:inspector/services/api/here_service.dart';

class GeoService {

  final _here = HereService();

  Future<List<AddressSearch>> autocomplete(String query) async {
    return await _here.autocomplete(query);
  }

  Future<AddressSearch> geocode(String query) async {
    final res = await _here.geocode(query);
    if (res.isNotEmpty) {
      return res.first;
    }
  }
}