import 'package:inspector/model/department_control/contactor.dart';
import 'package:inspector/model/department_control/map_geometric_object.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/violation_short_search_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'control_object.g.dart';
part 'control_object.freezed.dart';

@freezed
abstract class ControlObject with _$ControlObject {
  const factory ControlObject({
    int id,
    int externalId,
    ObjectType type,
    String kind,
    String name,
    String area,
    String district,
    String address,
    String balanceOwner,
    Contractor contractor,
    int cameraCount,
    String violationsCount,
    DateTime lastSurveyDate,
    String rowColor,
    List<MapGeometricObject> geometry,
    List<ViolationShortSearchResult> violations,
  }) = _ControlObject;

  factory ControlObject.fromJson(Map<String, dynamic> json) =>
      _$ControlObjectFromJson(json);
}
