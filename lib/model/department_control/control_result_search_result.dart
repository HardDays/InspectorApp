
import 'package:inspector/model/department_control/violation_search_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'control_result_search_result.g.dart';
part 'control_result_search_result.freezed.dart';

@freezed
abstract class ControlResultSearchResult with _$ControlResultSearchResult {
  const factory ControlResultSearchResult({
    int id,
    DateTime surveyDate,
    double geometryX,
    double geometryY,
    bool violationExists,
    ViolationSearchResult violation,
    bool creationSentToCafap,
    bool closureSentToCafap,
  }) = _ControlResultSearchResult;

  factory ControlResultSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ControlResultSearchResultFromJson(json);

}
