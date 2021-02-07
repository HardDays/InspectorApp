import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_additional_feature.g.dart';
part 'violation_additional_feature.freezed.dart';

@freezed
abstract class ViolationAdditionalFeature with _$ViolationAdditionalFeature {
  const factory ViolationAdditionalFeature({
    int id,
    String name,
  }) = _ViolationAdditionalFeature;

  factory ViolationAdditionalFeature.fromJson(Map<String, dynamic> json) =>
      _$ViolationAdditionalFeatureFromJson(json);

}