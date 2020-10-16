import 'package:flutter/foundation.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/model/violator_doc_type.dart';

class ViolatorInfoPrivate {
  final int id;
  final String phone;
  final String lastName;
  final String firstName;
  final String patronym;
  final String inn;
  final String snils;
  final ViolatorDocumentType docType;
  final String docSeries;
  final String docNumber;
  final int gender;
  final DateTime birthDate;
  final String birthPlace;
  final ViolatorAddress registrationAddress;

  ViolatorInfoPrivate({
    @required this.id,
    @required this.phone,
    @required this.lastName,
    @required this.firstName,
    @required this.patronym,
    @required this.inn,
    @required this.snils,
    @required this.docType,
    @required this.docSeries,
    @required this.docNumber,
    @required this.gender,
    @required this.birthDate,
    @required this.birthPlace,
    @required this.registrationAddress,
  });

  factory ViolatorInfoPrivate.fromJson(Map<String, dynamic> json) {
    return ViolatorInfoPrivate(
      id: json['id'],
      phone: json['phone'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      patronym: json['patronym'],
      inn: json['inn'],
      snils: json['snils'],
      docType: json['docType'] != null ? ViolatorDocumentType.fromJson(json['docType']) : null,
      docSeries: json['docSeries'],
      docNumber: json['docNumber'],
      gender: json['gender'],
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      birthPlace: json['birthPlace'],
      registrationAddress: json['registrationAddress'] != null ? 
          ViolatorAddress.fromJson(json['registrationAddress']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'lastName': lastName,
      'firstName': firstName,
      'patronym': patronym,
      'inn': inn,
      'snils': snils,
      'docType': docType,
      'docSeries': docSeries,
      'docNumber': docNumber,
      'gender': gender,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'registrationAddress': registrationAddress
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}
