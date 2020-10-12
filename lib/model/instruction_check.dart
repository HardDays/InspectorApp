import 'package:flutter/material.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/check_participant.dart';
import 'package:inspector/model/check_status.dart';

class InstructionCheck {

  final int id;
  final String checkSubject;
  final bool diggRequest;
  final CheckStatus checkStatus;
  final List<CheckParticipant> checkParticipants;
  final List<Address> checkAddresses;

  InstructionCheck({
    @required this.id,
    @required this.checkSubject,
    @required this.diggRequest,
    @required this.checkStatus,
    @required this.checkParticipants,
    @required this.checkAddresses
  });

  factory InstructionCheck.fromJson(Map<String, dynamic> json) {
    return InstructionCheck(
      id: json['id'], 
      checkSubject: json['checkSubject'], 
      diggRequest: json['diggRequest'], 
      checkStatus: CheckStatus.fromJson(json['checkStatus']), 
      checkParticipants: List<CheckParticipant>.from(json['checkParticipants'].map((p) => CheckParticipant.fromJson(p))),
      checkAddresses: List<Address>.from(json['checkAddresses'].map((p) => Address.fromJson(p)))
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
    };
  }
}
