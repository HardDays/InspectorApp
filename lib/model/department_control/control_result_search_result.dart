
import 'package:inspector/model/department_control/violation_search_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'control_result_search_result.g.dart';

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
