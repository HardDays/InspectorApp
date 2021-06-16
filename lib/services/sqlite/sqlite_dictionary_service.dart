import 'dart:convert';

import 'package:inspector/model/dictionary_metadata.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DictionaryNames {
  static const addresses = 'addresses';
  static const streets = 'streets';
  static const areas = 'areas';
  static const districts = 'districts';
  static const instructionStatuses = 'instructionStatuses';
  static const specialObjects = 'specialObjects';
  static const normativeActs = 'normativeActs';
  static const normativeActArticles = 'normativeActArticles';
  static const violationTypes = 'violationTypes';
  static const violatorTypes = 'violatorTypes';
  static const departmentCodes = 'departmentCodes';
  static const objectCategories = 'objectCategories';
  static const violatorInfoIps = 'violatorInfoIps';
  static const violatorInfoLegals = 'violatorInfoLegals';
  static const violatorInfoOfficials = 'violatorInfoOfficials';
  static const violatorInfoPrivates = 'violatorInfoPrivates';
  static const violatorDocumentTypes = 'violatorDocumentTypes';
  static const reportStatuses = 'reportStatuses';
  static const kladdrAddressTypes = 'kladdrAddressTypes';
  static const dcObjectElements = 'dcObjectElements';
  static const dcObjectKinds = 'dcObjectKinds';
  static const dcObjectTypes = 'dcObjectTypes';
  static const dcViolationNames = 'dcViolationNames';
  static const dcViolationStatuses = 'dcViolationStatuses';
  static const dcContractors = 'dcContractors';
  static const dcViolationAdditionalFeatures = 'dcViolationAdditionalFeatures';
  static const dcSources = 'dcSources';
  static const dcViolationClassificationSearchResults =
      'dcViolationClassificationSearchResults';
  static const dcViolationExtensionReasons = 'dcViolationExtensionReasons';
}

class TableDefinitions {
  static const metadata = 'dictionaryMetadata';
  static const metadataDefinition =
      'CREATE TABLE IF NOT EXISTS dictionaryMetadata(id INTEGER PRIMARY KEY, data TEXT)';

