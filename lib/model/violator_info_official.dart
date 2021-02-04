import 'package:flutter/foundation.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/violator_address.dart';
import 'dart:convert' as c;

import 'package:inspector/model/violator_info.dart';

class ViolatorInfoOfficial extends ViolatorInfo {
  // final int id;
  // final String phone;
  final int orgId;
  final String orgName;
  final String orgInn;
  final String orgOgrn;
  final String orgKpp;
  final DateTime orgRegDate;
  final String orgPhone;
  final String orgLegalAddressString;
  final String orgPostalAddressString;
  final ViolatorAddress orgLegalAddress;
  final ViolatorAddress orgPostalAddress;

  ViolatorInfoOfficial({
    // this.id,
    // this.phone,
    int id,
    String phone,
    this.orgId,
    this.orgName,
    this.orgInn,
    this.orgOgrn,
    this.orgKpp,
    this.orgRegDate,
    this.orgPhone,
    this.orgLegalAddressString,
    this.orgPostalAddressString,
    this.orgLegalAddress,
    this.orgPostalAddress,
  }) : super(id: id, phone: phone);

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
      orgLegalAddressString: json['orgLegalAddressString'],
      orgPostalAddressString: json['orgPostalAddressString'],
      orgLegalAddress: json['orgLegalAddress'] != null ? ViolatorAddress.parse(json['orgLegalAddress'], stringified) : null,
      orgPostalAddress: json['orgPostalAddress'] != null ? ViolatorAddress.parse(json['orgPostalAddress'], stringified)  : null,
    );
  }

  
  ViolatorInfoOfficial copyWith({
      String phone,
      int orgId,
      String orgName,
      String orgInn,
      String orgOgrn,
      String orgKpp,
      DateTime orgRegDate,
      String orgPhone,
      String orgLegalAddressString,
      String orgPostalAddressString,
      ViolatorAddress orgLegalAddress,
      ViolatorAddress orgPostalAddress,
  }) {
    return ViolatorInfoOfficial(
      id: id,
      phone: phone ?? this.phone,
      orgId: orgId ?? this.orgId,
      orgName: orgName ?? this.orgName,
      orgInn: orgInn ?? this.orgInn,
      orgOgrn: orgOgrn ?? this.orgOgrn,
      orgKpp: orgKpp ?? this.orgKpp,
      orgRegDate: orgRegDate ?? this.orgRegDate,
      orgPhone: orgPhone ?? this.orgPhone,
      orgLegalAddressString: orgLegalAddressString ?? this.orgLegalAddressString,
      orgPostalAddressString: orgPostalAddressString ?? this.orgPostalAddressString,
      orgLegalAddress: orgLegalAddress ?? this.orgLegalAddress,
      orgPostalAddress: orgPostalAddress ?? this.orgPostalAddress
    );
  }

  String get name => orgName;

  String get orgLegalAddressFormatted {
    if (orgLegalAddress != null && orgLegalAddress.valid()) {
      return orgLegalAddress.toString();
    } else {
      return orgLegalAddressString ?? '';
    }
  }

  String get orgPostalAddressFormatted {
    if (orgPostalAddress != null && orgPostalAddress.valid()) {
      return orgPostalAddress.toString();
    } else {
      return orgPostalAddressString ?? '';
    }
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
      'orgRegDate': orgRegDate?.toIso8601String(),
      'orgPhone': orgPhone,
      'orgLegalAddressString': orgLegalAddressString,
      'orgPostalAddressString': orgPostalAddressString,
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
