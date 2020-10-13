import 'package:flutter/material.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/instruction_check.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/user.dart';

abstract class InstructionSortStrings {
  static const instructionDate = 'По дате поручения';
  static const checkDate = 'По дате обследования';
  static const instructionStatus = 'По статусу поручения';
  static const instructionNum = 'По номеру поручения';

  static const List<String> all = const [
    instructionDate, checkDate, instructionStatus, instructionNum
  ];
}

class InstructionFilters {
  final String instructionNum;
  final String instructionStatus;
  final List<DateTime> instructionDates;
  final List<DateTime> checkDates;

  InstructionFilters({
    this.instructionNum,
    this.instructionStatus,
    this.instructionDates,
    this.checkDates
  });

  factory InstructionFilters.fromJson(Map<String, dynamic> json) {
    return InstructionFilters(
      instructionNum: json['instructionNum'], 
      instructionStatus: json['instructionStatus'], 
      instructionDates: json['instructionDates'] != null ? List<DateTime>.from(json['instructionDates'].map((e)=> DateTime.parse(e))) : null, 
      checkDates: json['checkDates'] != null ? List<DateTime>.from(json['checkDates'].map((e)=> DateTime.parse(e))) : null, 
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'instructionStatus': instructionStatus,
      'instructionNum': instructionNum,
      'instructionDates': instructionDates?.map((e) => e.toString())?.toList(),
      'checkDates': checkDates?.map((e) => e.toString())?.toList(),
    };
  }
}

class Instruction {

  final int id;
  final String instructionNum;
  final String instructionDate;
  final String reportDate;
  final String checkDate;
  final CheckType checkType;
  final User instructionCreator;
  final InstructionStatus instructionStatus;
  final List<InstructionCheck> instructionChecks;
  final List<NormativeAct> normativeActs;

  Instruction({
    @required this.id,
    @required this.instructionNum,
    @required this.instructionDate,
    @required this.reportDate,
    @required this.checkDate,
    @required this.checkType,
    @required this.instructionStatus,
    @required this.instructionChecks,
    @required this.normativeActs,
    @required this.instructionCreator
  });

  static Instruction fromJson(Map<String, dynamic> json) {
    return Instruction(
      id: json['id'], 
      instructionNum: json['instructionNum'], 
      instructionDate: json['instructionDate'], 
      reportDate: json['reportDate'], 
      checkDate: json['checkDate'],
      checkType: CheckType.fromJson(json['checkType']),
      instructionCreator: User.fromJson(json['instructionCreator']),
      instructionStatus: InstructionStatus.fromJson(json['instructionStatus']),
      instructionChecks: List<InstructionCheck>.from(json['instructionChecks'].map((p) => InstructionCheck.fromJson(p))),
      normativeActs: List<NormativeAct>.from(json['normativeActs'].map((p) => NormativeAct.fromJson(p))),
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'instructionNum': instructionNum,
      'instructionDate': instructionDate,
      'reportDate': reportDate,
      'checkDate': checkDate,
      'checkType': checkType.toJson(),
      'instructionCreator': instructionCreator.toJson(),
      'instructionStatus': instructionStatus.toJson(),
      'instructionChecks': instructionChecks.map((e) => e.toJson()).toList(),
      'normativeActs': normativeActs.map((e) => e.toJson()).toList()
    };
  }
}
