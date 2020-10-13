import 'package:inspector/model/address.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/lazy_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_addresses_service.dart';

class AddressesService extends LazyCollectionService<Address> {

  static final _instance = AddressesService._internal();

  factory AddressesService() {
    return _instance;
  }

  AddressesService._internal() : super(
    ObjectDbAddressesService(), 
    ApiService().getAddresses,
  );
}