  static const Map<String, String> all = {
    DictionaryNames.addresses:
        '''CREATE TABLE IF NOT EXISTS addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
      houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom INTEGER, unad INTEGER,
      area TEXT, district TEXT, street TEXT, areaId INTEGER, streetId INTEGER, districtId INTEGER
    )''',
    DictionaryNames.streets:
        '''CREATE TABLE IF NOT EXISTS streets(id INTEGER PRIMARY KEY, name TEXT, code TEXT, 
      areaId INTEGER, districtId INTEGER
    )''',
    DictionaryNames.areas:
        '''CREATE TABLE IF NOT EXISTS areas(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.districts:
        '''CREATE TABLE IF NOT EXISTS districts(id INTEGER PRIMARY KEY, name TEXT, code TEXT, areaId INTEGER)''',
    DictionaryNames.instructionStatuses:
        '''CREATE TABLE IF NOT EXISTS instructionStatuses(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.specialObjects:
        '''CREATE TABLE IF NOT EXISTS specialObjects(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.normativeActs:
        '''CREATE TABLE IF NOT EXISTS normativeActs(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.normativeActArticles:
        '''CREATE TABLE IF NOT EXISTS normativeActArticles(id INTEGER PRIMARY KEY, name TEXT, 
      code TEXT, normativeActId INTEGER, normativeAct TEXT
    )''',
    DictionaryNames.violationTypes:
        '''CREATE TABLE IF NOT EXISTS violationTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT, koap TEXT)''',
    DictionaryNames.violatorTypes:
        '''CREATE TABLE IF NOT EXISTS violatorTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.departmentCodes:
        '''CREATE TABLE IF NOT EXISTS departmentCodes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.objectCategories:
        '''CREATE TABLE IF NOT EXISTS objectCategories(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.violatorInfoIps:
        '''CREATE TABLE IF NOT EXISTS violatorInfoIps(id INTEGER PRIMARY KEY, phone TEXT, name TEXT, 
      lastName TEXT, firstName TEXT, patronym TEXT, 
      inn TEXT, snils TEXT, ogrnip TEXT, registrationDate TEXT, gender INTEGER, birthDate TEXT, birthPlace TEXT, 
      registrationAddress TEXT, registrationAddressString TEXT,
      account TEXT, corrAccount TEXT, bank TEXT, bik TEXT
    )''',
    DictionaryNames.violatorInfoLegals:
        '''CREATE TABLE IF NOT EXISTS violatorInfoLegals(id INTEGER PRIMARY KEY, phone TEXT, name TEXT, 
      inn TEXT, ogrn TEXT, kpp TEXT, regDate TEXT, 
      legalAddress TEXT, postalAddress TEXT, legalAddressString TEXT, postalAddressString TEXT,
      account TEXT, corrAccount TEXT, bank TEXT, bik TEXT
    )''',
    DictionaryNames.violatorInfoOfficials:
        '''CREATE TABLE IF NOT EXISTS violatorInfoOfficials(id INTEGER PRIMARY KEY, phone TEXT, lastName TEXT, firstName TEXT, patronym TEXT, orgId INTEGER, orgName TEXT,
      orgInn TEXT, orgOgrn TEXT, orgKpp TEXT, orgRegDate TEXT, orgPhone TEXT, 
      orgLegalAddress TEXT, orgPostalAddress TEXT, orgLegalAddressString TEXT, orgPostalAddressString TEXT
    )''',
    DictionaryNames.violatorInfoPrivates:
        '''CREATE TABLE IF NOT EXISTS violatorInfoPrivates(id INTEGER PRIMARY KEY, phone TEXT,
      lastName TEXT, firstName TEXT, patronym TEXT, 
      inn TEXT, snils TEXT, docType TEXT, docSeries TEXT, docNumber TEXT, gender INTEGER, birthDate TEXT, birthPlace TEXT, 
      registrationAddress TEXT, registrationAddressString TEXT
    )''',
    DictionaryNames.violatorDocumentTypes:
        '''CREATE TABLE IF NOT EXISTS violatorDocumentTypes(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.reportStatuses:
        '''CREATE TABLE IF NOT EXISTS reportStatuses(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.kladdrAddressTypes:
        '''CREATE TABLE IF NOT EXISTS kladdrAddressTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT, level TEXT)''',
    DictionaryNames.dcObjectElements:
        '''CREATE TABLE IF NOT EXISTS dcObjectElements(id INTEGER PRIMARY KEY, name TEXT, typeId INTEGER, typeName TEXT, typeCode TEXT)''',
    DictionaryNames.dcObjectKinds:
        '''CREATE TABLE IF NOT EXISTS dcObjectKinds(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.dcObjectTypes:
        '''CREATE TABLE IF NOT EXISTS dcObjectTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.dcViolationNames:
        '''CREATE TABLE IF NOT EXISTS dcViolationNames(id INTEGER PRIMARY KEY, name TEXT, externalId INTEGER, violationFullName TEXT)''',
    DictionaryNames.dcViolationStatuses:
        '''CREATE TABLE IF NOT EXISTS dcViolationStatuses(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.dcContractors:
        '''CREATE TABLE IF NOT EXISTS dcContractors(id INTEGER PRIMARY KEY, name TEXT, inn TEXT)''',
    DictionaryNames.dcViolationAdditionalFeatures:
        '''CREATE TABLE IF NOT EXISTS dcViolationAdditionalFeatures(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.dcSources:
        '''CREATE TABLE IF NOT EXISTS dcSources(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.dcViolationClassificationSearchResults:
        '''CREATE TABLE IF NOT EXISTS dcViolationClassificationSearchResults(
      id INTEGER PRIMARY KEY,
      ekn INTEGER,
      warning TEXT,
      regulations TEXT,
      npa TEXT,
      article TEXT,
      violationNameId INTEGER,
      violationNameName TEXT,
      violationNameViolationFullName TEXT,
      violationNameExternalId INTEGER,
      violationTypeId INTEGER,
      violationTypeName TEXT,      
      violationKindId INTEGER,
      violationKindName TEXT,
      objectTypeId INTEGER,
      objectTypeName TEXT,
      objectTypeCode TEXT,
      objectElementId INTEGER,
      objectElementName TEXT,
      objectElementObjectTypeId INTEGER,
      objectElementObjectTypeName TEXT,
      objectElementObjectTypeCode TEXT
    )''',
    DictionaryNames.dcViolationExtensionReasons:
        '''CREATE TABLE IF NOT EXISTS dcViolationExtensionReasons(id INTEGER PRIMARY KEY, name TEXT)''',
  };
}

class Query {
  final String queryType;
  final Map<String, dynamic> params;

  Query(this.params, {this.queryType = 'AND'});

  String get keys =>
      params.keys.where((key) => params[key] != null).join(' $queryType ');
  List<dynamic> get values =>
      params.values.where((value) => value != null).toList();
}

class SqliteDictionaryService {
  Database _database;

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'dictionaries7.db'),
        onCreate: (db, version) async {
          for (final key in TableDefinitions.all.keys) {
            await db.execute(TableDefinitions.all[key]);
          }
          await db.execute(TableDefinitions.metadataDefinition);
          await db.insert(
              TableDefinitions.metadata, {'id': 1, 'data': json.encode({})});
        },
        onOpen: (db) async {
          //await db.execute('drop table dcViolationClassificationSearchResults');
          for (final key in TableDefinitions.all.keys) {
            await db.execute(TableDefinitions.all[key]);
          }
          // await db.execute(TableDefinitions.all[ DictionaryNames.kladdrAddressTypes]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violationTypes]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoIps]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoLegals]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoOfficials]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoPrivates]);
        },
        version: 1,
      );
    }
  }

  Future<List<T>> all<T>(String name, Function(Map<String, dynamic>) fromJson,
      {List<Query> queries = const [], int limit}) async {
    await init();
    try {
      final whereKeys = queries
          .where((e) => e.keys.isNotEmpty)
          .map((e) => '(${e.keys})')
          .join(' AND ');
      final whereValues = queries
          .where((e) => e.values.isNotEmpty)
          .map((e) => e.values)
          .expand((e) => e)
          .toList();
      final data = await _database.query(name,
          where: whereKeys.isNotEmpty ? whereKeys : null,
          whereArgs: whereValues,
          limit: limit);
      return List<T>.from(data.map((e) => fromJson(e)));
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

  Future append(String name, List<dynamic> values) async {
    await init();
    try {
      final batch = _database.batch();
      for (final value in values) {
        batch.insert(name, value.toSqliteJson(),
            conflictAlgorithm: ConflictAlgorithm.ignore);
      }
      await batch.commit();
    } catch (ex) {
      print(ex);
    }
  }

  Future clear(String name) async {
    await init();
    await _database.delete(name, where: '1');
  }

  Future saveMetadata(DictionaryMetadata value) async {
    await init();
    await _database.update(TableDefinitions.metadata,
        {'id': 1, 'data': json.encode(value.toJson())});
  }

  Future<DictionaryMetadata> getMetadata() async {
    await init();
    final data = await _database
        .query(TableDefinitions.metadata, where: 'id = ?', whereArgs: [1]);
    if (data.isNotEmpty) {
      return DictionaryMetadata.fromJson(json.decode(data.first['data']));
    } else {
      return DictionaryMetadata(loaded: {});
    }
  }
}
