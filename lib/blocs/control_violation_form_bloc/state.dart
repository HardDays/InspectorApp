import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';

part 'state.freezed.dart';

@freezed
abstract class CotnrolViolationFormState implements _$CotnrolViolationFormState {

  const CotnrolViolationFormState._();

  const factory CotnrolViolationFormState({
    bool setAddressByGeoLocation,
    bool critical,
    Address address,
    String adressErrorString,
    String targetLandmark,
    String targetLandmarkErrorString,
    ObjectElement objectElement,
    String objectElementErrorString,
    String description,
    String descriptionErrorString,
    ViolationAdditionalFeature violationAdditionalFeature,
    String violationAdditionalFeatureErrorString,
    Contractor contractor,
    String contractorErrorString,
    List<DCPhoto> photos,
    bool showClassificationField,
    ViolationClassification violationClassification,
    String violationClassificationErrorString,
    ViolationClassification violationClassificationNoEkn,
    String violationClassificationErrorStringNoEkn,
  }) = _CotnrolViolationFormState;

  bool isValid() =>
    adressErrorString == null &&
    targetLandmarkErrorString == null &&
    objectElementErrorString == null &&
    descriptionErrorString == null &&
    violationAdditionalFeatureErrorString == null &&
    contractorErrorString == null &&
    violationClassificationErrorString == null && 
    violationClassificationErrorStringNoEkn == null;
}