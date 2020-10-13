import 'package:flutter/foundation.dart';

class ObjectCategory {
  final int id;
  final String name;
  final String code;
  
  ObjectCategory({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory ObjectCategory.fromJson(Map<String, dynamic> json) {
    return ObjectCategory(
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