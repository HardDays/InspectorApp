import 'package:inspector/model/address.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/violation_kind.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'control_object.g.dart';

@JsonSerializable()
class ControlObject {
  final int id;
  final int externalId;
  final ObjectType type;
  final String kind;
  final String name;
  final String area;
  final String district;
  final String address;
  final String balanceOwner;
  final Contractor contractor;
  final int cameraCount;
  final String violationsCount;
  final DateTime lastSurveyDate;
  final String rowColor;
  final List<MapGeometricObject> geometry;
  final List<ViolationShortSearchResult> violations;

  ControlObject({
    this.id,
    this.externalId,
    this.type,
    this.kind,
    this.name,
    this.area,
    this.district,
    this.address,
    this.balanceOwner,
    this.contractor,
    this.cameraCount,
    this.violationsCount,
    this.lastSurveyDate,
    this.rowColor,
    this.geometry,
    this.violations,
  });

  factory ControlObject.fromJson(Map<String, dynamic> json) =>
      _$ControlObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ControlObjectToJson(this);
}

enum MapGeometricObjectType {
  point,
  polyline,
  polygon,
}

@JsonSerializable()
class Point {
  final int x;
  final int y;

  Point({
    this.x,
    this.y,
  });

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
  Map<String, dynamic> toJson() => _$PointToJson(this);
}

@JsonSerializable()
class MapGeometricObject {
  final MapGeometricObjectType type;
  final String color;
  final String label;
  final List<Point> points;

  MapGeometricObject({
    this.type,
    this.color,
    this.label,
    this.points,
  });

  factory MapGeometricObject.fromJson(Map<String, dynamic> json) =>
      _$MapGeometricObjectFromJson(json);
  Map<String, dynamic> toJson() => _$MapGeometricObjectToJson(this);
}

@JsonSerializable()
class ObjectType {
  final int id;
  final String name;
  final String code;

  ObjectType({
    this.id,
    this.name,
    this.code,
  });

  factory ObjectType.fromJson(Map<String, dynamic> json) =>
      _$ObjectTypeFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectTypeToJson(this);
}

@JsonSerializable()
class Contractor {
  final int id;
  final String name;
  final String inn;

  Contractor({
    this.id,
    this.name,
    this.inn,
  });

  factory Contractor.fromJson(Map<String, dynamic> json) =>
      _$ContractorFromJson(json);
  Map<String, dynamic> toJson() => _$ContractorToJson(this);
}

@JsonSerializable()
class ViolationShortSearchResult {
  final int id;
  final String violationNum;
  final ViolationStatus violationStatus;
  final String detectionDate;
  final Source source;
  final ObjectElement objectElement;
  final ViolationName eknViolationName;
  final ViolationName otherViolationName;
  final String resolveDate;
  final String controlDate;
  final List<DCPhoto> photos;

  ViolationShortSearchResult({
    this.id,
    this.violationNum,
    this.violationStatus,
    this.detectionDate,
    this.source,
    this.objectElement,
    this.eknViolationName,
    this.otherViolationName,
    this.resolveDate,
    this.controlDate,
    this.photos,
  });

  factory ViolationShortSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationShortSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationShortSearchResultToJson(this);
}

@JsonSerializable()
class Source {
  final int id;
  final String name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@JsonSerializable()
class ObjectElement {
  final int id;
  final String name;
  final ObjectType objectType;

  ObjectElement({
    this.id,
    this.name,
    this.objectType,
  });

  factory ObjectElement.fromJson(Map<String, dynamic> json) =>
      _$ObjectElementFromJson(json);
  Map<String, dynamic> toJson() => _$ObjectElementToJson(this);
}

@JsonSerializable()
class ViolationName {
  final int id;
  final String name;

  ViolationName({
    this.id,
    this.name,
  });

  factory ViolationName.fromJson(Map<String, dynamic> json) =>
      _$ViolationNameFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationNameToJson(this);
}

@JsonSerializable()
class DCPhoto {
  final int id;
  final String name;
  final String data;
  final String loadDate;
  final int geometryX;
  final int geometryY;

  DCPhoto({
    this.id,
    this.name,
    this.data,
    this.loadDate,
    this.geometryX,
    this.geometryY,
  });

  factory DCPhoto.fromJson(Map<String, dynamic> json) =>
      _$DCPhotoFromJson(json);
  Map<String, dynamic> toJson() => _$DCPhotoToJson(this);
}

@JsonSerializable()
class ControlResultSearchResult {
  ControlResultSearchResult({
    this.id,
    this.surveyDate,
    this.geometryX,
    this.geometryY,
    this.violationExists,
    this.violation,
    this.creationSentToCafap,
    this.closureSentToCafap,
  });

