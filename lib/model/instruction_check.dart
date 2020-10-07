import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/model/check_participant.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'instruction_check.g.dart';

@HiveType(typeId: HiveTypeId.InstructionCheckId)
class InstructionCheck {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String checkSubject;
  @HiveField(2)
  final bool diggRequest;
  @HiveField(3)
  final CheckStatus checkStatus;
  @HiveField(4)
  final List<CheckParticipant> checkParticipants;

  InstructionCheck({
    @required this.id,
    @required this.checkSubject,
    @required this.diggRequest,
    @required this.checkStatus,
    @required this.checkParticipants
  });

  factory InstructionCheck.fromJson(Map<String, dynamic> json) {
    return InstructionCheck(
      id: json['id'], 
      checkSubject: json['checkSubject'], 
      diggRequest: json['diggRequest'], 
      checkStatus: CheckStatus.fromJson(json['checkStatus']), 
      checkParticipants: List<CheckParticipant>.from(json['checkParticipants'].map((p) => CheckParticipant.fromJson(p)))
    );
  }
}
