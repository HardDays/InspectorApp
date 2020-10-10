import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_participant.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/check_type.dart';
import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'instruction_check.g.dart';

@HiveType(typeId: HiveTypeId.InstructionCheckId)
class InstructionCheck extends HiveObject {
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
  @HiveField(5)
  final List<Address> checkAddresses;
  @HiveField(6)
  final List<DiggRequestCheck> diggRequestChecks;

  InstructionCheck({
    @required this.id,
    @required this.checkSubject,
    @required this.diggRequest,
    @required this.checkStatus,
    @required this.checkParticipants,
    @required this.checkAddresses,
    @required this.diggRequestChecks,
  });

  factory InstructionCheck.fromJson(Map<String, dynamic> json) {
    return InstructionCheck(
      id: json['id'], 
      checkSubject: json['checkSubject'], 
      diggRequest: json['diggRequest'], 
      checkStatus: CheckStatus.fromJson(json['checkStatus']), 
      checkParticipants: json['checkParticipants'] != null ? List<CheckParticipant>.from(json['checkParticipants'].map((p) => CheckParticipant.fromJson(p))) : [],
      checkAddresses: json['checkAddresses'] != null ? List<Address>.from(json['checkAddresses'].map((p) => Address.fromJson(p))) : [],
      diggRequestChecks: json['diggRequestChecks'] != null ? List<DiggRequestCheck>.from(json['diggRequestChecks'].map((p) => DiggRequestCheck.fromJson(p))) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'checkSubject': checkSubject,
      'diggRequest': diggRequest,
      'checkStatus': checkStatus.toJson(),
      'checkParticipants': checkParticipants.map((e) => e.toJson()).toList(),
      'checkAddresses': checkAddresses.map((e) => e.toJson()).toList(),
      'diggRequestChecks': diggRequestChecks.map((e) => e.toJson()).toList(),
    };
  }
}
