
import 'package:inspector/model/address.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDbAddressesService extends ObjectDbCollectionService<Address> {

  String get name => 'addresses.db';

  ObjectDbAddressesService(): super((json) => Address.fromJson(json));
}
