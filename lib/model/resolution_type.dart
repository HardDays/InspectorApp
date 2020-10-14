import 'package:flutter/foundation.dart';

class ResolutionType {
  final int id;
  final String name;
  final String code;
  
  ResolutionType({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory ResolutionType.fromJson(Map<String, dynamic> json) {
    return ResolutionType(
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