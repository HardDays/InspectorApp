

import 'package:inspector/model/report.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteReportsService {

  final _tableName = 'reports';

  Database _database;

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'reports2.db'),
        onCreate: (db, version) async {
          await db.execute('''CREATE TABLE reports(id INTEGER, instructionId INTEGER, checkId INTEGER, 
            violationNotPresent INTEGER, reportNum TEXT, reportDate TEXT, error TEXT,
            reportStatus TEXT, reportAuthor TEXT, violation TEXT, diggRequestChecks TEXT, photos TEXT,
            PRIMARY KEY (instructionId, checkId)
          )''');
        },
        onOpen: (db) async {
          //await db.execute(TableDefinitions.all[ DictionaryNames.reportStatuses]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoIps]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoLegals]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoOfficials]);
          // await db.execute(TableDefinitions.all[ DictionaryNames.violatorInfoPrivates]);
        },
        version: 1,
      );
    }
  }
  
  Future<List<Report>> all({Map<String, dynamic> query = const {}}) async {
    try {
      await init();
      final where = query.keys.map((key) => '$key = ${query[key]}').join(' AND ');
      final data = await _database.query(_tableName, where: query.isNotEmpty ? where : null);
      return List<Report>.from(data.map((e) => Report.fromJson(e, stringified: true)));
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<List<ReportError>> errors() async {
    try {
      await init();
      final data = await _database.query(_tableName, where: 'error is NOT NULL');
      return List<ReportError>.from(data.map((e) => ReportError.fromJson(e, stringified: true)));
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future save(Report report, {String error}) async {
    try {
      await init();
      final where = 'checkId = ${report.checkId} AND instructionId = ${report.instructionId}';
      final created = await _database.query(_tableName, where: where);
      final json = report.toSqliteJson();
      json['error'] = error;
      if (created.isEmpty) {
        await _database.insert(_tableName, json);
      } else {
        await _database.update(_tableName, json, where: where);
      }
    } catch (ex) {

    }
  }

  Future remove(Report report) async {
    try {
      await init();
      await _database.delete(_tableName, where: 'checkId = ${report.checkId} AND instructionId = ${report.instructionId}');
    } catch (ex) {

    }
  }

  // Future<List<T>> all<T>(String name, Function(Map<String, dynamic>) fromJson, {List<Query> queries = const [], int limit}) async {
  //   await init();
  //   try {
  //     final whereKeys = queries.where((e) => e.keys.isNotEmpty).map((e) => '(${e.keys})').join(' AND ');
  //     final whereValues = queries.where((e) => e.values.isNotEmpty).map((e) => e.values).expand((e) => e).toList();
  //     final data = await _database.query(name, where: whereKeys.isNotEmpty ? whereKeys : null, whereArgs: whereValues, limit: limit);
  //     return List<T>.from(data.map((e) => fromJson(e)));
  //   } catch (ex) {
  //     print(ex);
  //     throw ParseException();
  //   }
  // }


}
