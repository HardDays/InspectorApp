import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contactor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/perform_mark.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';
import 'package:inspector/model/department_control/violation_extension_period_search_result.dart';
import 'package:inspector/model/violation_kind.dart';
import 'package:inspector/model/violation_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_search_result.g.dart';
part 'violation_search_result.freezed.dart';

@freezed
abstract class ViolationSearchResult with _$ViolationSearchResult {
  const factory ViolationSearchResult({
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
    String violationNum,
    ViolationStatus violationStatus,
    Source source,
    ViolationKind violationKind,
    String cafapAssigmentId,
    String cafapPrescriptionId,
    int cafapPrescriptionNum,
    bool cafapViolationConfirmed,
    List<PerformMark> performMarks,
    List<ViolationExtensionPeriodSearchResult> extensionPeriods,
    bool creationSentToCafap,
    bool closureSentToCafap,
  }) = _ViolationSearchResult;

  factory ViolationSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationSearchResultFromJson(json);
}