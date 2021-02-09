import 'dart:convert' as c;

import 'package:flutter/foundation.dart';

class DCObjectElement {
  final int id;
  final String name;
  
  DCObjectElement({
    @required this.id,
    @required this.name,
  });

  factory DCObjectElement.fromJson(Map<String, dynamic> json) {
    return DCObjectElement(
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