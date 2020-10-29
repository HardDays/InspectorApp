import 'dart:convert' as c;

import 'package:inspector/model/violator_address.dart';
import 'package:inspector/model/violator_info.dart';

class ViolatorInfoIp extends ViolatorInfo {
  // final int id;
  // final String phone;
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
    // this.id,
    // this.phone,
    int id,
    String phone,
    this.name,
    this.lastName,
    this.firstName,
    this.patronym,
    this.inn,
    this.snils,
    this.ogrnip,
    this.registrationDate,
    this.gender,
    this.birthDate,
    this.birthPlace,
    this.registrationAddress,
    this.account,
    this.corrAccount,
    this.bank,
    this.bik,
  }) : super(id: id, phone: phone);

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
      registrationAddress: json['registrationAddress'] != null ? ViolatorAddress.parse(json['registrationAddress'], stringified) : null,  
      account: json['account'],
      corrAccount: json['corrAccount'],
      bank: json['bank'],
      bik: json['bik'],
    );
  }

  ViolatorInfoIp copyWith({
    ViolatorAddress registrationAddress
  }) {
    return ViolatorInfoIp(
      id: id,
      phone: phone,
      name: name,
      lastName: lastName,
      firstName: firstName,
      patronym: patronym,
      inn: inn,
      snils: snils,
      ogrnip: ogrnip,
      registrationDate: registrationDate,
      account: account,
      corrAccount: corrAccount,
      bank: bank,
      bik: bik,
      gender: gender,
      birthDate: birthDate,
      birthPlace: birthPlace,
      registrationAddress: registrationAddress ?? this.registrationAddress
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
