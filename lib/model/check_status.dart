import 'package:flutter/material.dart';

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
