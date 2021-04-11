import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/department_control/violation_extension_reason.dart';

part 'violation_extension_period.freezed.dart';
part 'violation_extension_period.g.dart';

@freezed
abstract class ViolationExtensionPeriod with _$ViolationExtensionPeriod {
  const factory ViolationExtensionPeriod({
    DateTime resolveDate,
    ViolationExtensionReason extensionReason,
    String comments,
  }) = _ViolationExtensionPeriod;

  factory ViolationExtensionPeriod.fromJson(Map<String, dynamic> json) =>
      _$ViolationExtensionPeriodFromJson(json);
}
