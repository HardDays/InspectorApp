import 'dart:convert' as c;

import 'package:flutter/foundation.dart';

class DCViolationName {
  final int id;
  final String name;
  
  DCViolationName({
    @required this.id,
    @required this.name,
  });

  factory DCViolationName.fromJson(Map<String, dynamic> json) {
    return DCViolationName(
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