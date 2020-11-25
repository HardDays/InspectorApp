import 'dart:convert' as c;

import 'package:flutter/foundation.dart';

class DepartmentCode {
  final int id;
  final String name;
  final String code;
  
  DepartmentCode({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory DepartmentCode.fromJson(Map<String, dynamic> json) {
    return DepartmentCode(
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

  static DepartmentCode parse(dynamic json, bool stringified) {
    if (json != null) {
      if (stringified) {
        return DepartmentCode.fromJson(c.json.decode(json));
      } else {
        return DepartmentCode.fromJson(json);
      }
    }
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }

  @override
  String toString() {
    return '$code $name';
  }
}