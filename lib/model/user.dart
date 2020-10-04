import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inspector/services/hive/hive_type_ids.dart';

part 'user.g.dart';

@HiveType(typeId: HiveTypeId.UserId)
class User {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String code;
  @HiveField(2)
  final String surname;
  @HiveField(3)
  final String name;
  @HiveField(4)
  final String middleName;
  @HiveField(5)
  final String position;

  User({
    @required this.id,
    @required this.code,
    @required this.surname,
    @required this.name,
    @required this.middleName,
    @required this.position,
  });
}
