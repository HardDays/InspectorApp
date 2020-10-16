import 'package:flutter/foundation.dart';
import 'package:inspector/model/violator_address.dart';

class ViolatorInfoLegal {
  final int id;
  final String phone;
  final String name;
  final String inn;
  final String ogrn;
  final String kpp;
  final DateTime regDate;
  final ViolatorAddress legalAddress;
  final ViolatorAddress postalAddress;
  final String account;
  final String corrAccount;
  final String bank;
  final String bik;

  ViolatorInfoLegal({
    @required this.id,
    @required this.phone,
    @required this.name,
    @required this.inn,
    @required this.ogrn,
    @required this.kpp,
    @required this.regDate,
    @required this.legalAddress,
    @required this.postalAddress,
    @required this.account,
    @required this.corrAccount,
    @required this.bank,
    @required this.bik,
  });

  factory ViolatorInfoLegal.fromJson(Map<String, dynamic> json) {
    return ViolatorInfoLegal(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      inn: json['inn'],
      ogrn: json['ogrn'],
      kpp: json['kpp'],
      regDate: json['regDate'] != null ? DateTime.parse(json['regDate']) : null,
      legalAddress: json['legalAddress'] != null ? 
          ViolatorAddress.fromJson(json['legalAddress']) : null,
      postalAddress: json['postalAddress'] != null ? 
          ViolatorAddress.fromJson(json['postalAddress']) : null,
      account: json['account'],
      corrAccount: json['corrAccount'],
      bank: json['bank'],
      bik: json['bik'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'inn': inn,
      'ogrn': ogrn,
      'kpp': kpp,
      'regDate': regDate,
      'legalAddress': legalAddress,
      'postalAddress': postalAddress,
      'account': account,
      'corrAccount': corrAccount,
      'bank': bank,
      'bik': bik,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}
