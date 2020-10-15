import 'package:flutter/material.dart';

class NormativeAct {
  
  final int id;
  final String name;
  final String code;
  
  NormativeAct({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory NormativeAct.fromJson(Map<String, dynamic> json) {
    return NormativeAct(
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
    return '$name';
  }
}
