import 'package:flutter/foundation.dart';
import 'package:inspector/model/violator_address.dart';
import 'dart:convert' as c;

class ViolatorInfoOfficial {
  final int id;
  final String phone;
  final int orgId;
  final String orgName;
  final String orgInn;
  final String orgOgrn;
  final String orgKpp;
  final DateTime orgRegDate;
  final String orgPhone;
  final ViolatorAddress orgLegalAddress;
  final ViolatorAddress orgPostalAddress;

  ViolatorInfoOfficial({
    @required this.id,
    @required this.phone,
    @required this.orgId,
    @required this.orgName,
    @required this.orgInn,
    @required this.orgOgrn,
    @required this.orgKpp,
    @required this.orgRegDate,
    @required this.orgPhone,
    @required this.orgLegalAddress,
    @required this.orgPostalAddress,
  });

  factory ViolatorInfoOfficial.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    return ViolatorInfoOfficial(
      id: json['id'],
      phone: json['phone'],
      orgId: json['orgId'],
      orgName: json['orgName'],
      orgInn: json['orgInn'],
      orgOgrn: json['orgOgrn'],
      orgKpp: json['orgKpp'],
      orgRegDate: json['orgRegDate'] != null ? DateTime.parse(json['orgRegDate']) : null,
      orgPhone: json['orgPhone'],
      orgLegalAddress: ViolatorAddress.parse(json['orgLegalAddress'], stringified),
      orgPostalAddress: ViolatorAddress.parse(json['orgPostalAddress'], stringified),
    );
  }

  Map<String, dynamic> toJson({bool stringified = false}) {
    return {
      'id': id,
      'phone': phone,
      'orgId': orgId,
      'orgName': orgName,
      'orgInn': orgInn,
      'orgOgrn': orgOgrn,
      'orgKpp': orgKpp,
      'orgRegDate': orgRegDate?.toString(),
      'orgPhone': orgPhone,
      'orgLegalAddress': orgLegalAddress != null ? stringified ? c.json.encode(orgLegalAddress.toJson()) : orgLegalAddress.toJson() : null,
      'orgPostalAddress': orgPostalAddress != null ? stringified ? c.json.encode(orgPostalAddress.toJson()) : orgPostalAddress.toJson() : null,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson(stringified: true);
  }

  @override
  String toString() {
    final data = [orgName, orgOgrn != null ? 'ОГРН $orgOgrn' : null, orgInn != null ? 'ИНН $orgInn' : null];
    return data.where((e)=> e !=null).join(' ');
  }

}
