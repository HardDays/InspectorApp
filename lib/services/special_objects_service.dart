import 'package:inspector/model/special_object.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/services/lazy_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_special_objects_service.dart';

class SpecialObjectsService extends LazyCollectionService<SpecialObject> {

  static final _instance = SpecialObjectsService._internal();

  factory SpecialObjectsService() {
    return _instance;
  }

  SpecialObjectsService._internal() : super(
    ObjectDbSpecialObjectsService(), 
    DictionaryService().getSpecialObjects,
  );
}
