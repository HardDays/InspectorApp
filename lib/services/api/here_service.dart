import 'package:inspector/model/address_search.dart';
import 'package:inspector/providers/here_provider.dart';

class HereService {

  final _here = HereProvider();

  Future<List<AddressSearch>> autocomplete(String query) async {
    final res = await _here.autocomplete(query);
    try {
      final List<AddressSearch> result = [];
      if (res != null) {
        for (final data in res['suggestions']) {
          final address = data['address'];
          result.add(
            AddressSearch(  
              area: address['state'],
              street: address['street'],
              district: address['district'],
              house: address['houseNumber']
            ),
          );
        }
      } 
      return result;
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<List<AddressSearch>> geocode(String query) async {
    final res = await _here.geocode(query);
    try {
      final List<AddressSearch> result = [];
      if (res != null) {
        for (final data in res['items']) {
          final address = data['address'];
          result.add(
            AddressSearch(  
              area: address['state'],
              street: address['street'],
              district: address['district'],
              house: address['houseNumber'],
              lat: data['position']['lat'],
              lng: data['position']['lng'],
            ),
          );
        }
      } 
      return result;
    } catch (ex) {
      print(ex);
      return [];
    }
  }
}