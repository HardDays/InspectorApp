import 'dart:convert' as c;

import 'package:flutter/foundation.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/model/violator_info.dart';

class ViolatorInfoLegal extends ViolatorInfo {
  // final int id;
  // final String phone;
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
    // @required this.id,
    // @required this.phone,
    int id,
    String phone,
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
  }) : super(id: id, phone: phone);

  factory ViolatorInfoLegal.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    return ViolatorInfoLegal(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      inn: json['inn'],
      ogrn: json['ogrn'],
      kpp: json['kpp'],
      regDate: json['regDate'] != null ? DateTime.parse(json['regDate']) : null,
      legalAddress: json['legalAddress'] != null ? ViolatorAddress.parse(json['legalAddress'], stringified) : null,
      postalAddress: json['postalAddress'] != null ? ViolatorAddress.parse(json['postalAddress'], stringified) : null,
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
      'inn': inn,
      'ogrn': ogrn,
      'kpp': kpp,
      'regDate': regDate?.toString(),
      'legalAddress': legalAddress != null ? stringified ? c.json.encode(legalAddress.toJson()) : legalAddress.toJson() : null,
      'postalAddress': postalAddress != null ? stringified ? c.json.encode(postalAddress.toJson()) : postalAddress.toJson() : null,
      'account': account,
      'corrAccount': corrAccount,
      'bank': bank,
      'bik': bik,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson(stringified: true);
  }

  @override
  String toString() {
    final data = [name, ogrn != null ? 'ОГРН $ogrn' : null, inn != null ? 'ИНН $inn' : null];
    return data.where((e)=> e !=null).join(' ');
  }

}
