import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';

part 'event.freezed.dart';

@freezed
abstract class ControlViolationFormEvent with _$ControlViolationFormEvent {
  const factory ControlViolationFormEvent.setCriticalEvent(
    bool value,
  ) = SetCriticalEvent;

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

}
