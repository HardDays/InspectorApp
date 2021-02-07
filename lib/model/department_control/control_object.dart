import 'package:inspector/model/department_control/contactor.dart';
import 'package:inspector/model/department_control/map_geometric_object.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/violation_short_search_result.dart';
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