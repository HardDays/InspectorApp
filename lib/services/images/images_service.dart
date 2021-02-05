import 'dart:convert';
import 'dart:io';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/report.dart';
import 'package:path_provider/path_provider.dart';

class ImagesService {

  static Future _save(String path, List<Photo> photos) async {
    try {
      final dir = (await getApplicationDocumentsDirectory()).path;
      final fullPath = '$dir/images/$path/file.json';
      final file = File(fullPath);
      await file.create(recursive: true);

      final photosJson = photos != null ? photos.map((e) => e.toJson()).toList() : [];
      await file.writeAsString(json.encode(photosJson));  
    } catch (ex) {
      print(ex);
    }
  }

  static Future<List<Photo>> _read(String path) async {
    try {
      final dir = (await getApplicationDocumentsDirectory()).path;
      final fullPath = '$dir/images/$path/file.json';
      final file = File(fullPath);

      final data = await file.readAsString();
      return List<Photo>.from(json.decode(data).map((p) => Photo.fromJson(p)));
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  static String _reportPath(report) {
    if (report.id != null) {
      return 'reports/global/${report.id}';
    } else {
      return 'reports/local/${report.reportNum}';
    }
  }

  static Future<List<Photo>> readReport(Report report) async {
    return await _read(_reportPath(report));
  }

  static Future<List<Photo>> readReportViolations(Report report, int index) async {
    final path = _reportPath(report);
    return await _read('$path/violations/$index');
  }

  static Future saveReport(Report report) async {
    final path = _reportPath(report);
    if (path != null) {
      await _save(path, report.photos);
      if (report.violations != null) {
        for (int i = 0; i < report.violations.length; i++) {
          await _save('$path/violations/$i', report.violations[i].photos);
        }
      }
    }
  }


}