import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

@HiveType(typeId: HiveTypeId.InstructionId)
class Instruction {
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

  Instruction({
    @required this.id,
    @required this.instructionNum,
    @required this.instructionDate,
    @required this.reportDate,
    @required this.checkDate,
    @required this.checkType,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(
      id: json['id'], 
      instructionNum: json['instructionNum'], 
      instructionDate: json['instructionDate'], 
      reportDate: json['reportDate'], 
      checkDate: json['checkDate'],
      checkType: CheckType.fromJson(json['checkType'])
    );
  }
}
