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

  @override
  String toString() {
    return '$code $name';
  }

}