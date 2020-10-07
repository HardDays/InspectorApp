import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'instruction_status.g.dart';

abstract class InstructionStatusStrings {
  static const assigned = 'Назначено';
  static const withdrawn = 'Отозвано';
  static const partInProgress = 'Частично на исполнении';
  static const inProgress = 'На исполнении';
  static const partComplete = 'Частично исполнено';
  static const complete = 'Исполнено';
}

@HiveType(typeId: HiveTypeId.InstructionStatusId)
class InstructionStatus {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  
  InstructionStatus({
    @required this.id,
    @required this.name,
  });

  factory InstructionStatus.fromJson(Map<String, dynamic> json) {
    return InstructionStatus(
      id: json['id'], 
      name: json['name'], 
    );
  }
}
