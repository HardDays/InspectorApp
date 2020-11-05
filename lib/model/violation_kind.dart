import 'package:flutter/foundation.dart';

class ViolationKind {
    
  final int id;
  final String name;
  
  ViolationKind({
    @required this.id,
    this.name,
  });

  factory ViolationKind.fromJson(Map<String, dynamic> json) {
    return ViolationKind(
      id: json['id'], 
      name: json['name'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}