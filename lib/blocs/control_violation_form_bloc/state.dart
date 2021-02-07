import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';

part 'state.freezed.dart';

@freezed
abstract class CotnrolViolationFormState with _$CotnrolViolationFormState {
  const factory CotnrolViolationFormState({
    bool setAddressByGeoLocation,
    bool critical,
    Address address,
    String targetLandmark,
    ObjectElementFormField objectElement,
    String description,
    ViolationAdditionalFeatureFormField violationAdditionalFeature,
    ContractorFormField contractor,
    List<Uint8List> photos,
  }) = _CotnrolViolationFormState;
}

@freezed
abstract class ObjectElementFormField with _$ObjectElementFormField {
  const factory ObjectElementFormField.string({
    String objectElement,
    List<ObjectElement> suggestions,
  }) = _ObjectElementFormFieldString;

  const factory ObjectElementFormField.object({
    ObjectElement objectElement,
  }) = ObjectElementFormFieldObject;
}

@freezed
abstract class ViolationAdditionalFeatureFormField with _$ViolationAdditionalFeatureFormField {
  const factory ViolationAdditionalFeatureFormField.string({
    String violationAdditionalFeature,
    List<ViolationAdditionalFeature> suggestions,
  }) = _ViolationAdditionalFeatureFormFieldString;

  const factory ViolationAdditionalFeatureFormField.object({
    ViolationAdditionalFeature violationAdditionalFeature,
  }) = ViolationAdditionalFeatureFormFieldObject;
}

@freezed
abstract class ContractorFormField with _$ContractorFormField {
  const factory ContractorFormField.string({
    String contractor,
    List<Contractor> suggestions,
  }) = _ContractorFormFieldString;

  const factory ContractorFormField.object({
    Contractor contractor,
  }) = ContractorFormFieldObject;
}