  final int id;
  final DateTime surveyDate;
  final double geometryX;
  final double geometryY;
  final bool violationExists;
  final ViolationSearchResult violation;
  final bool creationSentToCafap;
  final bool closureSentToCafap;

  factory ControlResultSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ControlResultSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ControlResultSearchResultToJson(this);
}

@JsonSerializable()
class ViolationSearchResult {
  ViolationSearchResult({
    this.id,
    this.detectionDate,
    this.eknViolationClassification,
    this.otherViolationClassification,
    this.btiAddress,
    this.address,
    this.btiRefAddress,
    this.refAddressTinao,
    this.objectElement,
    this.description,
    this.violator,
    this.critical,
    this.resolveDate,
    this.controlDate,
    this.additionalFeatures,
    this.photos,
    this.violationNum,
    this.violationStatus,
    this.source,
    this.violationKind,
    this.cafapAssigmentId,
    this.cafapPrescriptionId,
    this.cafapPrescriptionNum,
    this.cafapViolationConfirmed,
    this.performMarks,
    this.extensionPeriods,
    this.creationSentToCafap,
    this.closureSentToCafap,
  });

  final int id;
  final DateTime detectionDate;
  final ViolationClassification eknViolationClassification;
  final ViolationClassification otherViolationClassification;
  final Address btiAddress;
  final String address;
  final Address btiRefAddress;
  final bool refAddressTinao;
  final ObjectElement objectElement;
  final String description;
  final Contractor violator;
  final bool critical;
  final DateTime resolveDate;
  final DateTime controlDate;
  final List<ViolationAdditionalFeature> additionalFeatures;
  final List<DCPhoto> photos;
  final String violationNum;
  final ViolationStatus violationStatus;
  final Source source;
  final ViolationKind violationKind;
  final String cafapAssigmentId;
  final String cafapPrescriptionId;
  final int cafapPrescriptionNum;
  final bool cafapViolationConfirmed;
  final List<PerformMark> performMarks;
  final List<ViolationExtensionPeriodSearchResult> extensionPeriods;
  final bool creationSentToCafap;
  final bool closureSentToCafap;

  factory ViolationSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationSearchResultToJson(this);
}

@JsonSerializable()
class ViolationClassification {
  ViolationClassification({
    this.id,
    this.violationName,
  });

  final int id;
  final ViolationName violationName;

  factory ViolationClassification.fromJson(Map<String, dynamic> json) =>
      _$ViolationClassificationFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationClassificationToJson(this);
}

@JsonSerializable()
class ViolationAdditionalFeature {
  ViolationAdditionalFeature({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory ViolationAdditionalFeature.fromJson(Map<String, dynamic> json) =>
      _$ViolationAdditionalFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationAdditionalFeatureToJson(this);
}

@JsonSerializable()
class PerformMark {
  PerformMark({
    this.id,
    this.resolveDate,
    this.organization,
    this.creator,
    this.comments,
    this.photos,
  });

  final int id;
  final DateTime resolveDate;
  final String organization;
  final String creator;
  final String comments;
  final List<DCPhoto> photos;

  factory PerformMark.fromJson(Map<String, dynamic> json) =>
      _$PerformMarkFromJson(json);
  Map<String, dynamic> toJson() => _$PerformMarkToJson(this);
}

@JsonSerializable()
class ViolationExtensionPeriodSearchResult {
  ViolationExtensionPeriodSearchResult({
    this.resolveDate,
    this.extensionReason,
    this.comments,
    this.id,
    this.decisionPersonFio,
    this.decisionPersonOccupation,
    this.sentToCafap,
  });

  final DateTime resolveDate;
  final ViolationExtensionReason extensionReason;
  final String comments;
  final int id;
  final String decisionPersonFio;
  final String decisionPersonOccupation;
  final bool sentToCafap;

  factory ViolationExtensionPeriodSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationExtensionPeriodSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationExtensionPeriodSearchResultToJson(this);
}

@JsonSerializable()
class ViolationExtensionReason {
  ViolationExtensionReason({
    this.id,
    this.name,
  });
  
  final int id;
  final String name;

  factory ViolationExtensionReason.fromJson(Map<String, dynamic> json) =>
      _$ViolationExtensionReasonFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationExtensionReasonToJson(this);
}
