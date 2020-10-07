import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'normative_act.g.dart';

@HiveType(typeId: HiveTypeId.NormativeActId)
class NormativeAct extends HiveObject {
  
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String code;
  
  NormativeAct({
    @required this.id,
    @required this.name,
    @required this.code,
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

}
