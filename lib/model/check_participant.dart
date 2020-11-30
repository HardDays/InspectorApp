import 'package:flutter/material.dart';
import 'package:inspector/model/check_participant_branch.dart';

class CheckParticipant {

  final int id;
  final String code;
  final String surname;
  final String name;
  final String middleName;
  final String position;
  final bool responsible;
  final CheckParticipantBranch checkParticipantBranch;

  CheckParticipant({
    @required this.id,
    @required this.code,
    @required this.surname,
    @required this.name,
    @required this.middleName,
    @required this.position,
    @required this.responsible,
    @required this.checkParticipantBranch,
  });

  factory CheckParticipant.fromJson(Map<String, dynamic> json) {
    return CheckParticipant(
      id: json['id'], 
      code: json['code'], 
      surname: json['surname'], 
      name: json['name'],
      middleName: json['middleName'],
      position: json['position'],
      responsible: json['responsible'],
      checkParticipantBranch: CheckParticipantBranch.fromJson(json['checkParticipantBranch']), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'surname': surname,
      'middleName': middleName,
      'position': position,
      'responsible': responsible,
      'checkParticipantBranch': checkParticipantBranch.toJson()
    };
  }

  @override
  String toString() {
    return '$surname ${name.substring(0, 1)}.${middleName.substring(0, 1)}';
  }

}
