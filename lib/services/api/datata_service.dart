import 'package:inspector/model/violator_address.dart';
import 'package:inspector/providers/dadata_provider.dart';

class DadataService {

  final _dadata = DadataProvider();

  List<ViolatorAddress> _parse(List<dynamic> value) {
    final List<ViolatorAddress> result = [];
    for (final data in value) {
      final address = data['data'];
      result.add(
        ViolatorAddress(  
          cladrCode: address['kladr_id'],
          zipCode: address['postal_code'],
          cityName: address['city'],
          cityType: address['city_type'],
          streetName: address['street'],
          streetType: address['street_type'],
          regionName: address['area'],
          regionType: address['area_type'],
          placeName: address['settlement'],
          placeType: address['settlement_type'],
          subjectName: address['region'],
          subjectType: address['region_type'],
          subjectCode: address['region_kladr_id'],
        ),  
      );
    }
    return result;
  }

  Future<List<ViolatorAddress>> suggest(String query, {List<Map<String, String>> locations = const [], String fromBound, String toBound}) async {
    final res = await _dadata.suggest(query, locations: locations, fromBound: fromBound, toBound: toBound);
    try {
      if (res != null) {
        return _parse(res['suggestions']);
      } else {
        return [];
      }
    } catch (ex) {
      print(ex);
      return [];
    }

  }
}