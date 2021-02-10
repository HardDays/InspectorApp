import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_status.g.dart';
part 'violation_status.freezed.dart';

@freezed
abstract class ViolationStatus with _$ViolationStatus {

  const ViolationStatus._();

  const factory ViolationStatus({
    int id,
    String name,
    String code,
  }) = _ViolationStatus;

  factory ViolationStatus.fromJson(Map<String, dynamic> json) =>
      _$ViolationStatusFromJson(json);

  Map<String, dynamic> toSqliteJson() => toJson();

}