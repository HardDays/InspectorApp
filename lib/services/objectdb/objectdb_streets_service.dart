
import 'package:inspector/model/street.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDbStreetsService extends ObjectDbCollectionService<Street> {

  String get name => 'streets.db';

  ObjectDbStreetsService(): super(Street.fromJson);
}
