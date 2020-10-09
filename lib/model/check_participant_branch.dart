import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'check_participant_branch.g.dart';

@HiveType(typeId: HiveTypeId.CheckParticipantBranchId)
class CheckParticipantBranch extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String code;
  
  CheckParticipantBranch({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory CheckParticipantBranch.fromJson(Map<String, dynamic> json) {
    return CheckParticipantBranch(
      id: json['id'], 
      name: json['name'], 
      code: json['code']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code
    };
  }
}
