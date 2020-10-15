import 'package:flutter/foundation.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_info.dart';

class Violator {
  final int id;
  final bool foreign;
  final bool violatorNotFound;

  final ViolationType type;
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
    if (json != null) {
      return Violator(
        id: json['id'], 
        foreign: json['foreign'], 
        violatorNotFound: json['violatorNotFound'],
        type: ViolationType.fromJson(json['type']),
        violatorPerson: ViolatorInfo.fromJson(json['violatorPerson']),
        departmentCode: DepartmentCode.fromJson(json['departmentCode']),
      );
    } else {
      return Violator.empty();
    }
  }

  Violator copyWith({
    bool violatorNotFound,
    bool foreign,
  }) {
    return Violator(
      id: id,
      violatorNotFound: violatorNotFound ?? this.violatorNotFound,
      foreign: foreign ?? this.foreign,
      type: type,
      violatorPerson: violatorPerson,
      departmentCode: departmentCode,
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