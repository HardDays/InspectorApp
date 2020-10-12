import 'package:flutter/material.dart';

class CheckType {

  final int id;
  final String name;
  final String code;
  
  CheckType({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory CheckType.fromJson(Map<String, dynamic> json) {
    return CheckType(
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
