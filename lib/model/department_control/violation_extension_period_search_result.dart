import 'package:inspector/model/department_control/violation_extension_reason.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_extension_period_search_result.g.dart';
part 'violation_extension_period_search_result.freezed.dart';

@freezed
abstract class ViolationExtensionPeriodSearchResult with _$ViolationExtensionPeriodSearchResult {
  const factory ViolationExtensionPeriodSearchResult({
    DateTime resolveDate,
    ViolationExtensionReason extensionReason,
    String comments,
    int id,
    String decisionPersonFio,
    String decisionPersonOccupation,
    bool sentToCafap,
  }) = _ViolationExtensionPeriodSearchResult;

  factory ViolationExtensionPeriodSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationExtensionPeriodSearchResultFromJson(json);
}
