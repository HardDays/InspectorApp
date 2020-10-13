import 'package:flutter/material.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_participant.dart';
import 'package:inspector/model/check_status.dart';
import 'package:inspector/model/digg_request_check.dart';

class InstructionCheck {

  final int id;
  final String checkSubject;
  final bool diggRequest;
  final CheckStatus checkStatus;
  final List<CheckParticipant> checkParticipants;
  final List<Address> checkAddresses;
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
