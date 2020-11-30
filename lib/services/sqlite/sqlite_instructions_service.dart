

import 'package:inspector/model/instruction.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteInstructionsService {

  final _tableName = 'instructions';

  Database _database;

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'instructions.db'),
        onCreate: (db, version) async {
          await db.execute('''CREATE TABLE instructions(
            id INTEGER PRIMARY KEY, instructionNum TEXT, instructionDate TEXT, reportDate TEXT, checkDate TEXT,
            checkType TEXT, instructionCreator TEXT, instructionStatus TEXT, 
            instructionChecks TEXT, normativeActs TEXT
          )''');
        },
        onOpen: (db) async {

        },
        version: 1,
      );
    }
  }
  
  Future<List<Instruction>> all({Map<String, dynamic> query = const {}}) async {
    try {
      await init();
      final where = query.keys.map((key) => '$key = ${query[key]}').join(' AND ');
      final data = await _database.query(_tableName, where: query.isNotEmpty ? where : null);
      return List<Instruction>.from(data.map((e) => Instruction.fromJson(e, stringified: true)));
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future saveAll(List<Instruction> values) async {
    try {
      await init();
      await _database.delete(_tableName, where: '1');
      final batch = _database.batch();
      for (final value in values) {
        batch.insert(_tableName, value.toJson(stringified: true), conflictAlgorithm: ConflictAlgorithm.ignore);
      }
      await batch.commit();
    } catch (ex) {
      print(ex);
    }
  }

  Future update(Instruction value) async {
    try {
      await init();
      await _database.update(_tableName, value.toJson(stringified: true), where: 'id = ${value.id}');
    } catch (ex) {

    }
  }

  // Future remove(Instruction report) async {
  //   // try {
  //   //   await init();
  //   //   await _database.delete(_tableName, where: 'checkId = ${report.checkId} AND instructionId = ${report.instructionId}');
  //   // } catch (ex) {

  //   // }
  // }
}
