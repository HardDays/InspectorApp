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
  final String registrationAddressString;
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
    this.registrationAddressString,
    this.registrationAddress,
    this.account,
    this.corrAccount,
    this.bank,
    this.bik,
  }) : super(id: id, phone: phone);

  String get registerAddressFormatted {
    if (registrationAddress != null && registrationAddress.valid()) {
      return registrationAddress.toString();
    } else {
      return registrationAddressString ?? '';
    }
  }

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
      registrationAddressString: json['registrationAddressString'],
      registrationAddress: json['registrationAddress'] != null ? ViolatorAddress.parse(json['registrationAddress'], stringified) : null,  
      account: json['account'],
      corrAccount: json['corrAccount'],
      bank: json['bank'],
      bik: json['bik'],
    );
  }

  ViolatorInfoIp copyWith({
    String phone,
    String name,
    String lastName,
    String firstName,
    String patronym,
    String inn,
    String snils,
    String ogrnip,
    DateTime registrationDate,
    int gender,
    DateTime birthDate,
    String birthPlace,
    String registrationAddressString,
    ViolatorAddress registrationAddress,
    String account,
    String corrAccount,
    String bank,
    String bik,
  }) {
    return ViolatorInfoIp(
      id: id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      patronym: patronym ?? this.patronym,
      inn: inn ?? this.inn,
      snils: snils ?? this.snils,
      ogrnip: ogrnip ?? this.ogrnip,
      registrationDate: registrationDate ?? this.registrationDate,
      account: account ?? this.account,
      corrAccount: corrAccount ?? this.corrAccount,
      bank: bank ?? this.bank,
      bik: bik ?? this.bik,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
      registrationAddressString: registrationAddressString ?? this.registrationAddressString,
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
      'registrationDate': registrationDate?.toIso8601String(),
      'gender': gender,
      'birthDate': birthDate?.toIso8601String(),
      'birthPlace': birthPlace,
      'registrationAddressString': registrationAddressString,
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
