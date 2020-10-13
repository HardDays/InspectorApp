import 'package:flutter/material.dart';

class District {

  final int id;
  final int areaId;
  final String name;
  final String code;
  
  District({
    @required this.id,
    @required this.areaId,
    @required this.name,
    @required this.code,
  });

  static District fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return name != null ? 'район $name': null;
  }
}
