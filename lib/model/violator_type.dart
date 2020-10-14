import 'package:flutter/foundation.dart';

class ViolatorType {
  final int id;
  final String name;
  final String code;
  
  ViolatorType({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory ViolatorType.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return ViolatorType(
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
}