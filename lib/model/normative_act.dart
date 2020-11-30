import 'package:flutter/material.dart';

class NormativeAct {
  
  final int id;
  final String name;
  final String code;
  
  NormativeAct({
    this.id,
    this.name,
    this.code,
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

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }

  @override
  String toString() {
    return name ?? '';
  }
}
