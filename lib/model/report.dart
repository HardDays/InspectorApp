import 'package:inspector/model/digg_request_check.dart';
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

  // static const List<int> all = const [
  //   assigned, withdrawn, partInProgress, inProgress, partComplete, complete
  // ];
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
    this.diggRequestChecks
  });

  factory Report.empty(bool violationNotPresent, int checkId, int instructionId) {
    return Report(
      instructionId: instructionId,
      checkId: checkId,
      violationNotPresent: violationNotPresent,
      violation: Violation.empty(),
      diggRequestChecks: []
    );
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'], 
      instructionId: json['instructionId'], 
      checkId: json['checkId'],
      violationNotPresent: json['violationNotPresent'],
      reportNum: json['reportNum'],
      reportDate: json['reportDate'] != null ? DateTime.parse(json['reportDate']) : null, 
      reportStatus: json['reportStatus'] != null ? ReportStatus.fromJson(json['reportStatus']) : null,
      reportAuthor: json['reportAuthor'] != null ? User.fromJson(json['reportAuthor']) : null,
      violation: json['violation'] != null ? Violation.fromJson(json['violation']) : null,
      diggRequestChecks: json['diggRequestChecks'] != null ? List<DiggRequestCheck>.from(json['diggRequestChecks'].map((p) => DiggRequestCheck.fromJson(p))) : [],
    );
  }

  Report copyWith({
    bool violationNotPresent,
    ReportStatus status,
    Violation violation
  }) {
    return Report(
      id: id,
      instructionId: instructionId,
      checkId: checkId,
      violationNotPresent: violationNotPresent ?? this.violationNotPresent,
      reportNum: reportNum,
      reportDate: reportDate,
      reportStatus: reportStatus ?? this.reportStatus,
      reportAuthor: reportAuthor,
      violation: violation ?? this.violation,
      diggRequestChecks: diggRequestChecks,
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instructionId': instructionId,
      'checkId': checkId,
      'violationNotPresent': violationNotPresent,
      'reportNum': reportNum,
      'reportDate': reportDate?.toString(),
      'reportStatus': reportStatus?.toJson(),
      'reportAuthor': reportAuthor?.toJson(),
      'violation': violation?.toJson(),
      'diggRequestChecks': diggRequestChecks != null ? diggRequestChecks.map((e) => e.toJson()).toList() : [],
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}