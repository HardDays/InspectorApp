import 'package:flutter/foundation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_type.dart';

class Violation {
  final int id;
  final String violationDescription;
  final String violationNum;
  final DateTime violationDate;
  final String cafapId;
  final String codexArticle;

  final ViolationStatus violationStatus;
  final SpecialObject controlSpecialObject;
  final Address violationAddress;
  final ObjectCategory objectCategory;
  final ViolationType violationType;
  
  final List<NormativeActArticle> normativeActArticles;
  final List<Violator> violators;
  final List<Photo> photos;

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
    this.violators,
    this.photos,
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
      photos: []
    );
  }

  factory Violation.fromJson(Map<String, dynamic> json) {
    return Violation(
      id: json['id'], 
      violationDescription: json['violationDescription'], 
      violationNum: json['violationNum'],
      violationDate: json['violationDate'] != null ? DateTime.parse(json['violationDate']) : null,
      cafapId: json['cafapId'],
      codexArticle: json['codexArticle'],
      violationStatus: json['violationStatus'] != null ? ViolationStatus.fromJson(json['violationStatus']) : null,
      controlSpecialObject: json['controlSpecialObject'] != null ? SpecialObject.fromJson(json['controlSpecialObject']) : null,
      violationAddress: json['violationAddress'] != null ? Address.fromJson(json['violationAddress']) : null,
      objectCategory: json['objectCategory'] != null ? ObjectCategory.fromJson(json['objectCategory']) : null,
      violationType: json['violationType'] != null ? ViolationType.fromJson(json['violationType']) : null,
      normativeActArticles: json['normativeActArticles'] != null ? List<NormativeActArticle>.from(json['normativeActArticles'].map((p) => NormativeActArticle.fromJson(p))) : [],
      violators: json['violators'] != null ? List<Violator>.from(json['violators'].map((p) => Violator.fromJson(p))) : [],
      photos: json['photos'] != null ? List<Photo>.from(json['photos'].map((p) => Photo.fromJson(p))) : [],
    );
  }

  Violation copyWith({
    String violationDescription,
    String codexArticle,
    DateTime violationDate,
    Address violationAddress,
    ObjectCategory objectCategory,
    ViolationType violationType,
    List<NormativeActArticle> normativeActArticles,
    List<Violator> violators,
    List<Photo> photos,
  }) {
    return Violation(
      id: id,
      violationDescription: violationDescription,
      violationNum: violationNum,
      violationDate: violationDate,
      cafapId: cafapId,
      codexArticle: codexArticle ?? this.codexArticle,
      violationStatus: violationStatus, 
      controlSpecialObject: controlSpecialObject,
      violationAddress: violationAddress ?? this.violationAddress,
      objectCategory: objectCategory ?? this.objectCategory,
      violationType: violationType ?? this.violationType,
      normativeActArticles: normativeActArticles ?? List.from(this.normativeActArticles),
      violators: violators ?? List.from(this.violators),
      photos: photos ?? List.from(this.photos),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'violationDescription': violationDescription,
      'violationNum': violationNum,
      'violationDate': violationDate?.toIso8601String(),
      'cafapId': cafapId,
      'codexArticle': codexArticle,
      'violationStatus': violationStatus?.toJson(),
      'controlSpecialObject': controlSpecialObject?.toJson(),
      'violationAddress': violationAddress?.toJson(),
      'objectCategory': objectCategory?.toJson(),
      'violationType': violationType?.toJson(),
      'normativeActArticles': normativeActArticles != null ? normativeActArticles.where((e) => e.id != null).map((e) => e.toJson()).toList() : [],
      'violators': violators.map((e) => e.toJson()).toList(),
      'photos': photos.map((e) => e.toJson()).toList(),
    };
  }
}