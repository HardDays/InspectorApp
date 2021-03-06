import 'dart:convert' as c;

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

abstract class SortOrder {
  static const asc = 'asc';
  static const desc = 'desc';
}

class InstructionFilters {
  final String instructionNum;
  final int instructionStatus;
  final DateTime instructionDateFrom;
  final DateTime instructionDateTo;
  final DateTime checkDateFrom;
  final DateTime checkDateTo;

  InstructionFilters({
    this.instructionNum,
    this.instructionStatus,
    this.instructionDateFrom,
    this.instructionDateTo,
    this.checkDateFrom,
    this.checkDateTo
  }); 

  factory InstructionFilters.fromJson(Map<String, dynamic> json) {
    return InstructionFilters(
      instructionNum: json['instructionNum'], 
      instructionStatus: json['instructionStatus'], 
      instructionDateFrom: json['instructionDateFrom'] != null ?  DateTime.parse(json['instructionDateFrom']) : DateTime(DateTime.now().year), 
      instructionDateTo: json['instructionDateTo'] != null ?  DateTime.parse(json['instructionDateTo']) : DateTime.now(), 
      checkDateFrom: json['checkDateFrom'] != null ? DateTime.parse(json['checkDateFrom']) : DateTime(DateTime.now().year), 
      checkDateTo: json['checkDateTo'] != null ?  DateTime.tryParse(json['checkDateTo']) : DateTime.now(),  
    );
  }

  InstructionFilters copyWith({
    String instructionNum,
    int instructionStatus,
    DateTime instructionDateFrom,
    DateTime instructionDateTo,
    DateTime checkDateFrom,
    DateTime checkDateTo
  }) {
    return InstructionFilters(
      instructionNum: instructionNum ?? this.instructionNum,
      instructionStatus: instructionStatus ?? this.instructionStatus,
      instructionDateFrom: instructionDateFrom,
      instructionDateTo: instructionDateTo,
      checkDateFrom: checkDateFrom,
      checkDateTo: checkDateTo
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instructionStatus': instructionStatus,
      'instructionNum': instructionNum,
      'instructionDateFrom': instructionDateFrom?.toIso8601String(),
      'instructionDateTo': instructionDateTo?.toIso8601String(),
      'checkDateFrom': checkDateFrom?.toIso8601String(),
      'checkDateTo': checkDateTo?.toIso8601String()
    };
  }
}

class Instruction {

  final int id;
  final String instructionNum;
  final DateTime instructionDate;
  final DateTime reportDate;
  final DateTime checkDate;
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

  factory Instruction.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    return Instruction(
      id: json['id'], 
      instructionNum: json['instructionNum'], 
      instructionDate: json['instructionDate'] != null ? DateTime.parse(json['instructionDate']) : null, 
      reportDate: json['reportDate'] != null ? DateTime.parse(json['reportDate']) : null, 
      checkDate: json['checkDate'] != null ? DateTime.parse(json['checkDate']) : null, 
      checkType: CheckType.fromJson(stringified ? c.json.decode(json['checkType']) : json['checkType']),
      instructionCreator: User.fromJson(stringified ? c.json.decode(json['instructionCreator']) : json['instructionCreator']),
      instructionStatus: InstructionStatus.fromJson(stringified ? c.json.decode(json['instructionStatus']) : json['instructionStatus']),
      instructionChecks: List<InstructionCheck>.from((stringified ? c.json.decode(json['instructionChecks']) : json['instructionChecks']).map((p) => InstructionCheck.fromJson(p))),
      normativeActs: List<NormativeAct>.from((stringified ? c.json.decode(json['normativeActs']) : json['normativeActs']).map((p) => NormativeAct.fromJson(p))),
    );
  }

  Map<String, dynamic> toJson({bool stringified = false}) {
    final checks = instructionChecks.map((e) => e.toJson()).toList();
    final acts = normativeActs.map((e) => e.toJson()).toList();
    return {
      'id': id,
      'instructionNum': instructionNum,
      'instructionDate': instructionDate?.toString(),
      'reportDate': reportDate?.toString(),
      'checkDate': checkDate?.toString(),
      'checkType': (stringified ? c.json.encode(checkType.toJson()) : checkType.toJson()),
      'instructionCreator': (stringified ? c.json.encode(instructionCreator.toJson()) : instructionCreator.toJson()),
      'instructionStatus': (stringified ? c.json.encode(instructionStatus.toJson()) : instructionStatus.toJson()),
      'instructionChecks': (stringified ? c.json.encode(checks) : checks),
      'normativeActs': (stringified ? c.json.encode(acts) : acts),
    };
  }
}
