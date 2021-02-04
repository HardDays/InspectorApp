import 'dart:convert' as c;

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
  final String legalAddressString;
  final String postalAddressString;
  final ViolatorAddress legalAddress;
  final ViolatorAddress postalAddress;
  final String account;
  final String corrAccount;
  final String bank;
  final String bik;

  ViolatorInfoLegal({
    // this.id,
    // this.phone,
    int id,
    String phone,
    this.name,
    this.inn,
    this.ogrn,
    this.kpp,
    this.regDate,
    this.legalAddressString,
    this.postalAddressString,
    this.legalAddress,
    this.postalAddress,
    this.account,
    this.corrAccount,
    this.bank,
    this.bik,
  }) : super(id: id, phone: phone);

  String get legalAddressFormatted {
    if (legalAddress != null && legalAddress.valid()) {
      return legalAddress.toString();
    } else {
      return legalAddressString ?? '';
    }
  }

  String get postalAddressFormatted {
    if (postalAddress != null && postalAddress.valid()) {
      return postalAddress.toString();
    } else {
      return postalAddressString ?? '';
    }
  }

  factory ViolatorInfoLegal.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    return ViolatorInfoLegal(
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      inn: json['inn'],
      ogrn: json['ogrn'],
      kpp: json['kpp'],
      regDate: json['regDate'] != null ? DateTime.parse(json['regDate']) : null,
      legalAddressString: json['legalAddressString'],
      postalAddressString: json['postalAddressString'],
      legalAddress: json['legalAddress'] != null ? ViolatorAddress.parse(json['legalAddress'], stringified) : null,
      postalAddress: json['postalAddress'] != null ? ViolatorAddress.parse(json['postalAddress'], stringified) : null,
      account: json['account'],
      corrAccount: json['corrAccount'],
      bank: json['bank'],
      bik: json['bik'],
    );
  }

  ViolatorInfoLegal copyWith({
    String phone,
    String name,
    String inn,
    String ogrn,
    String kpp,
    DateTime regDate,
    String legalAddressString,
    String postalAddressString,
    ViolatorAddress legalAddress,
    ViolatorAddress postalAddress,
    String account,
    String corrAccount,
    String bank,
    String bik,
  }) {
    return ViolatorInfoLegal(
      id: id ?? this.id,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      inn: inn ?? this.inn,
      ogrn: ogrn ?? this.ogrn,
      kpp: kpp ?? this.kpp,
      regDate: regDate ?? this.regDate,
      legalAddressString: legalAddressString ?? this.legalAddressString,
      postalAddressString: postalAddressString ?? this.postalAddressString,
      legalAddress: legalAddress ?? this.legalAddress,
      postalAddress: postalAddress ?? this.postalAddress,
      account: account ?? this.account,
      corrAccount: corrAccount ?? this.corrAccount,
      bank: bank ?? this.bank,
      bik: bik ?? this.bik,
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
      'regDate': regDate?.toIso8601String(),
      'legalAddressString': legalAddressString,
      'postalAddressString': postalAddressString,
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
