import 'package:flutter/foundation.dart';
import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/model/violation.dart';

class Report {
  final int id;
  final int instructionId;
  final int checkId;
  final bool violationNotPresent;
  final String reportNum;
  final String reportDate;
  
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

  factory Report.empty(bool violationNotPresent) {
    return Report(
      violationNotPresent: violationNotPresent,
      violation: Violation.empty(),
    );
  }

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'], 
      instructionId: json['instructionId'], 
      checkId: json['checkId'],
      violationNotPresent: json['violationNotPresent'],
      reportNum: json['reportNum'],
      reportDate: json['reportDate'],
      reportStatus: ReportStatus.fromJson(json['reportStatus']),
      reportAuthor: User.fromJson(json['reportAuthor']),
      violation: Violation.fromJson(json['violation']),
      diggRequestChecks: json['diggRequestChecks'] != null ? List<DiggRequestCheck>.from(json['diggRequestChecks'].map((p) => DiggRequestCheck.fromJson(p))) : [],
    );
  }

  Report copyWith({
    bool violationNotPresent
  }) {
    return Report(
      id: id,
      instructionId: instructionId,
      checkId: checkId,
      violationNotPresent: violationNotPresent ?? this.violationNotPresent,
      reportNum: reportNum,
      reportDate: reportDate,
      reportStatus: reportStatus,
      reportAuthor: reportAuthor,
      violation: violation,
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
      'reportDate': reportDate,
      'reportStatus': reportStatus?.toJson(),
      'reportAuthor': reportAuthor?.toJson(),
      'violation': violation?.toJson(),
      'diggRequestChecks': diggRequestChecks.map((e) => e.toJson()).toList(),
    };
  }
}