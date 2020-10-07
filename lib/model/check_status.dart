import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'check_status.g.dart';

@HiveType(typeId: HiveTypeId.CheckStatusId)
class CheckStatus {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  
  CheckStatus({
    @required this.id,
    @required this.name,
  });

  factory CheckStatus.fromJson(Map<String, dynamic> json) {
    return CheckStatus(
      id: json['id'], 
      name: json['name'], 
    );
  }
}
