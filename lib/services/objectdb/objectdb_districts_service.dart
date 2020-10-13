
import 'package:inspector/model/district.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDbDistrictsService extends ObjectDbCollectionService<District> {

  String get name => 'districts.db';

  ObjectDbDistrictsService(): super(District.fromJson);
}
