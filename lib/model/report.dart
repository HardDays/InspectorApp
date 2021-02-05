import 'dart:convert' as c;

import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/model/violation.dart';
import 'package:intl/intl.dart';

abstract class ReportStatusIds {
  static const project = 0;
  static const new_ = 1;
  static const onApproval = 2;
  static const accepted = 3;
  static const declined = 4;
  static const changed = 5;
}

// class ReportError {
//   final Report report;
//   final String error;

//   ReportError({this.report, this.error});

//    factory ReportError.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
//      return ReportError(
//        report: Report.fromJson(json, stringified: stringified),
//        error: json['error']
//      );
//    }

//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'report': report.toJson(),
//   //     'instructionId': report.instructionId,
//   //     'checkId': report.checkId,
//   //     'error': error
//   //   };
//   // }
// }

class Report {

  final int id;
  // final int dbId;
  final String localId;
  final String error;
  final int instructionId;
  final int checkId;
  final bool violationNotPresent;
  final String reportNum;
  final DateTime reportDate;
  
  final ReportStatus reportStatus;
  final User reportAuthor;
  // final Violation violation;
  
  final List<Violation> violations;
  final List<DiggRequestCheck> diggRequestChecks;
  final List<Photo> photos;

  Report({
    this.id,
    this.localId,
    this.error,
    //this.dbId,
    this.instructionId,
    this.checkId,
    this.violationNotPresent,
    this.reportNum,
    this.reportDate,
    this.reportStatus,
    this.reportAuthor,
    this.violations,
    this.diggRequestChecks,
    this.photos,
  });

  bool get isNew => (reportStatus == null || reportStatus?.id == ReportStatusIds.new_ || reportStatus?.id == ReportStatusIds.project);
  bool get isReady => (id == null && reportStatus?.id == ReportStatusIds.onApproval);
  bool get isUpdatable => isNew || reportStatus?.id == ReportStatusIds.declined || error != null;
  bool get isDeletable => reportStatus != null && isNew || error != null;

  factory Report.empty(bool violationNotPresent, int checkId, int instructionId) {
    return Report(
      instructionId: instructionId,
      checkId: checkId,
      violationNotPresent: violationNotPresent,
      violations:  violationNotPresent ? List<Violation>() : [Violation.empty()],
      photos: [],
      diggRequestChecks: []
    );
  }

  Report copyWith({
    bool violationNotPresent,
    String localId,
    String reportNum,
    DateTime reportDate,
    ReportStatus reportStatus,
    //Violation violation,
    User reportAuthor,
    List<Violation> violations,
    List<Photo> photos,
  }) {
    return Report(
      id: id,
      instructionId: instructionId, 
      checkId: checkId,
      localId: localId ?? this.localId,
      violationNotPresent: violationNotPresent ?? this.violationNotPresent,
      reportNum: reportNum ?? this.reportNum,
      reportDate: reportDate ?? this.reportDate,
      reportStatus: reportStatus ?? this.reportStatus,
      reportAuthor: reportAuthor ?? this.reportAuthor,
      violations: List<Violation>.from(violations ?? this.violations ?? []),
      diggRequestChecks: List.from(diggRequestChecks),
      photos: List.from(photos ?? this.photos),
      error: error
    );
  }

  Violation violation(int index) {
    if (violations != null && index != null && index < violations.length) {
      return violations[index];
    }
    return null;
  }

  factory Report.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    final status = json['reportStatus'] != null ? ReportStatus.fromJson(stringified ? c.json.decode(json['reportStatus']) : json['reportStatus']) : null;
    final author = json['reportAuthor'] != null ? User.fromJson(stringified ? c.json.decode(json['reportAuthor']) : json['reportAuthor']) : null;
    //final violation = json['violation'] != null ? Violation.fromJson(stringified ? c.json.decode(json['violation']) : json['violation']) : null;
    final List<Violation> violations = json['violations'] != null ? List<Violation>.from((stringified ? c.json.decode(json['violations']): json['violations']).map((p) => Violation.fromJson(p))) : [];
    final List<DiggRequestCheck> checks = json['diggRequestChecks'] != null ? List<DiggRequestCheck>.from((stringified ? c.json.decode(json['diggRequestChecks']): json['diggRequestChecks']).map((p) => DiggRequestCheck.fromJson(p))) : [];
    final List<Photo> photos = json['photos'] != null ? List<Photo>.from((stringified ? c.json.decode(json['photos']) : json['photos']).map((p) => Photo.fromJson(p))) : [];
    final date = json['reportDate'] != null ? DateTime.parse(json['reportDate']) : DateTime.now();
    return Report(
      id: json['id'], 
      localId: json['localId'],
      //dbId: json['dbId'],
      instructionId: json['instructionId'], 
      checkId: json['checkId'],
      reportNum: json['reportNum'] ?? 'Проект рапорта от ${DateFormat('dd.MM.yyyy').format(date)}',
      violationNotPresent: stringified ? json['violationNotPresent'] == 1 : (json['violationNotPresent'] ?? false),
      error: json['error'],
      reportDate: date, 
      reportStatus: status,
      reportAuthor: author,
      violations: violations,
      diggRequestChecks: checks,
      photos: photos,
    );
  }
  
  Map<String, dynamic> toJson({bool stringified = false}) {
    final diggRequestsJson = diggRequestChecks != null ? diggRequestChecks.map((e) => e.toJson()).toList() : [];
    final photosJson = photos != null ? photos.map((e) => e.toJson()).toList() : [];
    final violationsJson = violations != null ? violations.map((e) => e.toJson(stringified: stringified)).toList() : [];
    final json = {
      'id': id,
      'localId': localId,
      //'dbId': dbId,
      'instructionId': instructionId,
      'checkId': checkId,
      'violationNotPresent': stringified ? ((violationNotPresent ?? false) ? 1 : 0) : violationNotPresent,
      'reportNum': reportNum,
      'reportDate': reportDate?.toIso8601String(),
      'reportStatus': reportStatus != null ? (stringified ? c.json.encode(reportStatus.toJson()) : reportStatus.toJson()) : null,
      'reportAuthor': reportAuthor != null ? (stringified ? c.json.encode(reportAuthor.toJson()) : reportAuthor.toJson()) : null,
      'violations': stringified ? c.json.encode(violationsJson) : violationsJson,
      //'violation': violation != null ? (stringified ? c.json.encode(violation.toJson()) : violation.toJson()) : null,
      'diggRequestChecks': stringified ? c.json.encode(diggRequestsJson) : diggRequestsJson,
      'photos': stringified ? '[]' : photosJson,
      // 'photos': stringified ? c.json.encode(photosJson) : photosJson,
    };
    if (stringified) {
      json['error'] = error;
    }
    return json;
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson(stringified: true);
  }
}