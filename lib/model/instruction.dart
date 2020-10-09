import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/instruction_check.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'instruction.g.dart';

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
}


@HiveType(typeId: HiveTypeId.InstructionId)
class Instruction extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String instructionNum;
  @HiveField(2)
  final String instructionDate;
  @HiveField(3)
  final String reportDate;
  @HiveField(4)
  final String checkDate;
  @HiveField(5)
  final CheckType checkType;
  @HiveField(6)
  final User instructionCreator;
  @HiveField(7)
  final InstructionStatus instructionStatus;
  @HiveField(8)
  final List<InstructionCheck> instructionChecks;
  @HiveField(9)
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

  factory Instruction.fromJson(Map<String, dynamic> json) {
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
