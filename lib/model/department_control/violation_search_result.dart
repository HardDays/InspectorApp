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
import 'package:json_annotation/json_annotation.dart';

part 'violation_search_result.g.dart';

@JsonSerializable()
class ViolationSearchResult {
  ViolationSearchResult({
    this.id,
    this.detectionDate,
    this.eknViolationClassification,
    this.otherViolationClassification,
    this.btiAddress,
    this.address,
    this.btiRefAddress,
    this.refAddressTinao,
    this.objectElement,
    this.description,
    this.violator,
    this.critical,
    this.resolveDate,
    this.controlDate,
    this.additionalFeatures,
    this.photos,
    this.violationNum,
    this.violationStatus,
    this.source,
    this.violationKind,
    this.cafapAssigmentId,
    this.cafapPrescriptionId,
    this.cafapPrescriptionNum,
    this.cafapViolationConfirmed,
    this.performMarks,
    this.extensionPeriods,
    this.creationSentToCafap,
    this.closureSentToCafap,
  });

  final int id;
  final DateTime detectionDate;
  final ViolationClassification eknViolationClassification;
  final ViolationClassification otherViolationClassification;
  final Address btiAddress;
  final String address;
  final Address btiRefAddress;
  final bool refAddressTinao;
  final ObjectElement objectElement;
  final String description;
  final Contractor violator;
  final bool critical;
  final DateTime resolveDate;
  final DateTime controlDate;
  final List<ViolationAdditionalFeature> additionalFeatures;
  final List<DCPhoto> photos;
  final String violationNum;
  final ViolationStatus violationStatus;
  final Source source;
  final ViolationKind violationKind;
  final String cafapAssigmentId;
  final String cafapPrescriptionId;
  final int cafapPrescriptionNum;
  final bool cafapViolationConfirmed;
  final List<PerformMark> performMarks;
  final List<ViolationExtensionPeriodSearchResult> extensionPeriods;
  final bool creationSentToCafap;
  final bool closureSentToCafap;

  factory ViolationSearchResult.fromJson(Map<String, dynamic> json) =>
      _$ViolationSearchResultFromJson(json);
  Map<String, dynamic> toJson() => _$ViolationSearchResultToJson(this);
}