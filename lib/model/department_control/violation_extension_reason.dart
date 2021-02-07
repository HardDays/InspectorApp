import 'package:json_annotation/json_annotation.dart';

part 'violation_extension_reason.g.dart';

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