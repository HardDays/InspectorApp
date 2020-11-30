import 'package:inspector/model/address_search.dart';
import 'package:inspector/providers/here_provider.dart';

class HereService {

  final _here = HereProvider();

  List<AddressSearch> _parse(List<dynamic> value) {
    final List<AddressSearch> result = [];
    for (final data in value) {
      final address = data['address'];
      result.add(
        AddressSearch(  
          //area: address['state'],
          street: address['street'],
          district: address['district'],
          house: address['houseNumber'],
          lat: data['position'] != null ? data['position']['lat'] : null,
          lng: data['position'] != null ? data['position']['lng'] : null,
        ),
      );
    }
    return result;
  }

  Future<List<AddressSearch>> autocomplete(String query) async {
    final res = await _here.autocomplete(query);
    try {
      if (res != null) {
        return _parse(res['suggestions']);
      } else {
        return [];
      }
    } catch (ex) {
      return [];
    }
  }

  Future<List<AddressSearch>> geocode(String query) async {
    final res = await _here.geocode(query);
    try {
      if (res != null) {
        return _parse(res['items']);
      } else {
        return [];
      }
    } catch (ex) {
      print(ex);
      return [];
    }
  }

   Future<List<AddressSearch>> reverseGeocode(double lat, double lng) async {
    final res = await _here.reverseGeocode(lat, lng);
    try {
      if (res != null) {
        return _parse(res['items']);
      } else {
        return [];
      }
    } catch (ex) {
      print(ex);
      return [];
    }
  }
}