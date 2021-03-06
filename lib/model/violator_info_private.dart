import 'package:inspector/model/violator_address.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'dart:convert' as c;

import 'package:inspector/model/violator_info.dart';

class ViolatorInfoPrivate extends ViolatorInfo{
  // final int id;
  // final String phone;
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
  final String registrationAddressString;
  final ViolatorAddress registrationAddress;

  ViolatorInfoPrivate({
    // this.id,
    // this.phone,
    int id,
    String phone, 
    this.lastName,
    this.firstName,
    this.patronym,
    this.inn,
    this.snils,
    this.docType,
    this.docSeries,
    this.docNumber,
    this.gender,
    this.birthDate,
    this.birthPlace,
    this.registrationAddressString,
    this.registrationAddress,
  }) : super(id: id, phone: phone);

  String get name {
    final data = [firstName, lastName, patronym];
    return data.where((e)=> e !=null).join(' ');
  }

  String get registerAddressFormatted {
    if (registrationAddress != null && registrationAddress.valid()) {
      return registrationAddress.toString();
    } else {
      return registrationAddressString ?? '';
    }
  }

  factory ViolatorInfoPrivate.fromJson(Map<String, dynamic> json, {bool stringified = false}) {
    return ViolatorInfoPrivate(
      id: json['id'],
      phone: json['phone'],
      lastName: json['lastName'],
      firstName: json['firstName'],
      patronym: json['patronym'],
      inn: json['inn'],
      snils: json['snils'],
      docType: json['docType'] != null ? ViolatorDocumentType.parse(json['docType'], stringified) : null,
      docSeries: json['docSeries'],
      docNumber: json['docNumber'],
      gender: json['gender'],
      birthDate: json['birthDate'] != null ? DateTime.parse(json['birthDate']) : null,
      birthPlace: json['birthPlace'],
      registrationAddressString: json['registrationAddressString'],
      registrationAddress: json['registrationAddress'] != null ? ViolatorAddress.parse(json['registrationAddress'], stringified) : null,
    );
  }

  ViolatorInfoPrivate copyWith({
    String phone,
    String lastName,
    String firstName,
    String patronym,
    String inn,
    String snils,
    ViolatorDocumentType docType,
    String docSeries,
    String docNumber,
    int gender,
    DateTime birthDate,
    String birthPlace,
    String registrationAddressString,
    ViolatorAddress registrationAddress,
  }) {
    return ViolatorInfoPrivate(
      id: id,
      phone: phone ?? this.phone,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      patronym: patronym ?? this.patronym,
      inn: inn ?? this.inn,
      snils: snils ?? this.snils,
      docType: docType ?? this.docType,
      docSeries: docSeries ?? this.docSeries,
      docNumber: docNumber ?? this.docNumber,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
      registrationAddressString: registrationAddressString ?? this.registrationAddressString,
      registrationAddress: registrationAddress ?? this.registrationAddress,
    );
  }

  Map<String, dynamic> toJson({bool stringified = false}) {
    return {
      'id': id,
      'phone': phone,
      'lastName': lastName,
      'firstName': firstName,
      'patronym': patronym,
      'inn': inn,
      'snils': snils,
      'docType': docType != null ? stringified ? c.json.encode(docType.toJson()) : docType.toJson() : null,
      'docSeries': docSeries,
      'docNumber': docNumber,
      'gender': gender,
      'birthDate': birthDate?.toIso8601String(),
      'birthPlace': birthPlace,
      'registrationAddressString': registrationAddressString,
      'registrationAddress': registrationAddress != null ? stringified ? c.json.encode(registrationAddress.toJson()) : registrationAddress.toJson() : null,
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson(stringified: true);
  }

  @override
  String toString() {
    final data = [inn != null ? 'ИНН $inn' : null, name, docSeries != null && docNumber != null ? '($docSeries $docNumber)' : null];
    return data.where((e)=> e !=null).join(' ');
  }

}
