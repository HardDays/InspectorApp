import 'package:json_annotation/json_annotation.dart';

part 'violation_additional_feature.g.dart';

@JsonSerializable()
class ViolationAdditionalFeature {
  ViolationAdditionalFeature({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory ViolationAdditionalFeature.fromJson(Map<String, dynamic> json) =>
      _$ViolationAdditionalFeatureFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationAdditionalFeatureToJson(this);
}