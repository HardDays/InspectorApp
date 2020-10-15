import 'package:flutter/foundation.dart';

class ViolationType {
  final int id;
  final String name;
  final String code;
  
  ViolationType({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory ViolationType.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return ViolationType(
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

  @override
  String toString() {
    return '$code $name';
  }

}