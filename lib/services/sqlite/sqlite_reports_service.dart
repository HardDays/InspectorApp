

import 'package:inspector/model/report.dart';
import 'package:inspector/model/violation.dart';
import 'package:inspector/services/images/images_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteReportsService {

  final _tableName = 'reports';

  Database _database;

  Future init() async {
    if (_database == null) {
      _database = await openDatabase(
        join(await getDatabasesPath(), 'reports6.db'),
        onCreate: (db, version) async {
          await db.execute('''CREATE TABLE reports(dbId INTEGER PRIMARY KEY, localId TEXT,
            id INTEGER, instructionId INTEGER, checkId INTEGER, 
            violationNotPresent INTEGER, reportNum TEXT, reportDate TEXT, error TEXT,
            reportStatus TEXT, reportAuthor TEXT, violations TEXT, diggRequestChecks TEXT, photos TEXT
          )''');
        },
        onOpen: (db) async {
        },
        version: 1,
      );
    }
  }
  
   Future<List<Report>> withImages(List<Report> reports) async {
     final res = List<Report>();
      
      for (final report in reports) {
        final violations = List<Violation>();
        for (int i = 0; i < report.violations.length; i++) {
          final violation = report.violations[i];
          violations.add(
            violation.copyWith(
              photos:  await ImagesService.readReportViolations(report, i),
            )
          );
        }
        res.add(
          report.copyWith(
            photos: await ImagesService.readReport(report),
            violations: violations
          )
        );
      }
      return res;
   }

  //todo: move images outside
  Future<List<Report>> all({Map<String, dynamic> query = const {}}) async {
    try {
      await init();
      final where = query.keys.map((key) => '$key = ${query[key]}').join(' AND ');
      final data = await _database.query(_tableName, where: query.isNotEmpty ? where : null);
      
      final reports = List<Report>.from(data.map((e) => Report.fromJson(e, stringified: true)));
      return await withImages(reports);
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  Future<List<Report>> errors() async {
    try {
      await init();
      final data = await _database.query(_tableName, where: 'error is NOT NULL');
      final reports = List<Report>.from(data.map((e) => Report.fromJson(e, stringified: true)));
      return await withImages(reports);
    } catch (ex) {
      print(ex);
      return [];
    }
  }
  //todo: move images outside
  Future save(Report report, {String error}) async {
    try {
      await init();
      final where = 'localId = "${report.localId}"';
      final created = await _database.query(_tableName, where: where);
      final json = report.toSqliteJson();
      json['error'] = error;
      await ImagesService.saveReport(report);
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
      await _database.delete(_tableName, where: 'id = "${report.id}"');
    } catch (ex) {
      print(ex);
    }
  }

  Future removeLocal(Report report) async {
    try {
      await init();
      await _database.delete(_tableName, where: 'localId = "${report.localId}"');
    } catch (ex) {
      print(ex);
    }
  }
}
