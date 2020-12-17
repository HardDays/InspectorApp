import 'package:flutter/foundation.dart';

class ViolationType {
  final int id;
  final String name;
  final String code;
  final String koap;
  
  ViolationType({
    @required this.id,
    @required this.name,
    @required this.code,
    @required this.koap,
  });

  factory ViolationType.fromJson(Map<String, dynamic> json) {
    return ViolationType(
      id: json['id'], 
      name: json['name'], 
      code: json['code'],
      koap: json['koap'],
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'koap': koap,
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