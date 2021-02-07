import 'package:json_annotation/json_annotation.dart';

part 'violation_name.g.dart';

@JsonSerializable()
class ViolationName {
  final int id;
  final String name;

  ViolationName({
    this.id,
    this.name,
  });

  factory ViolationName.fromJson(Map<String, dynamic> json) =>
      _$ViolationNameFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationNameToJson(this);
}