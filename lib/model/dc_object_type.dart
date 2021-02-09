  import 'dart:convert' as c;

import 'package:flutter/foundation.dart';

class DCObjectType {
  final int id;
  final String name;
  final String code;
  
  DCObjectType({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory DCObjectType.fromJson(Map<String, dynamic> json) {
    return DCObjectType(
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

  @override
  String toString() {
    return '$code $name';
  }
}