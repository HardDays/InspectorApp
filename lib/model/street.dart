import 'package:flutter/material.dart';

class Street {

  final int id;
  final int areaId;
  final int districtId;
  final String name;
  final String code;
  
  Street({
    @required this.id,
    @required this.areaId,
    @required this.districtId,
    @required this.name,
    @required this.code,
  });

  static Street fromJson(Map<String, dynamic> json) {
    return Street(
      id: json['id'], 
      areaId: json['areaId'],
      districtId: json['districtId'],
      name: json['name'], 
      code: json['code']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'areaId': areaId,
      'districtId': districtId,
      'name': name,
      'code': code
    };
  }

  @override
  String toString() {
    return name;
  }

}
