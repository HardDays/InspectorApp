import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/dc_object_element.dart';
import 'package:inspector/model/dc_object_kind.dart';
import 'package:inspector/model/dc_object_type.dart';
import 'package:inspector/model/dc_violation_name.dart';
import 'package:inspector/model/dc_violation_status.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/violator_address.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlFiltersBlocState with _$ControlFiltersBlocState {
  // const factory ControlFiltersBlocState() = _ControlFiltersBlocState;

  const factory ControlFiltersBlocState({
    DCObjectType dcObjectType,
    DCObjectKind dcObjectKind,
    String externalId,
    String objectName,
    Area area,
    District district,
    ViolatorAddress address,
    int searchRadius,
    String balanceOwner,
    int daysFromLastSurvey,
    DateTime lastSurveyDateFrom,
    DateTime lastSurveyDateTo,
    bool camerasExist,
    bool ignoreViolations,
    DCObjectElement objectElement,
    DCViolationName violationName,
    DCViolationStatus violationStatus,
    String sourceId,
    DateTime controlDateFrom,
    DateTime controlDateTo,
    DateTime detectionDateFrom,
    DateTime detectionDateTo,
  }) = AllState;  


}