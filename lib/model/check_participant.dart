import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/model/check_participant_branch.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'check_participant.g.dart';

@HiveType(typeId: HiveTypeId.CheckParticipantId)
class CheckParticipant extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String surname;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String middleName;
  @HiveField(5)
  final String position;
  @HiveField(6)
  final bool responsible;
  @HiveField(7)
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
