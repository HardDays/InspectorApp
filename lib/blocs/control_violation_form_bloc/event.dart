import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlViolationFormEvent with _$ControlViolationFormEvent {
  const factory ControlViolationFormEvent.setCriticalEvent(
    bool value,
  ) = SetCriticalEvent;

  const factory ControlViolationFormEvent.setUseGeoLocationForAddressEvent(
    bool value,
  ) = SetUseGeoLocationForAddressEvent;

  const factory ControlViolationFormEvent.setAddressEvent(
    Address address,
  ) = SetAddressEvent;

  const factory ControlViolationFormEvent.setTargetLandmark(
    String targetLandmark,
  ) = SetTargetLandmark;

  const factory ControlViolationFormEvent.setObjectElementString(
    String objectElement,
  ) = SetObjectElementString;

  const factory ControlViolationFormEvent.setObjectElement(
    ObjectElement objectElement,
  ) = SetObjectElement;

  const factory ControlViolationFormEvent.setDescriptionEvent(
    String description,
  ) = SetDescriptionEvent;

  const factory ControlViolationFormEvent.setViolationAdditionalFeatureStringEvent(
    String violationAdditionalFeature,
  ) = SetViolationAdditionalFeatureStringEvent;

  const factory ControlViolationFormEvent.setViolationAdditionalFeatureEvent(
    ViolationAdditionalFeature violationAdditionalFeature,
  ) = SetViolationAdditionalFeatureEvent;

  const factory ControlViolationFormEvent.setContractorStringEvent(
    String contractor,
  ) = SetContractorStringEvent;

  const factory ControlViolationFormEvent.setContractorEvent(
    Contractor contractor,
  ) = SetContractorEvent;

  const factory ControlViolationFormEvent.addPhotoEvent(
    Uint8List photo,
    String name,
  ) = AddPhotoEvent;

  const factory ControlViolationFormEvent.removePhotoEvent(
    int index,
  ) = RemovePhotoEvent;
  
  const factory ControlViolationFormEvent.rotatePhotoEvent(
    int index,
    Uint8List photo,
  ) = RotatePhotoEvent;
  
  const factory ControlViolationFormEvent.setViolationClassificationString(
    String classification,
  ) = SetViolationClassificationString;

  const factory ControlViolationFormEvent.setViolationClassifications(
    ViolationClassificationSearchResult classification,
  ) = SetViolationClassification;

}
