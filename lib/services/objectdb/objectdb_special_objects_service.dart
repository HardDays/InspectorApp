import 'package:inspector/model/special_object.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDbSpecialObjectsService extends ObjectDbCollectionService<SpecialObject> {

  String get name => 'special_objects.db';

  ObjectDbSpecialObjectsService(): super(SpecialObject.fromJson);
}
