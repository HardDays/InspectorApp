import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/model/violation.dart';

abstract class ReportStatusIds {
  static const project = 0;
  static const new_ = 1;
  static const onApproval = 2;
  static const accepted = 3;
  static const declined = 4;
  static const changed = 5;
}

class ReportError {
  final Report report;
  final String error;

  ReportError({this.report, this.error});

   factory ReportError.fromJson(Map<String, dynamic> json) {
     return ReportError(
       report: Report.fromJson(json['report']),
       error: json['error']
     );
   }

  Map<String, dynamic> toJson() {
    return {
      'report': report.toJson(),
      'instructionId': report.instructionId,
      'checkId': report.checkId,
      'error': error
    };
  }
}

class Report {
  final int id;
  final int instructionId;
  final int checkId;
  final bool violationNotPresent;
  final String reportNum;
  final DateTime reportDate;
  
  final ReportStatus reportStatus;
  final User reportAuthor;
  final Violation violation;
  
  final List<DiggRequestCheck> diggRequestChecks;
  final List<Photo> photos;

  Report({
    this.id,
    this.instructionId,
    this.checkId,
    this.violationNotPresent,
    this.reportNum,
    this.reportDate,
    this.reportStatus,
    this.reportAuthor,
    this.violation,
    this.diggRequestChecks,
    this.photos,
  });

  factory Report.empty(bool violationNotPresent, int checkId, int instructionId) {
    return Report(
      instructionId: instructionId,
      checkId: checkId,
      violationNotPresent: violationNotPresent,
      violation: Violation.empty(),
      photos: [],
      diggRequestChecks: []
    );
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'], 
      instructionId: json['instructionId'], 
      checkId: json['checkId'],
      reportNum: json['reportNum'],
      violationNotPresent: json['violationNotPresent'] ?? false,
      reportDate: json['reportDate'] != null ? DateTime.parse(json['reportDate']) : null, 
      reportStatus: json['reportStatus'] != null ? ReportStatus.fromJson(json['reportStatus']) : null,
      reportAuthor: json['reportAuthor'] != null ? User.fromJson(json['reportAuthor']) : null,
      violation: json['violation'] != null ? Violation.fromJson(json['violation']) : null,
      diggRequestChecks: json['diggRequestChecks'] != null ? List<DiggRequestCheck>.from(json['diggRequestChecks'].map((p) => DiggRequestCheck.fromJson(p))) : [],
      photos: json['photos'] != null ? List<Photo>.from(json['photos'].map((p) => Photo.fromJson(p))) : [],
    );
  }

  bool get isNew => (reportStatus == null || reportStatus?.id == ReportStatusIds.new_ || reportStatus?.id == ReportStatusIds.project);
  bool get isUpdatable => isNew || reportStatus?.id == ReportStatusIds.declined;
  bool get isDeletable => reportStatus != null && isNew;

  Report copyWith({
    bool violationNotPresent,
    String reportNum,
    DateTime reportDate,
    ReportStatus reportStatus,
    Violation violation,
    User reportAuthor,
    List<Photo> photos,
  }) {
    return Report(
      id: id,
      instructionId: instructionId,
      checkId: checkId,
      violationNotPresent: violationNotPresent ?? this.violationNotPresent,
      reportNum: reportNum ?? this.reportNum,
      reportDate: reportDate ?? this.reportDate,
      reportStatus: reportStatus ?? this.reportStatus,
      reportAuthor: reportAuthor ?? this.reportAuthor,
      violation: violation ?? this.violation?.copyWith(),
      diggRequestChecks: List.from(diggRequestChecks),
      photos: List.from(photos ?? this.photos),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instructionId': instructionId,
      'checkId': checkId,
      'violationNotPresent': violationNotPresent,
      'reportNum': reportNum,
      'reportDate': reportDate?.toIso8601String(),
      'reportStatus': reportStatus?.toJson(),
      'reportAuthor': reportAuthor?.toJson(),
      'violation': violation?.toJson(),
      'diggRequestChecks': diggRequestChecks != null ? diggRequestChecks.map((e) => e.toJson()).toList() : [],
      'photos': photos != null ? photos.map((e) => e.toJson()).toList() : [],
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}