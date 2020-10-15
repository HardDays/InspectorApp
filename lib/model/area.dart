import 'package:flutter/material.dart';

class Area {

  final int id;
  final String name;
  final String code;
  
  Area({
    @required this.id,
    this.name,
    this.code,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
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
    return name;
  }
}
