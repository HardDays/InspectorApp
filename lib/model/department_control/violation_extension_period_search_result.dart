import 'package:inspector/model/department_control/violation_extension_reason.dart';
import 'package:json_annotation/json_annotation.dart';

part 'violation_extension_period_search_result.g.dart';

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
