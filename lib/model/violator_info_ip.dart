import 'dart:convert' as c;

import 'package:flutter/foundation.dart';
import 'package:inspector/model/violator_address.dart';

class ViolatorInfoIp {
  final int id;
  final String phone;
  final String name;
  final String lastName;
  final String firstName;
  final String patronym;
  final String inn;
  final String snils;
  final String ogrnip;
  final DateTime registrationDate;
  final int gender;
  final DateTime birthDate;
  final String birthPlace;
  final ViolatorAddress registrationAddress;
  final String account;
  final String corrAccount;
  final String bank;
  final String bik;

  ViolatorInfoIp({
    @required this.id,
    @required this.phone,
    @required this.name,
    @required this.lastName,
    @required this.firstName,
    @required this.patronym,
    @required this.inn,
    @required this.snils,
    @required this.ogrnip,
    @required this.registrationDate,
    @required this.gender,
    @required this.birthDate,
    @required this.birthPlace,
    @required this.registrationAddress,
    @required this.account,
    @required this.corrAccount,
    @required this.bank,
    @required this.bik,
  });

  factory ViolatorInfoIp.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    return ViolatorInfoIp(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      patronym: json['patronym'],
      inn: json['inn'],
      snils: json['snils'],
      ogrnip: json['ogrnip'],
      registrationDate: json['registrationDate'] != null ? DateTime.parse(json['registrationDate']) : null,
      gender: json['gender'],
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      birthPlace: json['birthPlace'],
      registrationAddress: ViolatorAddress.parse(json['registrationAddress'], stringified),  
      account: json['account'],
      corrAccount: json['corrAccount'],
      bank: json['bank'],
      bik: json['bik'],
    );
  }

  Map<String, dynamic> toJson({bool stringified = false}) {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'lastName': lastName,
      'firstName': firstName,
      'patronym': patronym,
      'inn': inn,
      'snils': snils,
      'ogrnip': ogrnip,
      'registrationDate': registrationDate?.toString(),
      'gender': gender,
      'birthDate': birthDate?.toString(),
      'birthPlace': birthPlace,
      'registrationAddress': registrationAddress != null ? stringified ? c.json.encode(registrationAddress.toJson()) : registrationAddress.toJson() : null,
      'account': account,
      'corrAccount': corrAccount,
      'bank': bank,
      'bik': bik
     };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson(stringified: true);
  }

  @override
  String toString() {
    final data = [firstName, lastName, patronym, ogrnip != null ? 'ОГРНИП $ogrnip' : null, inn != null ? 'ИНН $inn' : null];
    return data.where((e)=> e !=null).join(' ');
  }
}
