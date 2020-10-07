import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'check_type.g.dart';

@HiveType(typeId: HiveTypeId.CheckTypeId)
class CheckType extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String code;
  
  CheckType({
    @required this.id,
    @required this.name,
    @required this.code,
  });

  factory CheckType.fromJson(Map<String, dynamic> json) {
    return CheckType(
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
