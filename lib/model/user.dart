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
  
  String get formattedName => '$surname ${name.substring(0, 1)}.${middleName.substring(0, 1)}.';

  factory User.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return User(
        id: json['id'], 
        code: json['code'], 
        surname: json['surname'], 
        name: json['name'],
        middleName: json['middleName'],
        position: json['position'], 
      );
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'surname': surname,
      'middleName': middleName,
      'position': position,
    };
  }
}
