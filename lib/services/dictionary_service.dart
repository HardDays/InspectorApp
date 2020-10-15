
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/dictionary_metadata.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/sqlite/sqlite_collection_service.dart';
import 'package:synchronized/synchronized.dart';

class DictionaryService {
  final _maxCount = 500;
  static final _instance = DictionaryService._internal();

  factory DictionaryService() {
    return _instance;
  }

  DictionaryService._internal();

  final _dbService = SqliteCollectionService();

  // final Map<String, SqliteCollectionService> _dbServices = {
  //   DictionaryNames.areas: SqliteCollectionService(DictionaryNames.areas, (json)=> Area.fromJson(json)),
  //   DictionaryNames.streets: SqliteCollectionService(DictionaryNames.streets, (json)=> Street.fromJson(json)),
  //   DictionaryNames.districts: SqliteCollectionService(DictionaryNames.districts, (json)=> District.fromJson(json)),
  //   DictionaryNames.addresses: SqliteCollectionService(DictionaryNames.addresses, (json)=> Address.fromJson(json, stringified: true)),
  //   DictionaryNames.instructionStatuses: SqliteCollectionService(DictionaryNames.instructionStatuses, (json)=> InstructionStatus.fromJson(json)),
  //   DictionaryNames.specialObjects: SqliteCollectionService(DictionaryNames.specialObjects, (json)=> SpecialObject.fromJson(json)),
  //   DictionaryNames.normativeActs: SqliteCollectionService(DictionaryNames.normativeActs, (json)=> NormativeAct.fromJson(json)),
  //   DictionaryNames.normativeActArticles: SqliteCollectionService(DictionaryNames.normativeActArticles, (json)=> NormativeActArticle.fromJson(json)),
  //   DictionaryNames.violationTypes: SqliteCollectionService(DictionaryNames.violationTypes, (json)=> ViolationType.fromJson(json)),
  //   DictionaryNames.violatorTypes: SqliteCollectionService(DictionaryNames.violatorTypes, (json)=> ViolatorType.fromJson(json)),
  //   DictionaryNames.departmentCodes: SqliteCollectionService(DictionaryNames.departmentCodes, (json)=> DepartmentCode.fromJson(json)),
  // };

  final Map<String, Future<List> Function(int, int)> _loaders = {
    DictionaryNames.areas: ApiDictionaryService().getAreas,
    DictionaryNames.streets: ApiDictionaryService().getStreets,
    DictionaryNames.districts: ApiDictionaryService().getDistricts,
    DictionaryNames.addresses: ApiDictionaryService().getAddresses,
    DictionaryNames.instructionStatuses: ApiDictionaryService().getInstructionStatuses,
    DictionaryNames.specialObjects: ApiDictionaryService().getSpecialObjects,
    DictionaryNames.normativeActs: ApiDictionaryService().getNormativeActs,
    DictionaryNames.normativeActArticles: ApiDictionaryService().getNormativeActArticles,
    DictionaryNames.violationTypes: ApiDictionaryService().getViolationTypes,
    DictionaryNames.violatorTypes: ApiDictionaryService().getViolatorTypes,
    DictionaryNames.departmentCodes: ApiDictionaryService().getDepartmentCodes,
  };

 final Map<String, Function(Map<String, dynamic>)> _converters = {
    DictionaryNames.areas: (json)=> Area.fromJson(json),
    DictionaryNames.streets: (json)=> Street.fromJson(json),
    DictionaryNames.districts: (json)=> District.fromJson(json),
    DictionaryNames.addresses: (json)=> Address.fromJson(json, stringified: true),
    DictionaryNames.instructionStatuses: (json)=> InstructionStatus.fromJson(json),
    DictionaryNames.specialObjects: (json)=> SpecialObject.fromJson(json),
    DictionaryNames.normativeActs: (json)=> NormativeAct.fromJson(json),
    DictionaryNames.normativeActArticles: (json)=> NormativeActArticle.fromJson(json),
    DictionaryNames.violationTypes: (json)=> ViolationType.fromJson(json),
    DictionaryNames.violatorTypes: (json)=> ViolatorType.fromJson(json),
    DictionaryNames.departmentCodes: (json)=> DepartmentCode.fromJson(json),
  };

