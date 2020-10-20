import 'package:flutter/foundation.dart';
import 'dart:convert' as c;

class ViolatorInfo {
  final int id;
  final String phone;
  
  ViolatorInfo({
    @required this.id,
    @required this.phone,
  });

  factory ViolatorInfo.fromJson(Map<String, dynamic> json) {
    return ViolatorInfo(
      id: json['id'], 
      phone: json['phone'], 
    );
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
    };
  }

  static ViolatorInfo parse(dynamic json, bool stringified) {
    if (json != null) {
      if (stringified) {
        return ViolatorInfo.fromJson(c.json.decode(json));
      } else {
        return ViolatorInfo.fromJson(json);
      }
    }
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}