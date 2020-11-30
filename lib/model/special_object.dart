import 'package:flutter/foundation.dart';

class SpecialObject {
  final int id;
  final String name;
  final String code;
  
  SpecialObject({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  static SpecialObject fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return SpecialObject(
        id: json['id'], 
        name: json['name'], 
        code: json['code']
      );
    }
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
    return name;
  }
}
