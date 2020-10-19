import 'package:flutter/material.dart';

abstract class CheckStatusIds {
  
  static const assigned = 1;
  static const withdrawn = 2;
  static const inProgress = 3;
  static const reportSent = 4;
}

class CheckStatus {
  
  final int id;
  final String name;
  
  CheckStatus({
    @required this.id,
    @required this.name,
  });

  factory CheckStatus.fromJson(Map<String, dynamic> json) {
    return CheckStatus(
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
