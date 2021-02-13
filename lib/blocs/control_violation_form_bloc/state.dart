import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';

part 'state.freezed.dart';

@freezed
abstract class CotnrolViolationFormState with _$CotnrolViolationFormState {
  const factory CotnrolViolationFormState({
    bool setAddressByGeoLocation,
    bool critical,
    Address address,
    String targetLandmark,
    ObjectElement objectElement,
    String description,
    ViolationAdditionalFeature violationAdditionalFeature,
    Contractor contractor,
    List<DCPhoto> photos,
    bool showClassificationField,
    ViolationClassification violationClassification,
  }) = _CotnrolViolationFormState;
}