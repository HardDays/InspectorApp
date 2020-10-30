import 'package:flutter/foundation.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_info.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';

class Violator {
  final int id;
  final bool foreign;
  final bool violatorNotFound;

  final ViolatorType type;
  final ViolatorInfo violatorPerson;
  final DepartmentCode departmentCode;
  
  Violator({
    this.id,
    this.foreign,
    this.violatorNotFound,
    this.type,
    this.violatorPerson,
    this.departmentCode
  });

  factory Violator.empty() { 
    return Violator(
      violatorNotFound: false,
      foreign: false,
    );
  }

  factory Violator.fromJson(Map<String, dynamic> json) {
    final type = json['type'] != null ? ViolatorType.fromJson(json['type']) : null;
    ViolatorInfo info;
    if (json['violatorPerson'] != null) {
      if (type != null) {
        if (type.id == ViolatorTypeIds.ip) {
          info = ViolatorInfoIp.fromJson(json['violatorPerson']);
        } else if (type.id == ViolatorTypeIds.legal) {
          info = ViolatorInfoLegal.fromJson(json['violatorPerson']);
        } else if (type.id == ViolatorTypeIds.private) {
          info = ViolatorInfoPrivate.fromJson(json['violatorPerson']);
        } else if (type.id == ViolatorTypeIds.official) {
          info = ViolatorInfoOfficial.fromJson(json['violatorPerson']);
        }
      } else {
        info = ViolatorInfo.fromJson(json['violatorPerson']);
      }
    }
    return Violator(
      id: json['id'], 
      foreign: json['foreign'] ?? false, 
      violatorNotFound: json['violatorNotFound'] ?? false,
      type: type,
      violatorPerson: info,
      departmentCode: json['departmentCode'] != null ? DepartmentCode.fromJson(json['departmentCode']) : null,
    );
  }

  Violator copyWith({
    bool violatorNotFound,
    bool foreign,
    ViolatorType type,
    ViolatorInfo violatorPerson,
    DepartmentCode departmentCode,
  }) {
    return Violator(
      id: id,
      violatorNotFound: violatorNotFound ?? this.violatorNotFound,
      foreign: foreign ?? this.foreign,
      type: type ?? this.type,
      violatorPerson: violatorPerson ?? this.violatorPerson,
      departmentCode: departmentCode ?? this.departmentCode
    );
  }
  
  Map<String, dynamic>  toJson() {
    return {
      'id': id,
      'foreign': foreign,
      'violatorNotFound': violatorNotFound,
      'type': type?.toJson(),
      'violatorPerson': violatorPerson?.toJson(),
      'departmentCode': departmentCode?.toJson()
    };
  }

  Map<String, dynamic> toSqliteJson() {
    return toJson();
  }
}