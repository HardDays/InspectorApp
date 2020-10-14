import 'package:flutter/foundation.dart';

class OatiDepartment {
  final int id;
  final String name;
  final String code;
  
  OatiDepartment({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory OatiDepartment.fromJson(Map<String, dynamic> json) {
    return OatiDepartment(
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
}