

import 'package:inspector/model/report.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteReportsService {

  final _tableName = 'reports';

  Database _database;

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'reports4.db'),
        onCreate: (db, version) async {
          await db.execute('''CREATE TABLE reports(dbId INTEGER PRIMARY KEY, id INTEGER, instructionId INTEGER, checkId INTEGER, 
            violationNotPresent INTEGER, reportNum TEXT, reportDate TEXT, error TEXT,
            reportStatus TEXT, reportAuthor TEXT, violations TEXT, diggRequestChecks TEXT, photos TEXT
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
  //todo: fix
  Future save(Report report, {String error}) async {
    try {
      await init();
      final where = 'dbId = ${report.dbId}';
      final created = await _database.query(_tableName, where: where);
      final json = report.toSqliteJson();
      json['error'] = error;
      if (created.isEmpty) {
        await _database.insert(_tableName, json);
      } else {
        await _database.update(_tableName, json, where: where);
      }
    } catch (ex) {
      print(ex);
    }
  } 

  Future  removeGlobal(Report report) async {
    try {
      await init();
      await _database.delete(_tableName, where: 'id = ${report.id}');
    } catch (ex) {
      print(ex);
    }
  }

  Future removeLocal(Report report) async {
    try {
      await init();
      await _database.delete(_tableName, where: 'dbId = ${report.dbId}');
    } catch (ex) {

    }
  }
}
