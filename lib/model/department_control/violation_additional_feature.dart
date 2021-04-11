import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_additional_feature.g.dart';
part 'violation_additional_feature.freezed.dart';

@freezed
abstract class ViolationAdditionalFeature implements _$ViolationAdditionalFeature {
  
  const ViolationAdditionalFeature._();
  
  const factory ViolationAdditionalFeature({
    int id,
    String name,
  }) = _ViolationAdditionalFeature;

  factory ViolationAdditionalFeature.fromJson(Map<String, dynamic> json) =>
      _$ViolationAdditionalFeatureFromJson(json);

  Map<String, dynamic> toSqliteJson() => toJson();  

}