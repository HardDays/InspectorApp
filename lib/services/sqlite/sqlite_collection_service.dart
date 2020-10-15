
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/objectdb_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TableDefinitions {
  static const Map<String, String> all = {
    'addresses': '''CREATE TABLE addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
                      houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom TEXT, unad TEXT,
                      area TEXT, district TEXT, street TEXT
                  )''',
    // 'sreeets': '''CREATE TABLE addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
    //                   houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom TEXT, unad TEXT,
    //                   areaId INTEGER, districtId INTEGER, streetId INTEGER
    //               )''',
    // 'areas': '''CREATE TABLE addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
    //                   houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom TEXT, unad TEXT,
    //                   areaId INTEGER, districtId INTEGER, streetId INTEGER
    //               )''',           
    // 'districts': '''CREATE TABLE addresses(id INTEGER PRIMARY KEY, latitude FLOAT, longitude FLOAT, 
    //                   houseNum TEXT, buildNum TEXT, constructionNum TEXT, specifiedAddress TEXT, unom TEXT, unad TEXT,
    //                   areaId INTEGER, districtId INTEGER, streetId INTEGER
    //               )''',             
  };
}


class SqliteCollectionService <T> {

  Database _database;
  final String _name;
  final Function(Map<String, dynamic>) _fromJson;

  SqliteCollectionService(this._name, this._fromJson);

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'dictionaries.db'),
        onCreate: (db, version) {
          return db.execute(TableDefinitions.all[_name]);
        },
        version: 1
      );
    }
  }

  Future<List<T>> all() async {
    await init();
    try {
      final data = await _database.query(_name);
      return List<T>.from(data.map((e) => _fromJson(e)));
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

  Future append(List<dynamic> values) async {
    await init();
    try {
      final batch = _database.batch();
      for (final value in values) {
        batch.insert(_name, value.toJson(stringified: true));
      }
      await batch.commit();
    } catch (ex) {
      print(ex);
    }
  }

  Future clear() async {
    await init();
    await _database.delete(_name);
  }
}
