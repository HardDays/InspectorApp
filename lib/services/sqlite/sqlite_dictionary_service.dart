
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
}

class TableDefinitions {

  static const metadata = 'dictionaryMetadata';
  static const metadataDefinition = 'CREATE TABLE dictionaryMetadata(id INTEGER PRIMARY KEY, data TEXT)';

  static const Map<String, String> all = {
    DictionaryNames.addresses: '''CREATE TABLE addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
      houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom TEXT, unad TEXT,
      area TEXT, district TEXT, street TEXT, areaId INTEGER, streetId INTEGER, districtId INTEGER
    )''',
    DictionaryNames.streets: '''CREATE TABLE streets(id INTEGER PRIMARY KEY, name TEXT, code TEXT, 
      areaId INTEGER, districtId INTEGER
    )''',
    DictionaryNames.areas: '''CREATE TABLE areas(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.districts: '''CREATE TABLE districts(id INTEGER PRIMARY KEY, name TEXT, code TEXT, areaId INTEGER)''',
    DictionaryNames.instructionStatuses: '''CREATE TABLE instructionStatuses(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.specialObjects: '''CREATE TABLE specialObjects(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.normativeActs: '''CREATE TABLE normativeActs(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.normativeActArticles: '''CREATE TABLE normativeActArticles(id INTEGER PRIMARY KEY, name TEXT, 
      code TEXT, normativeActId INTEGER, normativeAct TEXT
    )''',
    DictionaryNames.violationTypes: '''CREATE TABLE violationTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.violatorTypes: '''CREATE TABLE violatorTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.departmentCodes: '''CREATE TABLE departmentCodes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.objectCategories: '''CREATE TABLE objectCategories(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.violatorInfoIps: '''CREATE TABLE violatorInfoIps(id INTEGER PRIMARY KEY, phone TEXT, name TEXT, 
      lastName TEXT, firstName TEXT, patronym TEXT, 
      inn TEXT, snils TEXT, ogrnip TEXT, registrationDate TEXT, gender INTEGER, birthDate TEXT, birthPlace TEXT, registrationAddress TEXT,
      account TEXT, corrAccount TEXT, bank TEXT, bik TEXT
    )''',
    DictionaryNames.violatorInfoLegals: '''CREATE TABLE violatorInfoLegals(id INTEGER PRIMARY KEY, phone TEXT, name TEXT, 
      inn TEXT, ogrn TEXT, kpp TEXT, regDate TEXT, legalAddress TEXT, postalAddress TEXT,
      account TEXT, corrAccount TEXT, bank TEXT, bik TEXT
    )''',
    DictionaryNames.violatorInfoOfficials: '''CREATE TABLE violatorInfoOfficials(id INTEGER PRIMARY KEY, phone TEXT, orgId INTEGER, orgName TEXT,
      orgInn TEXT, orgOgrn TEXT, orgKpp TEXT, orgRegDate TEXT, orgPhone TEXT, orgLegalAddress TEXT, orgPostalAddress TEXT
    )''',
    DictionaryNames.violatorInfoPrivates: '''CREATE TABLE violatorInfoPrivates(id INTEGER PRIMARY KEY, phone TEXT,
      lastName TEXT, firstName TEXT, patronym TEXT, 
      inn TEXT, snils TEXT, docType TEXT, docSeries TEXT, docNumber TEXT, gender INTEGER, birthDate TEXT, birthPlace TEXT, registrationAddress TEXT
    )''',
    DictionaryNames.violatorDocumentTypes: '''CREATE TABLE violatorDocumentTypes(id INTEGER PRIMARY KEY, name TEXT)''',
  };
}

class Query {
  final String queryType;
  final Map<String, dynamic> params;

  Query(this.params, {this.queryType = 'AND'});

  String get keys => params.keys.where((key) => params[key] != null).join(' $queryType ');
  List<dynamic> get values => params.values.where((value) => value != null).toList();
}

class SqliteDictionaryService {

  Database _database;

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'dictionaries5.db'),
        onCreate: (db, version) async {
          for (final key in TableDefinitions.all.keys) {
            await db.execute(TableDefinitions.all[key]);
          }
          await db.execute(TableDefinitions.metadataDefinition);
          await db.insert(TableDefinitions.metadata, {'id': 1, 'data': json.encode({})});
        },
        onOpen: (db) async {
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorDocumentTypes]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoIps]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoLegals]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoOfficials]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoPrivates]);
        },
        version: 1,
      );
    }
  }

  Future<List<T>> all<T>(String name, Function(Map<String, dynamic>) fromJson, {List<Query> queries = const [], int limit}) async {
    await init();
    try {
      final whereKeys = queries.where((e) => e.keys.isNotEmpty).map((e) => '(${e.keys})').join(' AND ');
      final whereValues = queries.where((e) => e.values.isNotEmpty).map((e) => e.values).expand((e) => e).toList();
      final data = await _database.query(name, where: whereKeys.isNotEmpty ? whereKeys : null, whereArgs: whereValues, limit: limit);
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
        batch.insert(name, value.toSqliteJson(), conflictAlgorithm: ConflictAlgorithm.ignore);
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
    await _database.update(TableDefinitions.metadata, {'id': 1, 'data': json.encode(value.toJson())});
  }

  Future<DictionaryMetadata> getMetadata() async {
    await init();
    final data = await _database.query(TableDefinitions.metadata, where: 'id = ?', whereArgs: [1]);
    if (data.isNotEmpty) {
      return DictionaryMetadata.fromJson(json.decode(data.first['data']));
    } else {
      return DictionaryMetadata(loaded: {});
    }
  }
}
