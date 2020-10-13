import 'package:flutter/foundation.dart';

class Employee {

  final int id;
  final String code;
  final String surname;
  final String name;
  final String middleName;
  final String position;

  Employee({
    @required this.id,
    @required this.code,
    @required this.surname,
    @required this.name,
    @required this.middleName,
    @required this.position,
  });
  
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'], 
      code: json['code'], 
      surname: json['surname'], 
      name: json['name'],
      middleName: json['middleName'],
      position: json['position'], 
    );
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