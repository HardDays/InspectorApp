import 'package:flutter/foundation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_type.dart';

class Violation {
  final int id;
  final String violationDescription;
  final String violationNum;
  final String violationDate;
  final String cafapId;
  final String codexArticle;

  final ViolationStatus violationStatus;
  final SpecialObject controlSpecialObject;
  final Address violationAddress;
  final ObjectCategory objectCategory;
  final ViolationType violationType;
  
  final List<NormativeActArticle> normativeActArticles;
  final List<Violator> violators;

  Violation({
    this.id,  
    this.violationDescription,
    this.violationNum,
    this.violationDate,
    this.cafapId,
    this.codexArticle,
    this.violationStatus,
    this.controlSpecialObject,
    this.violationAddress,
    this.objectCategory,
    this.violationType,
    this.normativeActArticles,
    this.violators
  });

  factory Violation.empty() {
    return Violation(
      violationAddress: Address(),
      normativeActArticles: [
        NormativeActArticle()
      ],
      violators: [
        Violator.empty()
      ],
    );
  }

  factory Violation.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Violation(
        id: json['id'], 
        violationDescription: json['violationDescription'], 
        violationNum: json['violationNum'],
        violationDate: json['violationDate'],
        cafapId: json['cafapId'],
        codexArticle: json['codexArticle'],
        violationStatus: ViolationStatus.fromJson(json['violationNum']),
        controlSpecialObject: SpecialObject.fromJson(json['controlSpecialObject']),
        violationAddress: Address.fromJson(json['violationAddress']),
        objectCategory: ObjectCategory.fromJson(json['objectCategory']),
        violationType: ViolationType.fromJson(json['violationType']),
        normativeActArticles: json['normativeActArticles'] != null ? List<NormativeActArticle>.from(json['normativeActArticles'].map((p) => NormativeActArticle.fromJson(p))) : [],
        violators: json['violators'] != null ? List<Violator>.from(json['violators'].map((p) => Violator.fromJson(p))) : [],
      );
    } else {
      return Violation.empty();
    }
  }

  Violation copyWith({
    Address violationAddress,
    ObjectCategory objectCategory,
    ViolationType violationType,
    List<NormativeActArticle> normativeActArticles,
    List<Violator> violators,
  }) {
    return Violation(
      id: id,
      violationDescription: violationDescription,
      violationNum: violationNum,
      violationDate: violationDate,
      cafapId: cafapId,
      codexArticle: codexArticle,
      violationStatus: violationStatus,
      controlSpecialObject: controlSpecialObject,
      violationAddress: violationAddress ?? this.violationAddress,
      objectCategory: objectCategory ?? this.objectCategory,
      violationType: violationType ?? this.violationType,
      normativeActArticles: normativeActArticles ?? this.normativeActArticles,
      violators: violators ?? this.violators
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'violationDescription': violationDescription,
      'violationNum': violationNum,
      'violationDate': violationDate,
      'cafapId': cafapId,
      'codexArticle': codexArticle,
      'violationStatus': violationStatus?.toJson(),
      'controlSpecialObject': controlSpecialObject?.toJson(),
      'violationAddress': violationAddress?.toJson(),
      'objectCategory': objectCategory?.toJson(),
      'violationType': violationType?.toJson(),
      'normativeActArticles': normativeActArticles.map((e) => e.toJson()).toList(),
      'violators': violators.map((e) => e.toJson()).toList(),
    };
  }
}