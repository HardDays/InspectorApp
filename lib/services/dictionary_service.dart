
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/object_kind.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';
import 'package:inspector/model/department_control/violation_extension_reason.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/model/dictionary_metadata.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/kladdr_address_object_type.dart';
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
    DictionaryNames.kladdrAddressTypes: ApiDictionaryService().getKladdrAddressTypes,
    DictionaryNames.dcObjectElements: ApiDictionaryService().getDCObjectElements,
    DictionaryNames.dcObjectKinds: ApiDictionaryService().getDCObjectKinds,
    DictionaryNames.dcObjectTypes: ApiDictionaryService().getDCObjectTypes,
    DictionaryNames.dcViolationNames: ApiDictionaryService().getDCViolationNames,
    DictionaryNames.dcViolationStatuses: ApiDictionaryService().getDCViolationStatuses,
    DictionaryNames.dcContractors: ApiDictionaryService().getContractors,
    DictionaryNames.dcViolationAdditionalFeatures: ApiDictionaryService().getViolationAdditionalFeatures,
    DictionaryNames.dcSources: ApiDictionaryService().getDCSources,
    DictionaryNames.dcViolationClassificationSearchResults: ApiDictionaryService().getViolationClassifications,
    DictionaryNames.dcViolationExtensionReasons: ApiDictionaryService().getViolationExtensionReasons,
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
    DictionaryNames.kladdrAddressTypes: (json)=> KladdrAddressObjectType.fromJson(json),
    DictionaryNames.dcObjectElements: (json)=> ObjectElement.fromJson(json),
    DictionaryNames.dcObjectKinds: (json)=> ObjectKind.fromJson(json),
    DictionaryNames.dcObjectTypes: (json)=> ObjectType.fromJson(json),
    DictionaryNames.dcViolationNames: (json)=> ViolationName.fromJson(json),
    DictionaryNames.dcViolationStatuses: (json)=> ViolationStatus.fromJson(json),
    DictionaryNames.dcContractors: (json)=> Contractor.fromJson(json),
    DictionaryNames.dcViolationAdditionalFeatures: (json)=> ViolationAdditionalFeature.fromJson(json),
    DictionaryNames.dcSources: (json)=> Source.fromJson(json),
    DictionaryNames.dcViolationClassificationSearchResults: (json) => ViolationClassificationSearchResult.fromSqliteJson(json),
    DictionaryNames.dcViolationExtensionReasons: (json) => ViolationExtensionReason.fromJson(json),
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
    // metadata.loaded.remove(DictionaryNames.violationTypes);
    // await _dbService.saveMetadata(DictionaryMetadata(
    //     loaded: metadata.loaded, 
    //   )
    // );

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
            metadata.loaded.remove(key);
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

  Future<List<Address>> getAddresses({String houseNum, int streetId, int areaId, int districtId}) async {
    return await _getData(DictionaryNames.addresses, 
      queries: [
        Query({
          'houseNum LIKE ?': '$houseNum%',
          'streetId = ?': streetId,
          'areaId = ?': areaId,
          'districtId = ?': districtId,
        }),
      ],
      limit: 50
    );
  }

  Future<List<Area>> getAreas({String name, int id}) async {
    return await _getData<Area>(DictionaryNames.areas, 
       queries: [
        Query(
          {
            'name LIKE ?': '$name%',
            'id = ?' : id
          },
          queryType: 'OR'
        ),
      ],
      limit: 50
    );
  }

  Future<List<District>> getDitricts({String name,  int areaId}) async {
    return await _getData<District>(DictionaryNames.districts, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
          'areaId = ?': areaId,
        }),
      ],
      limit: 50
    );
  }

  Future<List<District>> getDitrictsByName({String name}) async {
    return await _getData<District>(DictionaryNames.districts, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<District>> getDitrictsById({int id}) async {
    return await _getData<District>(DictionaryNames.districts, 
      queries: [
        Query({
          'id = ?': id,
        }),
      ],
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
    );
  }

  Future<List<NormativeAct>> getNormativeActs({String name}) async {
    return await _getData<NormativeAct>(DictionaryNames.normativeActs,
      queries: [
        Query({
          'name LIKE ?': '%$name%',
        }),
      ],
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
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
      limit: 50
    );
  }

  Future<List<KladdrAddressObjectType>> getKladdAddressTypes({String name,  String level}) async {
    return await _getData<KladdrAddressObjectType>(DictionaryNames.kladdrAddressTypes, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
          'level = ?': level,
        }),
      ],
      limit: 50
    );
  }

  Future<List<ObjectType>> getDCObjectTypes({String name}) async {
    return await _getData<ObjectType>(DictionaryNames.dcObjectTypes, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<ObjectKind>> getDCObjectKinds({String name}) async {
    return await _getData<ObjectKind>(DictionaryNames.dcObjectKinds, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<ViolationStatus>> getDCViolationStatuses({String name}) async {
    return await _getData<ViolationStatus>(DictionaryNames.dcViolationStatuses, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<ObjectElement>> getDCObjectElements({String name}) async {
    return await _getData<ObjectElement>(DictionaryNames.dcObjectElements, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<ViolationName>> getDCViolationNames({String name}) async {
    return await _getData<ViolationName>(DictionaryNames.dcViolationNames, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<Contractor>> getContractors({String name}) async {
    return await _getData<Contractor>(DictionaryNames.dcContractors, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

   Future<List<Source>> getDCSources({String name}) async {
    return await _getData<Source>(DictionaryNames.dcSources, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

   Future<List<ViolationAdditionalFeature>> getViolationAdditionalFeatures({String name}) async {
    return await _getData<ViolationAdditionalFeature>(DictionaryNames.dcViolationAdditionalFeatures, 
      queries: [
        Query({
          'name LIKE ?': '$name%',
        }),
      ],
      limit: 50
    );
  }

   Future<List<ViolationClassificationSearchResult>> getViolationClassificationSearchResults({String name, ObjectElement objectElement}) async {
    return await _getData<ViolationClassificationSearchResult>(DictionaryNames.dcViolationClassificationSearchResults, 
      queries: [
        Query({
          'violationNameName LIKE ?': '$name%',
          if(objectElement != null)
            if(objectElement.id != null)
              'objectElementId = ?': objectElement.id
            else
              'objectElementName LIKE ?': '${objectElement.name}%',
        }),
      ],
      limit: 50
    );
  }

  Future<List<ViolationExtensionReason>> getViolationExtensionReasons({String name}) async {
    return await _getData<ViolationExtensionReason>(DictionaryNames.dcViolationExtensionReasons,
      queries: [
        Query({
          'name LIKE ?': '%$name%',
        }),
      ],
      limit: 50
    );
  }

}
