import 'package:inspector/model/district.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/lazy_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_districts_service.dart';

class DistrictsService extends LazyCollectionService<District> {

  static final _instance = DistrictsService._internal();

  factory DistrictsService() {
    return _instance;
  }

  DistrictsService._internal() : super(
    ObjectDbDistrictsService(), 
    ApiService().getDistricts,
  );
}
