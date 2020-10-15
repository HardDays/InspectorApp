import 'package:flutter/material.dart';

class CheckParticipantBranch {

  final int id;
  final String name;
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

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }

}
