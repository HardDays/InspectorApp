import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';

part 'dcviolation.g.dart';
part 'dcviolation.freezed.dart';

@freezed
abstract class DCViolation with _$DCViolation {
  const factory DCViolation({
    int id,
    DateTime detectionDate,
    ViolationClassification eknViolationClassification,
    ViolationClassification otherViolationClassification,
    Address btiAddress,
    String address,
    Address btiRefAddress,
    bool refAddressTinao,
    ObjectElement objectElement,
    String description,
    Contractor violator,
    bool critical,
    DateTime resolveDate,
    DateTime controlDate,
    List<ViolationAdditionalFeature> additionalFeatures,
    List<DCPhoto> photos,
  }) = _DCViolation;
  
  factory DCViolation.fromJson(Map<String, dynamic> json) =>
      _$DCViolationFromJson(json);
}