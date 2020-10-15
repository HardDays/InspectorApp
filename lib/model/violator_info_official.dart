import 'package:flutter/foundation.dart';
import 'package:inspector/model/violator_address.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'orgId': orgId,
      'orgName': orgName,
      'orgInn': orgInn,
      'orgOgrn': orgOgrn,
      'orgKpp': orgKpp,
      'orgRegDate': orgRegDate,
      'orgPhone': orgPhone,
      'orgLegalAddress': orgLegalAddress,
      'orgPostalAddress': orgPostalAddress
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }

  factory ViolatorInfoOfficial.fromJson(Map<String, dynamic> json) {
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
      orgLegalAddress: json['orgLegalAddress'] != null ? 
          ViolatorAddress.fromJson(json['orgLegalAddress']) : null,
      orgPostalAddress: json['orgPostalAddress'] != null ? 
          ViolatorAddress.fromJson(json['orgPostalAddress']) : null,
    );
  }
}
