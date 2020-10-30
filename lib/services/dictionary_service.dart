
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/dictionary_metadata.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/services/sqlite/sqlite_dictionary_service.dart';
import 'package:synchronized/synchronized.dart';

class DictionaryService {
  final _maxCount = 500;
  static final _instance = DictionaryService._internal();

  factory DictionaryService() {
    return _instance;
  }

  DictionaryService._internal();

  final _dbService = SqliteDictionaryService();

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
    DictionaryNames.objectCategories: ApiDictionaryService().getObjectCategories,
    DictionaryNames.violatorInfoIps: ApiDictionaryService().getViolatorInfoIp,
    DictionaryNames.violatorInfoLegals: ApiDictionaryService().getViolatorInfoLegal,
    DictionaryNames.violatorInfoOfficials: ApiDictionaryService().getViolatorInfoOfficial,
    DictionaryNames.violatorInfoPrivates: ApiDictionaryService().getViolatorInfoPrivate,
    DictionaryNames.violatorDocumentTypes: ApiDictionaryService().getViolatorDocumentTypes,
    DictionaryNames.reportStatuses: ApiDictionaryService().getReportStatuses,

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
    DictionaryNames.objectCategories: (json)=> ObjectCategory.fromJson(json),
    DictionaryNames.violatorInfoIps: (json)=> ViolatorInfoIp.fromJson(json, stringified: true),
    DictionaryNames.violatorInfoLegals: (json)=> ViolatorInfoLegal.fromJson(json, stringified: true),
    DictionaryNames.violatorInfoOfficials: (json)=> ViolatorInfoOfficial.fromJson(json, stringified: true),
    DictionaryNames.violatorInfoPrivates: (json)=> ViolatorInfoPrivate.fromJson(json, stringified: true),
    DictionaryNames.violatorDocumentTypes: (json)=> ViolatorDocumentType.fromJson(json),
    DictionaryNames.reportStatuses: (json)=> ReportStatus.fromJson(json),
  };

  final _lock = Lock();

  bool canceled = false;

  Future<bool> isLoaded({List<String> keys}) async {
    final metadata = await _dbService.getMetadata();
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

        final metadata = await _dbService.getMetadata();
        for (final key in keys ?? _loaders.keys) {
          if (!metadata.loaded.containsKey(key) || reload) {
            await _dbService.clear(key);
            metadata.loaded.remove(key);;
            await _dbService.saveMetadata(metadata);

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
            await _dbService.saveMetadata(metadata);
          }
        }
        await _dbService.saveMetadata(
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

  Future<List<T>>_getData<T>(String name, {List<Query> queries = const [], int limit}) async {
    return await _dbService.all<T>(name, _converters[name], queries: queries, limit: limit);
  }

  Future<List<Address>> getAddresses({String houseNum, int streetId}) async {
    return await _getData(DictionaryNames.addresses, 
      queries: [
        Query({
          'houseNum LIKE ?': '$houseNum%',
          'streetId = ?': streetId
        }),
      ],
      limit: 10
    );
  }

  Future<List<Area>> getAreas({String name, int id}) async {
    return await _getData<Area>(DictionaryNames.areas, 
       queries: [
        Query(
          {
            'name LIKE ?': '$name%',
            'id = ?' : '$id'
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<District>> getDitricts({String name, int areaId}) async {
    return await _getData<District>(DictionaryNames.districts, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
          'areaId = ?': areaId
        }),
      ],
      limit: 10
    );
  }

  Future<List<District>> getDitrictsByName({String name}) async {
    return await _getData<District>(DictionaryNames.districts, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 10
    );
  }

  Future<List<Street>> getStreets({String name, int districtId}) async {
    return await _getData<Street>(DictionaryNames.streets, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
          'districtId = ?': districtId
        }),
      ],
      limit: 10
    );
  }

  Future<List<ViolationType>> getViolationTypes({String name}) async {
    return await _getData<ViolationType>(DictionaryNames.violationTypes, 
      queries: [
        Query(
          {
            'name LIKE ?': '$name%',
            'code LIKE ?': '$name%'
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<InstructionStatus>> getInstructionStatuses() async {
    return await _getData<InstructionStatus>(DictionaryNames.instructionStatuses);
  }
  
  Future<List<SpecialObject>> getSpecialObjects({String name}) async {
    return await _getData<SpecialObject>(DictionaryNames.specialObjects,
      queries: [
        Query({
          'name LIKE ?': '%$name%',
        }),
      ],
      limit: 10
    );
  }

  Future<List<ObjectCategory>> getObjectCategories({String name}) async {
    return await _getData<ObjectCategory>(DictionaryNames.objectCategories,
      queries: [
        Query(
          {
            'name LIKE ?': '%$name%',
            'code LIKE ?': '$name%'
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<NormativeAct>> getNormativeActs({String name}) async {
    return await _getData<NormativeAct>(DictionaryNames.normativeActs,
      queries: [
        Query({
          'name LIKE ?': '%$name%',
        }),
      ],
      limit: 10
    );
  }

  Future<List<NormativeActArticle>> getNormativeActArticles({String name, int normativeActId}) async {
    return await _getData<NormativeActArticle>(DictionaryNames.normativeActArticles,
      queries: [
        Query(
          {
            'name LIKE ?': '%$name%',
            'code LIKE ?': '$name%'
          },
          queryType: 'OR'
        ),
        Query(
          {
            'normativeActId = ?': normativeActId
          }
        )
      ],
      limit: 10
    );  
  }

  Future<List<ViolatorType>> getViolatorTypes({String name}) async {
    return await _getData<ViolatorType>(DictionaryNames.violatorTypes,
      queries: [
        Query(
          {
            'name LIKE ?': '%$name%',
          },
        ),
      ],
    );
  }

  Future<List<DepartmentCode>> getDepartmentCodes({String name}) async {
    return await _getData<DepartmentCode>(DictionaryNames.departmentCodes,
      queries: [
        Query(
          {
            'name LIKE ?': '%$name%',
            'code LIKE ?': '$name%'
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<ViolatorInfoLegal>> getViolatorInfoLegals({String name}) async {
    return await _getData<ViolatorInfoLegal>(DictionaryNames.violatorInfoLegals,
      queries: [
        Query(
          {
            'name LIKE ?': '%$name%',
            'phone LIKE ?': '$name%',
            'inn LIKE ?': '$name%'
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<ViolatorInfoOfficial>> getViolatorInfoOfficials({String name}) async {
    return await _getData<ViolatorInfoOfficial>(DictionaryNames.violatorInfoOfficials,
      queries: [
        Query(
          {
            'orgName LIKE ?': '%$name%',
            'phone LIKE ?': '$name%',
            'orgInn LIKE ?': '$name%'
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<ViolatorDocumentType>> getViolatorDocumentTypes({String name}) async {
    return await _getData<ViolatorDocumentType>(DictionaryNames.violatorDocumentTypes,
      queries: [
        Query(
          {
            'name LIKE ?': '%$name%',
          },
        ),
      ],
      limit: 10
    );
  }

  Future<List<ViolatorInfoPrivate>> getViolatorInfoPrivates({String name}) async {
    return await _getData<ViolatorInfoPrivate>(DictionaryNames.violatorInfoPrivates,
      queries: [
        Query(
          {
            'firstName LIKE ?': '%$name%',
            'lastName LIKE ?': '$name%',
            'patronym LIKE ?': '$name%',
            'phone LIKE ?': '$name%',
            'inn LIKE ?': '$name%',
            'docNumber LIKE ?': '$name%',
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

  Future<List<ViolatorInfoIp>> getViolatorInfoIps({String name}) async {
    return await _getData<ViolatorInfoIp>(DictionaryNames.violatorInfoIps,
      queries: [
        Query(
          {
            'firstName LIKE ?': '%$name%',
            'lastName LIKE ?': '$name%',
            'patronym LIKE ?': '$name%',
            'phone LIKE ?': '$name%',
            'inn LIKE ?': '$name%',
          },
          queryType: 'OR'
        ),
      ],
      limit: 10
    );
  }

   Future<List<ReportStatus>> getReportStatuses({int id}) async {
    return await _getData<ReportStatus>(DictionaryNames.reportStatuses,
      queries: [
        Query(
          {
            'id = ?': id,
          },
        ),
      ],
      limit: 10
    );
  }
}
