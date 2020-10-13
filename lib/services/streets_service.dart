import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/lazy_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_streets_service.dart';

class StreetsService extends LazyCollectionService<Street> {

  static final _instance = StreetsService._internal();

  factory StreetsService() {
    return _instance;
  }

  StreetsService._internal() : super(
    ObjectDbStreetsService(), 
    ApiService().getStreets,
  );
}