  final _lock = Lock();
  final _persistanceService = ObjectDbPersistanceService();

  bool canceled = false;

  Future<bool> isLoaded({List<String> keys}) async {
    final metadata = await _persistanceService.getDictMetadata();
    for (final key in keys ?? _loaders.keys) {
      if (!metadata.loaded.containsKey(key)) {
        return false;
      }
    }
    return true;
  }

  Future load({Function(String, int) notifier, List<String> keys, bool reload = false}) async {
    await _lock.synchronized(() async {
      try {
        await _dbService.init();

        final metadata = await _persistanceService.getDictMetadata();
        for (final key in keys ?? _loaders.keys) {
          if (!metadata.loaded.containsKey(key) || reload) {
            await _dbService.clear(key);
            metadata.loaded.remove(key);;
            await _persistanceService.saveDictMetadata(metadata);

            int count = 0;
            int attempts = 10000;
            while (true) {
              final res = await _loaders[key](count, count + _maxCount);
              await _dbService.append(key, res);

              count += res.length;
              attempts--;

              if (notifier != null) {
                notifier(key, count);
              }
              print('$key $count ... ');

              if (res.isEmpty || attempts < 0) {
                break;
              }
              if (canceled) {
                canceled = false;
                return;
              }
            } 
            metadata.loaded[key] = true;
            await _persistanceService.saveDictMetadata(metadata);
          }
        }
        await _persistanceService.saveDictMetadata(
          DictionaryMetadata(
            loaded: metadata.loaded, 
            loadetAt: DateTime.now(),
          ),
        );
      } catch (ex) {
        print(ex);
      }
    });
  }

  Future<List<T>>_getData<T>(String name, {String where, List<dynamic> whereArgs, int limit}) async {
    return await _dbService.all<T>(name, _converters[name], where: where, whereArgs: whereArgs, limit: limit);
  }

  Future<List<Address>> getAddresses({String houseNum}) async {
    return await _getData(DictionaryNames.addresses, where: 'houseNum LIKE ?', whereArgs: ['$houseNum%'], limit: 10);
  }

  Future<List<Area>> getAreas({String name}) async {
    return await _getData<Area>(DictionaryNames.areas, where: 'name LIKE ?', whereArgs: ['$name%'], limit: 10);
  }

  Future<List<District>> getDitricts({String name, int areaId}) async {
    return await _getData<District>(DictionaryNames.districts, where: 'name LIKE ?', whereArgs: ['$name%'], limit: 10);
  }

  Future<List<Street>> getStreets({String name}) async {
    return await _getData<Street>(DictionaryNames.streets, where: 'name LIKE ?', whereArgs: ['$name%'], limit: 10);
  }

  Future<List<InstructionStatus>> getInstructionStatuses() async {
    return await _getData<InstructionStatus>(DictionaryNames.instructionStatuses);
  }
  
  Future<List<SpecialObject>> getSpecialObjects() async {
    return await _getData<SpecialObject>(DictionaryNames.specialObjects);
  }

  Future<List<NormativeAct>> getNormativeActs() async {
    return await _getData<NormativeAct>(DictionaryNames.normativeActs);
  }

  Future<List<NormativeActArticle>> getNormativeActArticles() async {
    return await _getData<NormativeActArticle>(DictionaryNames.normativeActArticles);
  }

  Future<List<ViolatorType>> getViolatorTypes() async {
    return await _getData<ViolatorType>(DictionaryNames.violatorTypes);
  }

  Future<List<ViolationType>> getViolationTypes() async {
    return await _getData<ViolationType>(DictionaryNames.violationTypes);
  }

  Future<List<DepartmentCode>> getDepartmentCodes() async {
    return await _getData<DepartmentCode>(DictionaryNames.departmentCodes);
  }
}
