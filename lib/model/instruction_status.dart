import 'package:flutter/material.dart';

abstract class InstructionStatusIds {
  
  static const assigned = 1;
  static const withdrawn = 2;
  static const partInProgress = 3;
  static const inProgress = 4;
  static const partComplete = 5;
  static const complete = 6;

  static const List<int> all = const [
    assigned, withdrawn, partInProgress, inProgress, partComplete, complete
  ];
}

class InstructionStatus {

  final int id;
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}
