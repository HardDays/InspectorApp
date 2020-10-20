import 'package:flutter/material.dart';

class District {

  final int id;
  final int areaId;
  final String name;
  final String code;
  
  District({
    @required this.id,
    this.areaId,
    this.name,
    this.code,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      id: json['id'], 
      areaId: json['areaId'],
      name: json['name'], 
      code: json['code']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'areaId': areaId,
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
