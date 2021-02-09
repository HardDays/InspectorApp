import 'dart:convert' as c;

import 'package:flutter/foundation.dart';

class DCObjectKind {
  final int id;
  final String name;
  
  DCObjectKind({
    @required this.id,
    @required this.name,
  });

  factory DCObjectKind.fromJson(Map<String, dynamic> json) {
    return DCObjectKind(
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