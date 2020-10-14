import 'package:flutter/foundation.dart';

class ViolatorInfo {
  final int id;
  final String phone;
  
  ViolatorInfo({
    @required this.id,
    @required this.phone,
  });

  factory ViolatorInfo.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return ViolatorInfo(
        id: json['id'], 
        phone: json['phone'], 
      );
    }
  }
  
   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
    };
  }
}