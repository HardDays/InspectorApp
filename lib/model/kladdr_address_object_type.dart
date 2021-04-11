import 'package:flutter/foundation.dart';

class KladdrAddressObjectType {
  final int id;
  final String name;
  final String code;
  final String level;
  
  KladdrAddressObjectType({
    @required this.id,
    @required this.name,
    @required this.code,
    @required this.level,
  });

  factory KladdrAddressObjectType.fromJson(Map<String, dynamic> json) {
    return KladdrAddressObjectType(
      id: json['id'], 
      name: json['name'], 
      code: json['code'],
      level: json['level']
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'level': level
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