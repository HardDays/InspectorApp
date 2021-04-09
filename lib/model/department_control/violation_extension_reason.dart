import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_extension_reason.g.dart';
part 'violation_extension_reason.freezed.dart';

@freezed
abstract class ViolationExtensionReason with _$ViolationExtensionReason {
  const ViolationExtensionReason._();

  const factory ViolationExtensionReason({
    int id,
    String name,
  }) = _ViolationExtensionReason;

  factory ViolationExtensionReason.fromJson(Map<String, dynamic> json) =>
      _$ViolationExtensionReasonFromJson(json);

  Map<String, dynamic> toSqliteJson() => toJson();
}
