import 'package:inspector/model/area.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/lazy_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_areas_service.dart';

class AreasService extends LazyCollectionService<Area> {

  static final _instance = AreasService._internal();

  factory AreasService() {
    return _instance;
  }

  AreasService._internal() : super(
    ObjectDbAreasService(), 
    ApiService().getAreas,
  );
}
