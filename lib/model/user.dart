import 'package:flutter/material.dart';

class User {
  final int id;
  final String code;
  final String surname;
  final String name;
  final String middleName;
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
