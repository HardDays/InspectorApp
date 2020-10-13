import 'package:flutter/material.dart';

abstract class InstructionStatusStrings {
  
  static const assigned = 'Назначено';
  static const withdrawn = 'Отозвано';
  static const partInProgress = 'Частично на исполнении';
  static const inProgress = 'На исполнении';
  static const partComplete = 'Частично исполнено';
  static const complete = 'Исполнено';

  static const List<String> all = const [
    assigned, withdrawn, partInProgress, inProgress, partComplete, complete
  ];
}

class InstructionStatus {

  final int id;
  final String name;
  
  InstructionStatus({
    this.id,
    @required this.name,
  });

  static InstructionStatus fromJson(Map<String, dynamic> json) {
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
}
