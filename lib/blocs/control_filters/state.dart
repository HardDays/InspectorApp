import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/object_kind.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/street.dart';

part 'state.freezed.dart';
part 'state.g.dart';

@freezed
abstract class ControlFiltersBlocState with _$ControlFiltersBlocState {
  const ControlFiltersBlocState._();

  const factory ControlFiltersBlocState({
    ObjectType dcObjectType,
    ObjectKind dcObjectKind,
    int externalId,
    String objectName,
    Area area,
    District district,
    Street street,
    Address address,
    int searchRadius,
    String balanceOwner,
    int daysFromLastSurvey,
    List<DateTime> lastSurveyDates,
    bool camerasExist,
    bool ignoreViolations,
    ObjectElement objectElement,
    ViolationName violationName,
    ViolationStatus violationStatus,
    Source source,
    List<DateTime> controlDates,
    List<DateTime> detectionDates,
  }) = AllState;  

  List<int> get areasIds => area != null ? [area.id] : null;
  List<int> get districtIds => district != null ? [district.id] : null;
  List<int> get addressIds => address != null ? [address.id] : null;
  List<int> get streetIds => street != null ? [street.id] : null;
  List<int> get dcObjectTypesIds => dcObjectType != null ? [dcObjectType.id] : null;
  List<int> get objectElementIds => objectElement != null ? [objectElement.id] : null;
  List<int> get violationNameIds => violationName != null ? [violationName.id] : null;
  List<int> get violationStatusIds => violationStatus != null ? [violationStatus.id] : null;

  DateTime get detectionDateFrom => detectionDates != null && detectionDates.isNotEmpty ? detectionDates.first : null;
  DateTime get detectionDateTo => detectionDates != null && detectionDates.length == 2 ? detectionDates.last : null;

  DateTime get controlDateFrom => controlDates != null && controlDates.isNotEmpty ? controlDates.first : null;
  DateTime get controlDateTo => controlDates != null && controlDates.length == 2 ? controlDates.last : null;

  DateTime get lastSurveyDateFrom => lastSurveyDates != null && lastSurveyDates.isNotEmpty ? lastSurveyDates.first : null;
  DateTime get lastSurveyDateTo => lastSurveyDates != null && lastSurveyDates.length == 2 ? lastSurveyDates.last : null;

  factory ControlFiltersBlocState.fromJson(Map<String, dynamic> json) =>
      _$ControlFiltersBlocStateFromJson(json);
}

