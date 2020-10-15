
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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


}

class TableDefinitions {

  static const Map<String, String> all = {
    DictionaryNames.addresses: '''CREATE TABLE addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
                      houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom TEXT, unad TEXT,
                      area TEXT, district TEXT, street TEXT
                  )''',
    DictionaryNames.streets: '''CREATE TABLE streets(id INTEGER PRIMARY KEY, name TEXT, code TEXT, 
                      areaId INTEGER, districtId INTEGER
                  )''',
    DictionaryNames.areas: '''CREATE TABLE areas(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.districts: '''CREATE TABLE districts(id INTEGER PRIMARY KEY, name TEXT, code TEXT, areaId INTEGER)''',
    DictionaryNames.instructionStatuses: '''CREATE TABLE instructionStatuses(id INTEGER PRIMARY KEY, name TEXT)''',
    DictionaryNames.specialObjects: '''CREATE TABLE specialObjects(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.normativeActs: '''CREATE TABLE normativeActs(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.normativeActArticles: '''CREATE TABLE normativeActArticles(id INTEGER PRIMARY KEY, name TEXT, code TEXT, normativeActId INTEGER, normativeAct TEXT)''',
    DictionaryNames.violationTypes: '''CREATE TABLE violationTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.violatorTypes: '''CREATE TABLE violatorTypes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
    DictionaryNames.departmentCodes: '''CREATE TABLE departmentCodes(id INTEGER PRIMARY KEY, name TEXT, code TEXT)''',
  };
}

class SqliteCollectionService {

  Database _database;
  // final String _name;
  // final Function(Map<String, dynamic>) _fromJson;

  // SqliteCollectionService(this._name, this._fromJson);

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'dictionaries3.db'),
        onCreate: (db, version) async {
          for (final key in TableDefinitions.all.keys) {
            await db.execute(TableDefinitions.all[key]);
          }
        },
        version: 2
      );
    }
  }

  Future<List<T>> all<T>(String name, Function(Map<String, dynamic>) fromJson, {String where, List<dynamic> whereArgs, int limit}) async {
    await init();
    try {
      final data = await _database.query(name, where: where, whereArgs: whereArgs, limit: limit);
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
    final i = await _database.delete(name, where: '1');
  
    var t = 0;
  }
}
