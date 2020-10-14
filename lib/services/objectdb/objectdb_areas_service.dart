
import 'package:inspector/model/area.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ObjectDbAreasService extends ObjectDbCollectionService<Area> {

  String get name => 'areas.db';

  ObjectDbAreasService(): super((json) => Area.fromJson(json));
}
