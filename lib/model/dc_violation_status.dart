import 'dart:convert' as c;

import 'package:flutter/foundation.dart';

class DCViolationStatus {
  
  final int id;
  final String name;
  
  DCViolationStatus({
    @required this.id,
    @required this.name,
  });

  factory DCViolationStatus.fromJson(Map<String, dynamic> json) {
    return DCViolationStatus(
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

  @override
  String toString() {
    return '$name';
  }
}