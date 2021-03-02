// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DepartmentControlObjectsRequest _$DepartmentControlObjectsRequestFromJson(
    Map<String, dynamic> json) {
  return _DepartmentControlObjectsRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlObjectsRequestTearOff {
  const _$DepartmentControlObjectsRequestTearOff();

// ignore: unused_element
  _DepartmentControlObjectsRequest call(
      {int dcObjectTypesIds,
      String dcObjectKind,
      int externalId,
      String objectName,
      int areaIds,
      int districtIds,
      int addressIds,
      bool onlyNearObjects,
      double userPositionX,
      double userPositionY,
      int searchRadius,
      String balanceOwner,
      int daysFromLastSurvey,
      DateTime lastSurveyDateFrom,
      DateTime lastSurveyDateTo,
      bool camerasExist,
      bool ignoreViolations,
      bool forCurrentUser,
      int objectElementIds,
      int violationNameIds,
      int sourceId,
      String violationNum,
      int violationStatusIds,
      DateTime detectionDateFrom,
      DateTime detectionDateTo,
      DateTime controlDateFrom,
      DateTime controlDateTo,
      int from,
      int to,
      String sort}) {
    return _DepartmentControlObjectsRequest(
      dcObjectTypesIds: dcObjectTypesIds,
      dcObjectKind: dcObjectKind,
      externalId: externalId,
      objectName: objectName,
      areaIds: areaIds,
      districtIds: districtIds,
      addressIds: addressIds,
      onlyNearObjects: onlyNearObjects,
      userPositionX: userPositionX,
      userPositionY: userPositionY,
      searchRadius: searchRadius,
      balanceOwner: balanceOwner,
      daysFromLastSurvey: daysFromLastSurvey,
      lastSurveyDateFrom: lastSurveyDateFrom,
      lastSurveyDateTo: lastSurveyDateTo,
      camerasExist: camerasExist,
      ignoreViolations: ignoreViolations,
      forCurrentUser: forCurrentUser,
      objectElementIds: objectElementIds,
      violationNameIds: violationNameIds,
      sourceId: sourceId,
      violationNum: violationNum,
      violationStatusIds: violationStatusIds,
      detectionDateFrom: detectionDateFrom,
      detectionDateTo: detectionDateTo,
      controlDateFrom: controlDateFrom,
      controlDateTo: controlDateTo,
      from: from,
      to: to,
      sort: sort,
    );
  }

// ignore: unused_element
  DepartmentControlObjectsRequest fromJson(Map<String, Object> json) {
    return DepartmentControlObjectsRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlObjectsRequest =
    _$DepartmentControlObjectsRequestTearOff();

/// @nodoc
mixin _$DepartmentControlObjectsRequest {
  int get dcObjectTypesIds;
  String get dcObjectKind;
  int get externalId;
  String get objectName;
  int get areaIds;
  int get districtIds;
  int get addressIds;
  bool get onlyNearObjects;
  double get userPositionX;
  double get userPositionY;
  int get searchRadius;
  String get balanceOwner;
  int get daysFromLastSurvey;
  DateTime get lastSurveyDateFrom;
  DateTime get lastSurveyDateTo;
  bool get camerasExist;
  bool get ignoreViolations;
  bool get forCurrentUser;
  int get objectElementIds;
  int get violationNameIds;
  int get sourceId;
  String get violationNum;
  int get violationStatusIds;
  DateTime get detectionDateFrom;
  DateTime get detectionDateTo;
  DateTime get controlDateFrom;
  DateTime get controlDateTo;
  int get from;
  int get to;
  String get sort;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlObjectsRequestCopyWith<DepartmentControlObjectsRequest>
      get copyWith;
}

/// @nodoc
abstract class $DepartmentControlObjectsRequestCopyWith<$Res> {
  factory $DepartmentControlObjectsRequestCopyWith(
          DepartmentControlObjectsRequest value,
          $Res Function(DepartmentControlObjectsRequest) then) =
      _$DepartmentControlObjectsRequestCopyWithImpl<$Res>;
  $Res call(
      {int dcObjectTypesIds,
      String dcObjectKind,
      int externalId,
      String objectName,
      int areaIds,
      int districtIds,
      int addressIds,
      bool onlyNearObjects,
      double userPositionX,
      double userPositionY,
      int searchRadius,
      String balanceOwner,
      int daysFromLastSurvey,
      DateTime lastSurveyDateFrom,
      DateTime lastSurveyDateTo,
      bool camerasExist,
      bool ignoreViolations,
      bool forCurrentUser,
      int objectElementIds,
      int violationNameIds,
      int sourceId,
      String violationNum,
      int violationStatusIds,
      DateTime detectionDateFrom,
      DateTime detectionDateTo,
      DateTime controlDateFrom,
      DateTime controlDateTo,
      int from,
      int to,
      String sort});
}

/// @nodoc
class _$DepartmentControlObjectsRequestCopyWithImpl<$Res>
    implements $DepartmentControlObjectsRequestCopyWith<$Res> {
  _$DepartmentControlObjectsRequestCopyWithImpl(this._value, this._then);

  final DepartmentControlObjectsRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlObjectsRequest) _then;

  @override
  $Res call({
    Object dcObjectTypesIds = freezed,
    Object dcObjectKind = freezed,
    Object externalId = freezed,
    Object objectName = freezed,
    Object areaIds = freezed,
    Object districtIds = freezed,
    Object addressIds = freezed,
    Object onlyNearObjects = freezed,
    Object userPositionX = freezed,
    Object userPositionY = freezed,
    Object searchRadius = freezed,
    Object balanceOwner = freezed,
    Object daysFromLastSurvey = freezed,
    Object lastSurveyDateFrom = freezed,
    Object lastSurveyDateTo = freezed,
    Object camerasExist = freezed,
    Object ignoreViolations = freezed,
    Object forCurrentUser = freezed,
    Object objectElementIds = freezed,
    Object violationNameIds = freezed,
    Object sourceId = freezed,
    Object violationNum = freezed,
    Object violationStatusIds = freezed,
    Object detectionDateFrom = freezed,
    Object detectionDateTo = freezed,
    Object controlDateFrom = freezed,
    Object controlDateTo = freezed,
    Object from = freezed,
    Object to = freezed,
    Object sort = freezed,
  }) {
    return _then(_value.copyWith(
      dcObjectTypesIds: dcObjectTypesIds == freezed
          ? _value.dcObjectTypesIds
          : dcObjectTypesIds as int,
      dcObjectKind: dcObjectKind == freezed
          ? _value.dcObjectKind
          : dcObjectKind as String,
      externalId: externalId == freezed ? _value.externalId : externalId as int,
      objectName:
          objectName == freezed ? _value.objectName : objectName as String,
      areaIds: areaIds == freezed ? _value.areaIds : areaIds as int,
      districtIds:
          districtIds == freezed ? _value.districtIds : districtIds as int,
      addressIds: addressIds == freezed ? _value.addressIds : addressIds as int,
      onlyNearObjects: onlyNearObjects == freezed
          ? _value.onlyNearObjects
          : onlyNearObjects as bool,
      userPositionX: userPositionX == freezed
          ? _value.userPositionX
          : userPositionX as double,
      userPositionY: userPositionY == freezed
          ? _value.userPositionY
          : userPositionY as double,
      searchRadius:
          searchRadius == freezed ? _value.searchRadius : searchRadius as int,
      balanceOwner: balanceOwner == freezed
          ? _value.balanceOwner
          : balanceOwner as String,
      daysFromLastSurvey: daysFromLastSurvey == freezed
          ? _value.daysFromLastSurvey
          : daysFromLastSurvey as int,
      lastSurveyDateFrom: lastSurveyDateFrom == freezed
          ? _value.lastSurveyDateFrom
          : lastSurveyDateFrom as DateTime,
      lastSurveyDateTo: lastSurveyDateTo == freezed
          ? _value.lastSurveyDateTo
          : lastSurveyDateTo as DateTime,
      camerasExist:
          camerasExist == freezed ? _value.camerasExist : camerasExist as bool,
      ignoreViolations: ignoreViolations == freezed
          ? _value.ignoreViolations
          : ignoreViolations as bool,
      forCurrentUser: forCurrentUser == freezed
          ? _value.forCurrentUser
          : forCurrentUser as bool,
      objectElementIds: objectElementIds == freezed
          ? _value.objectElementIds
          : objectElementIds as int,
      violationNameIds: violationNameIds == freezed
          ? _value.violationNameIds
          : violationNameIds as int,
      sourceId: sourceId == freezed ? _value.sourceId : sourceId as int,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      violationStatusIds: violationStatusIds == freezed
          ? _value.violationStatusIds
          : violationStatusIds as int,
      detectionDateFrom: detectionDateFrom == freezed
          ? _value.detectionDateFrom
          : detectionDateFrom as DateTime,
      detectionDateTo: detectionDateTo == freezed
          ? _value.detectionDateTo
          : detectionDateTo as DateTime,
      controlDateFrom: controlDateFrom == freezed
          ? _value.controlDateFrom
          : controlDateFrom as DateTime,
      controlDateTo: controlDateTo == freezed
          ? _value.controlDateTo
          : controlDateTo as DateTime,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      sort: sort == freezed ? _value.sort : sort as String,
    ));
  }
}

/// @nodoc
abstract class _$DepartmentControlObjectsRequestCopyWith<$Res>
    implements $DepartmentControlObjectsRequestCopyWith<$Res> {
  factory _$DepartmentControlObjectsRequestCopyWith(
          _DepartmentControlObjectsRequest value,
          $Res Function(_DepartmentControlObjectsRequest) then) =
      __$DepartmentControlObjectsRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int dcObjectTypesIds,
      String dcObjectKind,
      int externalId,
      String objectName,
      int areaIds,
      int districtIds,
      int addressIds,
      bool onlyNearObjects,
      double userPositionX,
      double userPositionY,
      int searchRadius,
      String balanceOwner,
      int daysFromLastSurvey,
      DateTime lastSurveyDateFrom,
      DateTime lastSurveyDateTo,
      bool camerasExist,
      bool ignoreViolations,
      bool forCurrentUser,
      int objectElementIds,
      int violationNameIds,
      int sourceId,
      String violationNum,
      int violationStatusIds,
      DateTime detectionDateFrom,
      DateTime detectionDateTo,
      DateTime controlDateFrom,
      DateTime controlDateTo,
      int from,
      int to,
      String sort});
}

/// @nodoc
class __$DepartmentControlObjectsRequestCopyWithImpl<$Res>
    extends _$DepartmentControlObjectsRequestCopyWithImpl<$Res>
    implements _$DepartmentControlObjectsRequestCopyWith<$Res> {
  __$DepartmentControlObjectsRequestCopyWithImpl(
      _DepartmentControlObjectsRequest _value,
      $Res Function(_DepartmentControlObjectsRequest) _then)
      : super(_value, (v) => _then(v as _DepartmentControlObjectsRequest));

  @override
  _DepartmentControlObjectsRequest get _value =>
      super._value as _DepartmentControlObjectsRequest;

  @override
  $Res call({
    Object dcObjectTypesIds = freezed,
    Object dcObjectKind = freezed,
    Object externalId = freezed,
    Object objectName = freezed,
    Object areaIds = freezed,
    Object districtIds = freezed,
    Object addressIds = freezed,
    Object onlyNearObjects = freezed,
    Object userPositionX = freezed,
    Object userPositionY = freezed,
    Object searchRadius = freezed,
    Object balanceOwner = freezed,
    Object daysFromLastSurvey = freezed,
    Object lastSurveyDateFrom = freezed,
    Object lastSurveyDateTo = freezed,
    Object camerasExist = freezed,
    Object ignoreViolations = freezed,
    Object forCurrentUser = freezed,
    Object objectElementIds = freezed,
    Object violationNameIds = freezed,
    Object sourceId = freezed,
    Object violationNum = freezed,
    Object violationStatusIds = freezed,
    Object detectionDateFrom = freezed,
    Object detectionDateTo = freezed,
    Object controlDateFrom = freezed,
    Object controlDateTo = freezed,
    Object from = freezed,
    Object to = freezed,
    Object sort = freezed,
  }) {
    return _then(_DepartmentControlObjectsRequest(
      dcObjectTypesIds: dcObjectTypesIds == freezed
          ? _value.dcObjectTypesIds
          : dcObjectTypesIds as int,
      dcObjectKind: dcObjectKind == freezed
          ? _value.dcObjectKind
          : dcObjectKind as String,
      externalId: externalId == freezed ? _value.externalId : externalId as int,
      objectName:
          objectName == freezed ? _value.objectName : objectName as String,
      areaIds: areaIds == freezed ? _value.areaIds : areaIds as int,
      districtIds:
          districtIds == freezed ? _value.districtIds : districtIds as int,
      addressIds: addressIds == freezed ? _value.addressIds : addressIds as int,
      onlyNearObjects: onlyNearObjects == freezed
          ? _value.onlyNearObjects
          : onlyNearObjects as bool,
      userPositionX: userPositionX == freezed
          ? _value.userPositionX
          : userPositionX as double,
      userPositionY: userPositionY == freezed
          ? _value.userPositionY
          : userPositionY as double,
      searchRadius:
          searchRadius == freezed ? _value.searchRadius : searchRadius as int,
      balanceOwner: balanceOwner == freezed
          ? _value.balanceOwner
          : balanceOwner as String,
      daysFromLastSurvey: daysFromLastSurvey == freezed
          ? _value.daysFromLastSurvey
          : daysFromLastSurvey as int,
      lastSurveyDateFrom: lastSurveyDateFrom == freezed
          ? _value.lastSurveyDateFrom
          : lastSurveyDateFrom as DateTime,
      lastSurveyDateTo: lastSurveyDateTo == freezed
          ? _value.lastSurveyDateTo
          : lastSurveyDateTo as DateTime,
      camerasExist:
          camerasExist == freezed ? _value.camerasExist : camerasExist as bool,
      ignoreViolations: ignoreViolations == freezed
          ? _value.ignoreViolations
          : ignoreViolations as bool,
      forCurrentUser: forCurrentUser == freezed
          ? _value.forCurrentUser
          : forCurrentUser as bool,
      objectElementIds: objectElementIds == freezed
          ? _value.objectElementIds
          : objectElementIds as int,
      violationNameIds: violationNameIds == freezed
          ? _value.violationNameIds
          : violationNameIds as int,
      sourceId: sourceId == freezed ? _value.sourceId : sourceId as int,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      violationStatusIds: violationStatusIds == freezed
          ? _value.violationStatusIds
          : violationStatusIds as int,
      detectionDateFrom: detectionDateFrom == freezed
          ? _value.detectionDateFrom
          : detectionDateFrom as DateTime,
      detectionDateTo: detectionDateTo == freezed
          ? _value.detectionDateTo
          : detectionDateTo as DateTime,
      controlDateFrom: controlDateFrom == freezed
          ? _value.controlDateFrom
          : controlDateFrom as DateTime,
      controlDateTo: controlDateTo == freezed
          ? _value.controlDateTo
          : controlDateTo as DateTime,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      sort: sort == freezed ? _value.sort : sort as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlObjectsRequest
    implements _DepartmentControlObjectsRequest {
  const _$_DepartmentControlObjectsRequest(
      {this.dcObjectTypesIds,
      this.dcObjectKind,
      this.externalId,
      this.objectName,
      this.areaIds,
      this.districtIds,
      this.addressIds,
      this.onlyNearObjects,
      this.userPositionX,
      this.userPositionY,
      this.searchRadius,
      this.balanceOwner,
      this.daysFromLastSurvey,
      this.lastSurveyDateFrom,
      this.lastSurveyDateTo,
      this.camerasExist,
      this.ignoreViolations,
      this.forCurrentUser,
      this.objectElementIds,
      this.violationNameIds,
      this.sourceId,
      this.violationNum,
      this.violationStatusIds,
      this.detectionDateFrom,
      this.detectionDateTo,
      this.controlDateFrom,
      this.controlDateTo,
      this.from,
      this.to,
      this.sort});

  factory _$_DepartmentControlObjectsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlObjectsRequestFromJson(json);

  @override
  final int dcObjectTypesIds;
  @override
  final String dcObjectKind;
  @override
  final int externalId;
  @override
  final String objectName;
  @override
  final int areaIds;
  @override
  final int districtIds;
  @override
  final int addressIds;
  @override
  final bool onlyNearObjects;
  @override
  final double userPositionX;
  @override
  final double userPositionY;
  @override
  final int searchRadius;
  @override
  final String balanceOwner;
  @override
  final int daysFromLastSurvey;
  @override
  final DateTime lastSurveyDateFrom;
  @override
  final DateTime lastSurveyDateTo;
  @override
  final bool camerasExist;
  @override
  final bool ignoreViolations;
  @override
  final bool forCurrentUser;
  @override
  final int objectElementIds;
  @override
  final int violationNameIds;
  @override
  final int sourceId;
  @override
  final String violationNum;
  @override
  final int violationStatusIds;
  @override
  final DateTime detectionDateFrom;
  @override
  final DateTime detectionDateTo;
  @override
  final DateTime controlDateFrom;
  @override
  final DateTime controlDateTo;
  @override
  final int from;
  @override
  final int to;
  @override
  final String sort;

  @override
  String toString() {
    return 'DepartmentControlObjectsRequest(dcObjectTypesIds: $dcObjectTypesIds, dcObjectKind: $dcObjectKind, externalId: $externalId, objectName: $objectName, areaIds: $areaIds, districtIds: $districtIds, addressIds: $addressIds, onlyNearObjects: $onlyNearObjects, userPositionX: $userPositionX, userPositionY: $userPositionY, searchRadius: $searchRadius, balanceOwner: $balanceOwner, daysFromLastSurvey: $daysFromLastSurvey, lastSurveyDateFrom: $lastSurveyDateFrom, lastSurveyDateTo: $lastSurveyDateTo, camerasExist: $camerasExist, ignoreViolations: $ignoreViolations, forCurrentUser: $forCurrentUser, objectElementIds: $objectElementIds, violationNameIds: $violationNameIds, sourceId: $sourceId, violationNum: $violationNum, violationStatusIds: $violationStatusIds, detectionDateFrom: $detectionDateFrom, detectionDateTo: $detectionDateTo, controlDateFrom: $controlDateFrom, controlDateTo: $controlDateTo, from: $from, to: $to, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlObjectsRequest &&
            (identical(other.dcObjectTypesIds, dcObjectTypesIds) ||
                const DeepCollectionEquality()
                    .equals(other.dcObjectTypesIds, dcObjectTypesIds)) &&
            (identical(other.dcObjectKind, dcObjectKind) ||
                const DeepCollectionEquality()
                    .equals(other.dcObjectKind, dcObjectKind)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)) &&
            (identical(other.objectName, objectName) ||
                const DeepCollectionEquality()
                    .equals(other.objectName, objectName)) &&
            (identical(other.areaIds, areaIds) ||
                const DeepCollectionEquality()
                    .equals(other.areaIds, areaIds)) &&
            (identical(other.districtIds, districtIds) ||
                const DeepCollectionEquality()
                    .equals(other.districtIds, districtIds)) &&
            (identical(other.addressIds, addressIds) ||
                const DeepCollectionEquality()
                    .equals(other.addressIds, addressIds)) &&
            (identical(other.onlyNearObjects, onlyNearObjects) ||
                const DeepCollectionEquality()
                    .equals(other.onlyNearObjects, onlyNearObjects)) &&
            (identical(other.userPositionX, userPositionX) ||
                const DeepCollectionEquality()
                    .equals(other.userPositionX, userPositionX)) &&
            (identical(other.userPositionY, userPositionY) ||
                const DeepCollectionEquality()
                    .equals(other.userPositionY, userPositionY)) &&
            (identical(other.searchRadius, searchRadius) ||
                const DeepCollectionEquality()
                    .equals(other.searchRadius, searchRadius)) &&
            (identical(other.balanceOwner, balanceOwner) ||
                const DeepCollectionEquality()
                    .equals(other.balanceOwner, balanceOwner)) &&
            (identical(other.daysFromLastSurvey, daysFromLastSurvey) ||
                const DeepCollectionEquality()
                    .equals(other.daysFromLastSurvey, daysFromLastSurvey)) &&
            (identical(other.lastSurveyDateFrom, lastSurveyDateFrom) ||
                const DeepCollectionEquality()
                    .equals(other.lastSurveyDateFrom, lastSurveyDateFrom)) &&
            (identical(other.lastSurveyDateTo, lastSurveyDateTo) ||
                const DeepCollectionEquality()
                    .equals(other.lastSurveyDateTo, lastSurveyDateTo)) &&
            (identical(other.camerasExist, camerasExist) ||
                const DeepCollectionEquality()
                    .equals(other.camerasExist, camerasExist)) &&
            (identical(other.ignoreViolations, ignoreViolations) ||
                const DeepCollectionEquality()
                    .equals(other.ignoreViolations, ignoreViolations)) &&
            (identical(other.forCurrentUser, forCurrentUser) ||
                const DeepCollectionEquality()
                    .equals(other.forCurrentUser, forCurrentUser)) &&
            (identical(other.objectElementIds, objectElementIds) ||
                const DeepCollectionEquality()
                    .equals(other.objectElementIds, objectElementIds)) &&
            (identical(other.violationNameIds, violationNameIds) ||
                const DeepCollectionEquality()
                    .equals(other.violationNameIds, violationNameIds)) &&
            (identical(other.sourceId, sourceId) ||
                const DeepCollectionEquality()
                    .equals(other.sourceId, sourceId)) &&
            (identical(other.violationNum, violationNum) ||
                const DeepCollectionEquality().equals(other.violationNum, violationNum)) &&
            (identical(other.violationStatusIds, violationStatusIds) || const DeepCollectionEquality().equals(other.violationStatusIds, violationStatusIds)) &&
            (identical(other.detectionDateFrom, detectionDateFrom) || const DeepCollectionEquality().equals(other.detectionDateFrom, detectionDateFrom)) &&
            (identical(other.detectionDateTo, detectionDateTo) || const DeepCollectionEquality().equals(other.detectionDateTo, detectionDateTo)) &&
            (identical(other.controlDateFrom, controlDateFrom) || const DeepCollectionEquality().equals(other.controlDateFrom, controlDateFrom)) &&
            (identical(other.controlDateTo, controlDateTo) || const DeepCollectionEquality().equals(other.controlDateTo, controlDateTo)) &&
            (identical(other.from, from) || const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) || const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.sort, sort) || const DeepCollectionEquality().equals(other.sort, sort)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dcObjectTypesIds) ^
      const DeepCollectionEquality().hash(dcObjectKind) ^
      const DeepCollectionEquality().hash(externalId) ^
      const DeepCollectionEquality().hash(objectName) ^
      const DeepCollectionEquality().hash(areaIds) ^
      const DeepCollectionEquality().hash(districtIds) ^
      const DeepCollectionEquality().hash(addressIds) ^
      const DeepCollectionEquality().hash(onlyNearObjects) ^
      const DeepCollectionEquality().hash(userPositionX) ^
      const DeepCollectionEquality().hash(userPositionY) ^
      const DeepCollectionEquality().hash(searchRadius) ^
      const DeepCollectionEquality().hash(balanceOwner) ^
      const DeepCollectionEquality().hash(daysFromLastSurvey) ^
      const DeepCollectionEquality().hash(lastSurveyDateFrom) ^
      const DeepCollectionEquality().hash(lastSurveyDateTo) ^
      const DeepCollectionEquality().hash(camerasExist) ^
      const DeepCollectionEquality().hash(ignoreViolations) ^
      const DeepCollectionEquality().hash(forCurrentUser) ^
      const DeepCollectionEquality().hash(objectElementIds) ^
      const DeepCollectionEquality().hash(violationNameIds) ^
      const DeepCollectionEquality().hash(sourceId) ^
      const DeepCollectionEquality().hash(violationNum) ^
      const DeepCollectionEquality().hash(violationStatusIds) ^
      const DeepCollectionEquality().hash(detectionDateFrom) ^
      const DeepCollectionEquality().hash(detectionDateTo) ^
      const DeepCollectionEquality().hash(controlDateFrom) ^
      const DeepCollectionEquality().hash(controlDateTo) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(sort);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlObjectsRequestCopyWith<_DepartmentControlObjectsRequest>
      get copyWith => __$DepartmentControlObjectsRequestCopyWithImpl<
          _DepartmentControlObjectsRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlObjectsRequestToJson(this);
  }
}

abstract class _DepartmentControlObjectsRequest
    implements DepartmentControlObjectsRequest {
  const factory _DepartmentControlObjectsRequest(
      {int dcObjectTypesIds,
      String dcObjectKind,
      int externalId,
      String objectName,
      int areaIds,
      int districtIds,
      int addressIds,
      bool onlyNearObjects,
      double userPositionX,
      double userPositionY,
      int searchRadius,
      String balanceOwner,
      int daysFromLastSurvey,
      DateTime lastSurveyDateFrom,
      DateTime lastSurveyDateTo,
      bool camerasExist,
      bool ignoreViolations,
      bool forCurrentUser,
      int objectElementIds,
      int violationNameIds,
      int sourceId,
      String violationNum,
      int violationStatusIds,
      DateTime detectionDateFrom,
      DateTime detectionDateTo,
      DateTime controlDateFrom,
      DateTime controlDateTo,
      int from,
      int to,
      String sort}) = _$_DepartmentControlObjectsRequest;

  factory _DepartmentControlObjectsRequest.fromJson(Map<String, dynamic> json) =
      _$_DepartmentControlObjectsRequest.fromJson;

  @override
  int get dcObjectTypesIds;
  @override
  String get dcObjectKind;
  @override
  int get externalId;
  @override
  String get objectName;
  @override
  int get areaIds;
  @override
  int get districtIds;
  @override
  int get addressIds;
  @override
  bool get onlyNearObjects;
  @override
  double get userPositionX;
  @override
  double get userPositionY;
  @override
  int get searchRadius;
  @override
  String get balanceOwner;
  @override
  int get daysFromLastSurvey;
  @override
  DateTime get lastSurveyDateFrom;
  @override
  DateTime get lastSurveyDateTo;
  @override
  bool get camerasExist;
  @override
  bool get ignoreViolations;
  @override
  bool get forCurrentUser;
  @override
  int get objectElementIds;
  @override
  int get violationNameIds;
  @override
  int get sourceId;
  @override
  String get violationNum;
  @override
  int get violationStatusIds;
  @override
  DateTime get detectionDateFrom;
  @override
  DateTime get detectionDateTo;
  @override
  DateTime get controlDateFrom;
  @override
  DateTime get controlDateTo;
  @override
  int get from;
  @override
  int get to;
  @override
  String get sort;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlObjectsRequestCopyWith<_DepartmentControlObjectsRequest>
      get copyWith;
}

DepartmentControlSearchResultsRequest
    _$DepartmentControlSearchResultsRequestFromJson(Map<String, dynamic> json) {
  return _DepartmentControlSearchResultsRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlSearchResultsRequestTearOff {
  const _$DepartmentControlSearchResultsRequestTearOff();

// ignore: unused_element
  _DepartmentControlSearchResultsRequest call(int dcObjectId,
      {bool forCurrentUser,
      DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      List<int> dcViolationStatusIds,
      int dcViolationTypeId,
      int dcViolationKindId,
      int sourceId,
      int from,
      int to,
      List<String> sort}) {
    return _DepartmentControlSearchResultsRequest(
      dcObjectId,
      forCurrentUser: forCurrentUser,
      surveyDateFrom: surveyDateFrom,
      surveyDateTo: surveyDateTo,
      violationExists: violationExists,
      violationNum: violationNum,
      dcViolationStatusIds: dcViolationStatusIds,
      dcViolationTypeId: dcViolationTypeId,
      dcViolationKindId: dcViolationKindId,
      sourceId: sourceId,
      from: from,
      to: to,
      sort: sort,
    );
  }

// ignore: unused_element
  DepartmentControlSearchResultsRequest fromJson(Map<String, Object> json) {
    return DepartmentControlSearchResultsRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlSearchResultsRequest =
    _$DepartmentControlSearchResultsRequestTearOff();

/// @nodoc
mixin _$DepartmentControlSearchResultsRequest {
  int get dcObjectId;
  bool get forCurrentUser;
  DateTime get surveyDateFrom;
  DateTime get surveyDateTo;
  bool get violationExists;
  String get violationNum;
  List<int> get dcViolationStatusIds;
  int get dcViolationTypeId;
  int get dcViolationKindId;
  int get sourceId;
  int get from;
  int get to;
  List<String> get sort;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlSearchResultsRequestCopyWith<
      DepartmentControlSearchResultsRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlSearchResultsRequestCopyWith<$Res> {
  factory $DepartmentControlSearchResultsRequestCopyWith(
          DepartmentControlSearchResultsRequest value,
          $Res Function(DepartmentControlSearchResultsRequest) then) =
      _$DepartmentControlSearchResultsRequestCopyWithImpl<$Res>;
  $Res call(
      {int dcObjectId,
      bool forCurrentUser,
      DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      List<int> dcViolationStatusIds,
      int dcViolationTypeId,
      int dcViolationKindId,
      int sourceId,
      int from,
      int to,
      List<String> sort});
}

/// @nodoc
class _$DepartmentControlSearchResultsRequestCopyWithImpl<$Res>
    implements $DepartmentControlSearchResultsRequestCopyWith<$Res> {
  _$DepartmentControlSearchResultsRequestCopyWithImpl(this._value, this._then);

  final DepartmentControlSearchResultsRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlSearchResultsRequest) _then;

  @override
  $Res call({
    Object dcObjectId = freezed,
    Object forCurrentUser = freezed,
    Object surveyDateFrom = freezed,
    Object surveyDateTo = freezed,
    Object violationExists = freezed,
    Object violationNum = freezed,
    Object dcViolationStatusIds = freezed,
    Object dcViolationTypeId = freezed,
    Object dcViolationKindId = freezed,
    Object sourceId = freezed,
    Object from = freezed,
    Object to = freezed,
    Object sort = freezed,
  }) {
    return _then(_value.copyWith(
      dcObjectId: dcObjectId == freezed ? _value.dcObjectId : dcObjectId as int,
      forCurrentUser: forCurrentUser == freezed
          ? _value.forCurrentUser
          : forCurrentUser as bool,
      surveyDateFrom: surveyDateFrom == freezed
          ? _value.surveyDateFrom
          : surveyDateFrom as DateTime,
      surveyDateTo: surveyDateTo == freezed
          ? _value.surveyDateTo
          : surveyDateTo as DateTime,
      violationExists: violationExists == freezed
          ? _value.violationExists
          : violationExists as bool,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      dcViolationStatusIds: dcViolationStatusIds == freezed
          ? _value.dcViolationStatusIds
          : dcViolationStatusIds as List<int>,
      dcViolationTypeId: dcViolationTypeId == freezed
          ? _value.dcViolationTypeId
          : dcViolationTypeId as int,
      dcViolationKindId: dcViolationKindId == freezed
          ? _value.dcViolationKindId
          : dcViolationKindId as int,
      sourceId: sourceId == freezed ? _value.sourceId : sourceId as int,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      sort: sort == freezed ? _value.sort : sort as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$DepartmentControlSearchResultsRequestCopyWith<$Res>
    implements $DepartmentControlSearchResultsRequestCopyWith<$Res> {
  factory _$DepartmentControlSearchResultsRequestCopyWith(
          _DepartmentControlSearchResultsRequest value,
          $Res Function(_DepartmentControlSearchResultsRequest) then) =
      __$DepartmentControlSearchResultsRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {int dcObjectId,
      bool forCurrentUser,
      DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      List<int> dcViolationStatusIds,
      int dcViolationTypeId,
      int dcViolationKindId,
      int sourceId,
      int from,
      int to,
      List<String> sort});
}

/// @nodoc
class __$DepartmentControlSearchResultsRequestCopyWithImpl<$Res>
    extends _$DepartmentControlSearchResultsRequestCopyWithImpl<$Res>
    implements _$DepartmentControlSearchResultsRequestCopyWith<$Res> {
  __$DepartmentControlSearchResultsRequestCopyWithImpl(
      _DepartmentControlSearchResultsRequest _value,
      $Res Function(_DepartmentControlSearchResultsRequest) _then)
      : super(
            _value, (v) => _then(v as _DepartmentControlSearchResultsRequest));

  @override
  _DepartmentControlSearchResultsRequest get _value =>
      super._value as _DepartmentControlSearchResultsRequest;

  @override
  $Res call({
    Object dcObjectId = freezed,
    Object forCurrentUser = freezed,
    Object surveyDateFrom = freezed,
    Object surveyDateTo = freezed,
    Object violationExists = freezed,
    Object violationNum = freezed,
    Object dcViolationStatusIds = freezed,
    Object dcViolationTypeId = freezed,
    Object dcViolationKindId = freezed,
    Object sourceId = freezed,
    Object from = freezed,
    Object to = freezed,
    Object sort = freezed,
  }) {
    return _then(_DepartmentControlSearchResultsRequest(
      dcObjectId == freezed ? _value.dcObjectId : dcObjectId as int,
      forCurrentUser: forCurrentUser == freezed
          ? _value.forCurrentUser
          : forCurrentUser as bool,
      surveyDateFrom: surveyDateFrom == freezed
          ? _value.surveyDateFrom
          : surveyDateFrom as DateTime,
      surveyDateTo: surveyDateTo == freezed
          ? _value.surveyDateTo
          : surveyDateTo as DateTime,
      violationExists: violationExists == freezed
          ? _value.violationExists
          : violationExists as bool,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      dcViolationStatusIds: dcViolationStatusIds == freezed
          ? _value.dcViolationStatusIds
          : dcViolationStatusIds as List<int>,
      dcViolationTypeId: dcViolationTypeId == freezed
          ? _value.dcViolationTypeId
          : dcViolationTypeId as int,
      dcViolationKindId: dcViolationKindId == freezed
          ? _value.dcViolationKindId
          : dcViolationKindId as int,
      sourceId: sourceId == freezed ? _value.sourceId : sourceId as int,
      from: from == freezed ? _value.from : from as int,
      to: to == freezed ? _value.to : to as int,
      sort: sort == freezed ? _value.sort : sort as List<String>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlSearchResultsRequest
    implements _DepartmentControlSearchResultsRequest {
  const _$_DepartmentControlSearchResultsRequest(this.dcObjectId,
      {this.forCurrentUser,
      this.surveyDateFrom,
      this.surveyDateTo,
      this.violationExists,
      this.violationNum,
      this.dcViolationStatusIds,
      this.dcViolationTypeId,
      this.dcViolationKindId,
      this.sourceId,
      this.from,
      this.to,
      this.sort})
      : assert(dcObjectId != null);

  factory _$_DepartmentControlSearchResultsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlSearchResultsRequestFromJson(json);

  @override
  final int dcObjectId;
  @override
  final bool forCurrentUser;
  @override
  final DateTime surveyDateFrom;
  @override
  final DateTime surveyDateTo;
  @override
  final bool violationExists;
  @override
  final String violationNum;
  @override
  final List<int> dcViolationStatusIds;
  @override
  final int dcViolationTypeId;
  @override
  final int dcViolationKindId;
  @override
  final int sourceId;
  @override
  final int from;
  @override
  final int to;
  @override
  final List<String> sort;

  @override
  String toString() {
    return 'DepartmentControlSearchResultsRequest(dcObjectId: $dcObjectId, forCurrentUser: $forCurrentUser, surveyDateFrom: $surveyDateFrom, surveyDateTo: $surveyDateTo, violationExists: $violationExists, violationNum: $violationNum, dcViolationStatusIds: $dcViolationStatusIds, dcViolationTypeId: $dcViolationTypeId, dcViolationKindId: $dcViolationKindId, sourceId: $sourceId, from: $from, to: $to, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlSearchResultsRequest &&
            (identical(other.dcObjectId, dcObjectId) ||
                const DeepCollectionEquality()
                    .equals(other.dcObjectId, dcObjectId)) &&
            (identical(other.forCurrentUser, forCurrentUser) ||
                const DeepCollectionEquality()
                    .equals(other.forCurrentUser, forCurrentUser)) &&
            (identical(other.surveyDateFrom, surveyDateFrom) ||
                const DeepCollectionEquality()
                    .equals(other.surveyDateFrom, surveyDateFrom)) &&
            (identical(other.surveyDateTo, surveyDateTo) ||
                const DeepCollectionEquality()
                    .equals(other.surveyDateTo, surveyDateTo)) &&
            (identical(other.violationExists, violationExists) ||
                const DeepCollectionEquality()
                    .equals(other.violationExists, violationExists)) &&
            (identical(other.violationNum, violationNum) ||
                const DeepCollectionEquality()
                    .equals(other.violationNum, violationNum)) &&
            (identical(other.dcViolationStatusIds, dcViolationStatusIds) ||
                const DeepCollectionEquality().equals(
                    other.dcViolationStatusIds, dcViolationStatusIds)) &&
            (identical(other.dcViolationTypeId, dcViolationTypeId) ||
                const DeepCollectionEquality()
                    .equals(other.dcViolationTypeId, dcViolationTypeId)) &&
            (identical(other.dcViolationKindId, dcViolationKindId) ||
                const DeepCollectionEquality()
                    .equals(other.dcViolationKindId, dcViolationKindId)) &&
            (identical(other.sourceId, sourceId) ||
                const DeepCollectionEquality()
                    .equals(other.sourceId, sourceId)) &&
            (identical(other.from, from) ||
                const DeepCollectionEquality().equals(other.from, from)) &&
            (identical(other.to, to) ||
                const DeepCollectionEquality().equals(other.to, to)) &&
            (identical(other.sort, sort) ||
                const DeepCollectionEquality().equals(other.sort, sort)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dcObjectId) ^
      const DeepCollectionEquality().hash(forCurrentUser) ^
      const DeepCollectionEquality().hash(surveyDateFrom) ^
      const DeepCollectionEquality().hash(surveyDateTo) ^
      const DeepCollectionEquality().hash(violationExists) ^
      const DeepCollectionEquality().hash(violationNum) ^
      const DeepCollectionEquality().hash(dcViolationStatusIds) ^
      const DeepCollectionEquality().hash(dcViolationTypeId) ^
      const DeepCollectionEquality().hash(dcViolationKindId) ^
      const DeepCollectionEquality().hash(sourceId) ^
      const DeepCollectionEquality().hash(from) ^
      const DeepCollectionEquality().hash(to) ^
      const DeepCollectionEquality().hash(sort);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlSearchResultsRequestCopyWith<
          _DepartmentControlSearchResultsRequest>
      get copyWith => __$DepartmentControlSearchResultsRequestCopyWithImpl<
          _DepartmentControlSearchResultsRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlSearchResultsRequestToJson(this);
  }
}

abstract class _DepartmentControlSearchResultsRequest
    implements DepartmentControlSearchResultsRequest {
  const factory _DepartmentControlSearchResultsRequest(int dcObjectId,
      {bool forCurrentUser,
      DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      List<int> dcViolationStatusIds,
      int dcViolationTypeId,
      int dcViolationKindId,
      int sourceId,
      int from,
      int to,
      List<String> sort}) = _$_DepartmentControlSearchResultsRequest;

  factory _DepartmentControlSearchResultsRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlSearchResultsRequest.fromJson;

  @override
  int get dcObjectId;
  @override
  bool get forCurrentUser;
  @override
  DateTime get surveyDateFrom;
  @override
  DateTime get surveyDateTo;
  @override
  bool get violationExists;
  @override
  String get violationNum;
  @override
  List<int> get dcViolationStatusIds;
  @override
  int get dcViolationTypeId;
  @override
  int get dcViolationKindId;
  @override
  int get sourceId;
  @override
  int get from;
  @override
  int get to;
  @override
  List<String> get sort;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlSearchResultsRequestCopyWith<
      _DepartmentControlSearchResultsRequest> get copyWith;
}

DepartmentControlSearchResultByIdsRequest
    _$DepartmentControlSearchResultByIdsRequestFromJson(
        Map<String, dynamic> json) {
  return _DepartmentControlSearchResultByIdsRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlSearchResultByIdsRequestTearOff {
  const _$DepartmentControlSearchResultByIdsRequestTearOff();

// ignore: unused_element
  _DepartmentControlSearchResultByIdsRequest call(
      int dcObjectId, int dcControlResultId) {
    return _DepartmentControlSearchResultByIdsRequest(
      dcObjectId,
      dcControlResultId,
    );
  }

// ignore: unused_element
  DepartmentControlSearchResultByIdsRequest fromJson(Map<String, Object> json) {
    return DepartmentControlSearchResultByIdsRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlSearchResultByIdsRequest =
    _$DepartmentControlSearchResultByIdsRequestTearOff();

/// @nodoc
mixin _$DepartmentControlSearchResultByIdsRequest {
  int get dcObjectId;
  int get dcControlResultId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlSearchResultByIdsRequestCopyWith<
      DepartmentControlSearchResultByIdsRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlSearchResultByIdsRequestCopyWith<$Res> {
  factory $DepartmentControlSearchResultByIdsRequestCopyWith(
          DepartmentControlSearchResultByIdsRequest value,
          $Res Function(DepartmentControlSearchResultByIdsRequest) then) =
      _$DepartmentControlSearchResultByIdsRequestCopyWithImpl<$Res>;
  $Res call({int dcObjectId, int dcControlResultId});
}

/// @nodoc
class _$DepartmentControlSearchResultByIdsRequestCopyWithImpl<$Res>
    implements $DepartmentControlSearchResultByIdsRequestCopyWith<$Res> {
  _$DepartmentControlSearchResultByIdsRequestCopyWithImpl(
      this._value, this._then);

  final DepartmentControlSearchResultByIdsRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlSearchResultByIdsRequest) _then;

  @override
  $Res call({
    Object dcObjectId = freezed,
    Object dcControlResultId = freezed,
  }) {
    return _then(_value.copyWith(
      dcObjectId: dcObjectId == freezed ? _value.dcObjectId : dcObjectId as int,
      dcControlResultId: dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
    ));
  }
}

/// @nodoc
abstract class _$DepartmentControlSearchResultByIdsRequestCopyWith<$Res>
    implements $DepartmentControlSearchResultByIdsRequestCopyWith<$Res> {
  factory _$DepartmentControlSearchResultByIdsRequestCopyWith(
          _DepartmentControlSearchResultByIdsRequest value,
          $Res Function(_DepartmentControlSearchResultByIdsRequest) then) =
      __$DepartmentControlSearchResultByIdsRequestCopyWithImpl<$Res>;
  @override
  $Res call({int dcObjectId, int dcControlResultId});
}

/// @nodoc
class __$DepartmentControlSearchResultByIdsRequestCopyWithImpl<$Res>
    extends _$DepartmentControlSearchResultByIdsRequestCopyWithImpl<$Res>
    implements _$DepartmentControlSearchResultByIdsRequestCopyWith<$Res> {
  __$DepartmentControlSearchResultByIdsRequestCopyWithImpl(
      _DepartmentControlSearchResultByIdsRequest _value,
      $Res Function(_DepartmentControlSearchResultByIdsRequest) _then)
      : super(_value,
            (v) => _then(v as _DepartmentControlSearchResultByIdsRequest));

  @override
  _DepartmentControlSearchResultByIdsRequest get _value =>
      super._value as _DepartmentControlSearchResultByIdsRequest;

  @override
  $Res call({
    Object dcObjectId = freezed,
    Object dcControlResultId = freezed,
  }) {
    return _then(_DepartmentControlSearchResultByIdsRequest(
      dcObjectId == freezed ? _value.dcObjectId : dcObjectId as int,
      dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlSearchResultByIdsRequest
    implements _DepartmentControlSearchResultByIdsRequest {
  const _$_DepartmentControlSearchResultByIdsRequest(
      this.dcObjectId, this.dcControlResultId)
      : assert(dcObjectId != null),
        assert(dcControlResultId != null);

  factory _$_DepartmentControlSearchResultByIdsRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlSearchResultByIdsRequestFromJson(json);

  @override
  final int dcObjectId;
  @override
  final int dcControlResultId;

  @override
  String toString() {
    return 'DepartmentControlSearchResultByIdsRequest(dcObjectId: $dcObjectId, dcControlResultId: $dcControlResultId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlSearchResultByIdsRequest &&
            (identical(other.dcObjectId, dcObjectId) ||
                const DeepCollectionEquality()
                    .equals(other.dcObjectId, dcObjectId)) &&
            (identical(other.dcControlResultId, dcControlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.dcControlResultId, dcControlResultId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dcObjectId) ^
      const DeepCollectionEquality().hash(dcControlResultId);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlSearchResultByIdsRequestCopyWith<
          _DepartmentControlSearchResultByIdsRequest>
      get copyWith => __$DepartmentControlSearchResultByIdsRequestCopyWithImpl<
          _DepartmentControlSearchResultByIdsRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlSearchResultByIdsRequestToJson(this);
  }
}

abstract class _DepartmentControlSearchResultByIdsRequest
    implements DepartmentControlSearchResultByIdsRequest {
  const factory _DepartmentControlSearchResultByIdsRequest(
          int dcObjectId, int dcControlResultId) =
      _$_DepartmentControlSearchResultByIdsRequest;

  factory _DepartmentControlSearchResultByIdsRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlSearchResultByIdsRequest.fromJson;

  @override
  int get dcObjectId;
  @override
  int get dcControlResultId;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlSearchResultByIdsRequestCopyWith<
      _DepartmentControlSearchResultByIdsRequest> get copyWith;
}

DepartmentControlRegisterControlRequest
    _$DepartmentControlRegisterControlRequestFromJson(
        Map<String, dynamic> json) {
  return _DepartmentControlRegisterControlRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlRegisterControlRequestTearOff {
  const _$DepartmentControlRegisterControlRequestTearOff();

// ignore: unused_element
  _DepartmentControlRegisterControlRequest call(
      ControlObject object, ControlResult controlResult) {
    return _DepartmentControlRegisterControlRequest(
      object,
      controlResult,
    );
  }

// ignore: unused_element
  DepartmentControlRegisterControlRequest fromJson(Map<String, Object> json) {
    return DepartmentControlRegisterControlRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlRegisterControlRequest =
    _$DepartmentControlRegisterControlRequestTearOff();

/// @nodoc
mixin _$DepartmentControlRegisterControlRequest {
  ControlObject get object;
  ControlResult get controlResult;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlRegisterControlRequestCopyWith<
      DepartmentControlRegisterControlRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlRegisterControlRequestCopyWith<$Res> {
  factory $DepartmentControlRegisterControlRequestCopyWith(
          DepartmentControlRegisterControlRequest value,
          $Res Function(DepartmentControlRegisterControlRequest) then) =
      _$DepartmentControlRegisterControlRequestCopyWithImpl<$Res>;
  $Res call({ControlObject object, ControlResult controlResult});

  $ControlObjectCopyWith<$Res> get object;
  $ControlResultCopyWith<$Res> get controlResult;
}

/// @nodoc
class _$DepartmentControlRegisterControlRequestCopyWithImpl<$Res>
    implements $DepartmentControlRegisterControlRequestCopyWith<$Res> {
  _$DepartmentControlRegisterControlRequestCopyWithImpl(
      this._value, this._then);

  final DepartmentControlRegisterControlRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlRegisterControlRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object controlResult = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      controlResult: controlResult == freezed
          ? _value.controlResult
          : controlResult as ControlResult,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }

  @override
  $ControlResultCopyWith<$Res> get controlResult {
    if (_value.controlResult == null) {
      return null;
    }
    return $ControlResultCopyWith<$Res>(_value.controlResult, (value) {
      return _then(_value.copyWith(controlResult: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlRegisterControlRequestCopyWith<$Res>
    implements $DepartmentControlRegisterControlRequestCopyWith<$Res> {
  factory _$DepartmentControlRegisterControlRequestCopyWith(
          _DepartmentControlRegisterControlRequest value,
          $Res Function(_DepartmentControlRegisterControlRequest) then) =
      __$DepartmentControlRegisterControlRequestCopyWithImpl<$Res>;
  @override
  $Res call({ControlObject object, ControlResult controlResult});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $ControlResultCopyWith<$Res> get controlResult;
}

/// @nodoc
class __$DepartmentControlRegisterControlRequestCopyWithImpl<$Res>
    extends _$DepartmentControlRegisterControlRequestCopyWithImpl<$Res>
    implements _$DepartmentControlRegisterControlRequestCopyWith<$Res> {
  __$DepartmentControlRegisterControlRequestCopyWithImpl(
      _DepartmentControlRegisterControlRequest _value,
      $Res Function(_DepartmentControlRegisterControlRequest) _then)
      : super(_value,
            (v) => _then(v as _DepartmentControlRegisterControlRequest));

  @override
  _DepartmentControlRegisterControlRequest get _value =>
      super._value as _DepartmentControlRegisterControlRequest;

  @override
  $Res call({
    Object object = freezed,
    Object controlResult = freezed,
  }) {
    return _then(_DepartmentControlRegisterControlRequest(
      object == freezed ? _value.object : object as ControlObject,
      controlResult == freezed
          ? _value.controlResult
          : controlResult as ControlResult,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlRegisterControlRequest
    implements _DepartmentControlRegisterControlRequest {
  const _$_DepartmentControlRegisterControlRequest(
      this.object, this.controlResult)
      : assert(object != null),
        assert(controlResult != null);

  factory _$_DepartmentControlRegisterControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlRegisterControlRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final ControlResult controlResult;

  @override
  String toString() {
    return 'DepartmentControlRegisterControlRequest(object: $object, controlResult: $controlResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlRegisterControlRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlResult, controlResult) ||
                const DeepCollectionEquality()
                    .equals(other.controlResult, controlResult)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlResult);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlRegisterControlRequestCopyWith<
          _DepartmentControlRegisterControlRequest>
      get copyWith => __$DepartmentControlRegisterControlRequestCopyWithImpl<
          _DepartmentControlRegisterControlRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlRegisterControlRequestToJson(this);
  }
}

abstract class _DepartmentControlRegisterControlRequest
    implements DepartmentControlRegisterControlRequest {
  const factory _DepartmentControlRegisterControlRequest(
          ControlObject object, ControlResult controlResult) =
      _$_DepartmentControlRegisterControlRequest;

  factory _DepartmentControlRegisterControlRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlRegisterControlRequest.fromJson;

  @override
  ControlObject get object;
  @override
  ControlResult get controlResult;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlRegisterControlRequestCopyWith<
      _DepartmentControlRegisterControlRequest> get copyWith;
}

DepartmentControlUpdateControlRequest
    _$DepartmentControlUpdateControlRequestFromJson(Map<String, dynamic> json) {
  return _DepartmentControlUpdateControlRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlUpdateControlRequestTearOff {
  const _$DepartmentControlUpdateControlRequestTearOff();

// ignore: unused_element
  _DepartmentControlUpdateControlRequest call(
      ControlObject object, int dcControlResultId, DCViolation violation) {
    return _DepartmentControlUpdateControlRequest(
      object,
      dcControlResultId,
      violation,
    );
  }

// ignore: unused_element
  DepartmentControlUpdateControlRequest fromJson(Map<String, Object> json) {
    return DepartmentControlUpdateControlRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlUpdateControlRequest =
    _$DepartmentControlUpdateControlRequestTearOff();

/// @nodoc
mixin _$DepartmentControlUpdateControlRequest {
  ControlObject get object;
  int get dcControlResultId;
  DCViolation get violation;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlUpdateControlRequestCopyWith<
      DepartmentControlUpdateControlRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlUpdateControlRequestCopyWith<$Res> {
  factory $DepartmentControlUpdateControlRequestCopyWith(
          DepartmentControlUpdateControlRequest value,
          $Res Function(DepartmentControlUpdateControlRequest) then) =
      _$DepartmentControlUpdateControlRequestCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object, int dcControlResultId, DCViolation violation});

  $ControlObjectCopyWith<$Res> get object;
  $DCViolationCopyWith<$Res> get violation;
}

/// @nodoc
class _$DepartmentControlUpdateControlRequestCopyWithImpl<$Res>
    implements $DepartmentControlUpdateControlRequestCopyWith<$Res> {
  _$DepartmentControlUpdateControlRequestCopyWithImpl(this._value, this._then);

  final DepartmentControlUpdateControlRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlUpdateControlRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object violation = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      dcControlResultId: dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      violation:
          violation == freezed ? _value.violation : violation as DCViolation,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }

  @override
  $DCViolationCopyWith<$Res> get violation {
    if (_value.violation == null) {
      return null;
    }
    return $DCViolationCopyWith<$Res>(_value.violation, (value) {
      return _then(_value.copyWith(violation: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlUpdateControlRequestCopyWith<$Res>
    implements $DepartmentControlUpdateControlRequestCopyWith<$Res> {
  factory _$DepartmentControlUpdateControlRequestCopyWith(
          _DepartmentControlUpdateControlRequest value,
          $Res Function(_DepartmentControlUpdateControlRequest) then) =
      __$DepartmentControlUpdateControlRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object, int dcControlResultId, DCViolation violation});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $DCViolationCopyWith<$Res> get violation;
}

/// @nodoc
class __$DepartmentControlUpdateControlRequestCopyWithImpl<$Res>
    extends _$DepartmentControlUpdateControlRequestCopyWithImpl<$Res>
    implements _$DepartmentControlUpdateControlRequestCopyWith<$Res> {
  __$DepartmentControlUpdateControlRequestCopyWithImpl(
      _DepartmentControlUpdateControlRequest _value,
      $Res Function(_DepartmentControlUpdateControlRequest) _then)
      : super(
            _value, (v) => _then(v as _DepartmentControlUpdateControlRequest));

  @override
  _DepartmentControlUpdateControlRequest get _value =>
      super._value as _DepartmentControlUpdateControlRequest;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object violation = freezed,
  }) {
    return _then(_DepartmentControlUpdateControlRequest(
      object == freezed ? _value.object : object as ControlObject,
      dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      violation == freezed ? _value.violation : violation as DCViolation,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlUpdateControlRequest
    implements _DepartmentControlUpdateControlRequest {
  const _$_DepartmentControlUpdateControlRequest(
      this.object, this.dcControlResultId, this.violation)
      : assert(object != null),
        assert(dcControlResultId != null),
        assert(violation != null);

  factory _$_DepartmentControlUpdateControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlUpdateControlRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final int dcControlResultId;
  @override
  final DCViolation violation;

  @override
  String toString() {
    return 'DepartmentControlUpdateControlRequest(object: $object, dcControlResultId: $dcControlResultId, violation: $violation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlUpdateControlRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.dcControlResultId, dcControlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.dcControlResultId, dcControlResultId)) &&
            (identical(other.violation, violation) ||
                const DeepCollectionEquality()
                    .equals(other.violation, violation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(dcControlResultId) ^
      const DeepCollectionEquality().hash(violation);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlUpdateControlRequestCopyWith<
          _DepartmentControlUpdateControlRequest>
      get copyWith => __$DepartmentControlUpdateControlRequestCopyWithImpl<
          _DepartmentControlUpdateControlRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlUpdateControlRequestToJson(this);
  }
}

abstract class _DepartmentControlUpdateControlRequest
    implements DepartmentControlUpdateControlRequest {
  const factory _DepartmentControlUpdateControlRequest(
          ControlObject object, int dcControlResultId, DCViolation violation) =
      _$_DepartmentControlUpdateControlRequest;

  factory _DepartmentControlUpdateControlRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlUpdateControlRequest.fromJson;

  @override
  ControlObject get object;
  @override
  int get dcControlResultId;
  @override
  DCViolation get violation;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlUpdateControlRequestCopyWith<
      _DepartmentControlUpdateControlRequest> get copyWith;
}

DepartmentControlRemoveControlRequest
    _$DepartmentControlRemoveControlRequestFromJson(Map<String, dynamic> json) {
  return _DepartmentControlRemoveControlRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlRemoveControlRequestTearOff {
  const _$DepartmentControlRemoveControlRequestTearOff();

// ignore: unused_element
  _DepartmentControlRemoveControlRequest call(
      ControlObject object, int resultId) {
    return _DepartmentControlRemoveControlRequest(
      object,
      resultId,
    );
  }

// ignore: unused_element
  DepartmentControlRemoveControlRequest fromJson(Map<String, Object> json) {
    return DepartmentControlRemoveControlRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlRemoveControlRequest =
    _$DepartmentControlRemoveControlRequestTearOff();

/// @nodoc
mixin _$DepartmentControlRemoveControlRequest {
  ControlObject get object;
  int get resultId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlRemoveControlRequestCopyWith<
      DepartmentControlRemoveControlRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlRemoveControlRequestCopyWith<$Res> {
  factory $DepartmentControlRemoveControlRequestCopyWith(
          DepartmentControlRemoveControlRequest value,
          $Res Function(DepartmentControlRemoveControlRequest) then) =
      _$DepartmentControlRemoveControlRequestCopyWithImpl<$Res>;
  $Res call({ControlObject object, int resultId});

  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$DepartmentControlRemoveControlRequestCopyWithImpl<$Res>
    implements $DepartmentControlRemoveControlRequestCopyWith<$Res> {
  _$DepartmentControlRemoveControlRequestCopyWithImpl(this._value, this._then);

  final DepartmentControlRemoveControlRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlRemoveControlRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object resultId = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      resultId: resultId == freezed ? _value.resultId : resultId as int,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlRemoveControlRequestCopyWith<$Res>
    implements $DepartmentControlRemoveControlRequestCopyWith<$Res> {
  factory _$DepartmentControlRemoveControlRequestCopyWith(
          _DepartmentControlRemoveControlRequest value,
          $Res Function(_DepartmentControlRemoveControlRequest) then) =
      __$DepartmentControlRemoveControlRequestCopyWithImpl<$Res>;
  @override
  $Res call({ControlObject object, int resultId});

  @override
  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class __$DepartmentControlRemoveControlRequestCopyWithImpl<$Res>
    extends _$DepartmentControlRemoveControlRequestCopyWithImpl<$Res>
    implements _$DepartmentControlRemoveControlRequestCopyWith<$Res> {
  __$DepartmentControlRemoveControlRequestCopyWithImpl(
      _DepartmentControlRemoveControlRequest _value,
      $Res Function(_DepartmentControlRemoveControlRequest) _then)
      : super(
            _value, (v) => _then(v as _DepartmentControlRemoveControlRequest));

  @override
  _DepartmentControlRemoveControlRequest get _value =>
      super._value as _DepartmentControlRemoveControlRequest;

  @override
  $Res call({
    Object object = freezed,
    Object resultId = freezed,
  }) {
    return _then(_DepartmentControlRemoveControlRequest(
      object == freezed ? _value.object : object as ControlObject,
      resultId == freezed ? _value.resultId : resultId as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlRemoveControlRequest
    implements _DepartmentControlRemoveControlRequest {
  const _$_DepartmentControlRemoveControlRequest(this.object, this.resultId)
      : assert(object != null),
        assert(resultId != null);

  factory _$_DepartmentControlRemoveControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlRemoveControlRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final int resultId;

  @override
  String toString() {
    return 'DepartmentControlRemoveControlRequest(object: $object, resultId: $resultId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlRemoveControlRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.resultId, resultId) ||
                const DeepCollectionEquality()
                    .equals(other.resultId, resultId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(resultId);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlRemoveControlRequestCopyWith<
          _DepartmentControlRemoveControlRequest>
      get copyWith => __$DepartmentControlRemoveControlRequestCopyWithImpl<
          _DepartmentControlRemoveControlRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlRemoveControlRequestToJson(this);
  }
}

abstract class _DepartmentControlRemoveControlRequest
    implements DepartmentControlRemoveControlRequest {
  const factory _DepartmentControlRemoveControlRequest(
          ControlObject object, int resultId) =
      _$_DepartmentControlRemoveControlRequest;

  factory _DepartmentControlRemoveControlRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlRemoveControlRequest.fromJson;

  @override
  ControlObject get object;
  @override
  int get resultId;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlRemoveControlRequestCopyWith<
      _DepartmentControlRemoveControlRequest> get copyWith;
}

DepartmentControlRegisterPerformControlRequest
    _$DepartmentControlRegisterPerformControlRequestFromJson(
        Map<String, dynamic> json) {
  return _DepartmentControlRegisterPerformControlRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlRegisterPerformControlRequestTearOff {
  const _$DepartmentControlRegisterPerformControlRequestTearOff();

// ignore: unused_element
  _DepartmentControlRegisterPerformControlRequest call(ControlObject object,
      int dcControlResultId, PerformControl performControl) {
    return _DepartmentControlRegisterPerformControlRequest(
      object,
      dcControlResultId,
      performControl,
    );
  }

// ignore: unused_element
  DepartmentControlRegisterPerformControlRequest fromJson(
      Map<String, Object> json) {
    return DepartmentControlRegisterPerformControlRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlRegisterPerformControlRequest =
    _$DepartmentControlRegisterPerformControlRequestTearOff();

/// @nodoc
mixin _$DepartmentControlRegisterPerformControlRequest {
  ControlObject get object;
  int get dcControlResultId;
  PerformControl get performControl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlRegisterPerformControlRequestCopyWith<
      DepartmentControlRegisterPerformControlRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlRegisterPerformControlRequestCopyWith<$Res> {
  factory $DepartmentControlRegisterPerformControlRequestCopyWith(
          DepartmentControlRegisterPerformControlRequest value,
          $Res Function(DepartmentControlRegisterPerformControlRequest) then) =
      _$DepartmentControlRegisterPerformControlRequestCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      PerformControl performControl});

  $ControlObjectCopyWith<$Res> get object;
  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class _$DepartmentControlRegisterPerformControlRequestCopyWithImpl<$Res>
    implements $DepartmentControlRegisterPerformControlRequestCopyWith<$Res> {
  _$DepartmentControlRegisterPerformControlRequestCopyWithImpl(
      this._value, this._then);

  final DepartmentControlRegisterPerformControlRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlRegisterPerformControlRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object performControl = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      dcControlResultId: dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      performControl: performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }

  @override
  $PerformControlCopyWith<$Res> get performControl {
    if (_value.performControl == null) {
      return null;
    }
    return $PerformControlCopyWith<$Res>(_value.performControl, (value) {
      return _then(_value.copyWith(performControl: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlRegisterPerformControlRequestCopyWith<$Res>
    implements $DepartmentControlRegisterPerformControlRequestCopyWith<$Res> {
  factory _$DepartmentControlRegisterPerformControlRequestCopyWith(
          _DepartmentControlRegisterPerformControlRequest value,
          $Res Function(_DepartmentControlRegisterPerformControlRequest) then) =
      __$DepartmentControlRegisterPerformControlRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      PerformControl performControl});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class __$DepartmentControlRegisterPerformControlRequestCopyWithImpl<$Res>
    extends _$DepartmentControlRegisterPerformControlRequestCopyWithImpl<$Res>
    implements _$DepartmentControlRegisterPerformControlRequestCopyWith<$Res> {
  __$DepartmentControlRegisterPerformControlRequestCopyWithImpl(
      _DepartmentControlRegisterPerformControlRequest _value,
      $Res Function(_DepartmentControlRegisterPerformControlRequest) _then)
      : super(_value,
            (v) => _then(v as _DepartmentControlRegisterPerformControlRequest));

  @override
  _DepartmentControlRegisterPerformControlRequest get _value =>
      super._value as _DepartmentControlRegisterPerformControlRequest;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object performControl = freezed,
  }) {
    return _then(_DepartmentControlRegisterPerformControlRequest(
      object == freezed ? _value.object : object as ControlObject,
      dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlRegisterPerformControlRequest
    implements _DepartmentControlRegisterPerformControlRequest {
  const _$_DepartmentControlRegisterPerformControlRequest(
      this.object, this.dcControlResultId, this.performControl)
      : assert(object != null),
        assert(dcControlResultId != null),
        assert(performControl != null);

  factory _$_DepartmentControlRegisterPerformControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlRegisterPerformControlRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final int dcControlResultId;
  @override
  final PerformControl performControl;

  @override
  String toString() {
    return 'DepartmentControlRegisterPerformControlRequest(object: $object, dcControlResultId: $dcControlResultId, performControl: $performControl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlRegisterPerformControlRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.dcControlResultId, dcControlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.dcControlResultId, dcControlResultId)) &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(dcControlResultId) ^
      const DeepCollectionEquality().hash(performControl);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlRegisterPerformControlRequestCopyWith<
          _DepartmentControlRegisterPerformControlRequest>
      get copyWith =>
          __$DepartmentControlRegisterPerformControlRequestCopyWithImpl<
                  _DepartmentControlRegisterPerformControlRequest>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlRegisterPerformControlRequestToJson(this);
  }
}

abstract class _DepartmentControlRegisterPerformControlRequest
    implements DepartmentControlRegisterPerformControlRequest {
  const factory _DepartmentControlRegisterPerformControlRequest(
          ControlObject object,
          int dcControlResultId,
          PerformControl performControl) =
      _$_DepartmentControlRegisterPerformControlRequest;

  factory _DepartmentControlRegisterPerformControlRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlRegisterPerformControlRequest.fromJson;

  @override
  ControlObject get object;
  @override
  int get dcControlResultId;
  @override
  PerformControl get performControl;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlRegisterPerformControlRequestCopyWith<
      _DepartmentControlRegisterPerformControlRequest> get copyWith;
}

DepartmentControlUpdatePerformControlRequest
    _$DepartmentControlUpdatePerformControlRequestFromJson(
        Map<String, dynamic> json) {
  return _DepartmentControlUpdatePerformControlRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlUpdatePerformControlRequestTearOff {
  const _$DepartmentControlUpdatePerformControlRequestTearOff();

// ignore: unused_element
  _DepartmentControlUpdatePerformControlRequest call(ControlObject object,
      int dcControlResultId, PerformControl performControl) {
    return _DepartmentControlUpdatePerformControlRequest(
      object,
      dcControlResultId,
      performControl,
    );
  }

// ignore: unused_element
  DepartmentControlUpdatePerformControlRequest fromJson(
      Map<String, Object> json) {
    return DepartmentControlUpdatePerformControlRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlUpdatePerformControlRequest =
    _$DepartmentControlUpdatePerformControlRequestTearOff();

/// @nodoc
mixin _$DepartmentControlUpdatePerformControlRequest {
  ControlObject get object;
  int get dcControlResultId;
  PerformControl get performControl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlUpdatePerformControlRequestCopyWith<
      DepartmentControlUpdatePerformControlRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlUpdatePerformControlRequestCopyWith<$Res> {
  factory $DepartmentControlUpdatePerformControlRequestCopyWith(
          DepartmentControlUpdatePerformControlRequest value,
          $Res Function(DepartmentControlUpdatePerformControlRequest) then) =
      _$DepartmentControlUpdatePerformControlRequestCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      PerformControl performControl});

  $ControlObjectCopyWith<$Res> get object;
  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class _$DepartmentControlUpdatePerformControlRequestCopyWithImpl<$Res>
    implements $DepartmentControlUpdatePerformControlRequestCopyWith<$Res> {
  _$DepartmentControlUpdatePerformControlRequestCopyWithImpl(
      this._value, this._then);

  final DepartmentControlUpdatePerformControlRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlUpdatePerformControlRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object performControl = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      dcControlResultId: dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      performControl: performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }

  @override
  $PerformControlCopyWith<$Res> get performControl {
    if (_value.performControl == null) {
      return null;
    }
    return $PerformControlCopyWith<$Res>(_value.performControl, (value) {
      return _then(_value.copyWith(performControl: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlUpdatePerformControlRequestCopyWith<$Res>
    implements $DepartmentControlUpdatePerformControlRequestCopyWith<$Res> {
  factory _$DepartmentControlUpdatePerformControlRequestCopyWith(
          _DepartmentControlUpdatePerformControlRequest value,
          $Res Function(_DepartmentControlUpdatePerformControlRequest) then) =
      __$DepartmentControlUpdatePerformControlRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      PerformControl performControl});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class __$DepartmentControlUpdatePerformControlRequestCopyWithImpl<$Res>
    extends _$DepartmentControlUpdatePerformControlRequestCopyWithImpl<$Res>
    implements _$DepartmentControlUpdatePerformControlRequestCopyWith<$Res> {
  __$DepartmentControlUpdatePerformControlRequestCopyWithImpl(
      _DepartmentControlUpdatePerformControlRequest _value,
      $Res Function(_DepartmentControlUpdatePerformControlRequest) _then)
      : super(_value,
            (v) => _then(v as _DepartmentControlUpdatePerformControlRequest));

  @override
  _DepartmentControlUpdatePerformControlRequest get _value =>
      super._value as _DepartmentControlUpdatePerformControlRequest;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object performControl = freezed,
  }) {
    return _then(_DepartmentControlUpdatePerformControlRequest(
      object == freezed ? _value.object : object as ControlObject,
      dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlUpdatePerformControlRequest
    implements _DepartmentControlUpdatePerformControlRequest {
  const _$_DepartmentControlUpdatePerformControlRequest(
      this.object, this.dcControlResultId, this.performControl)
      : assert(object != null),
        assert(dcControlResultId != null),
        assert(performControl != null);

  factory _$_DepartmentControlUpdatePerformControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlUpdatePerformControlRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final int dcControlResultId;
  @override
  final PerformControl performControl;

  @override
  String toString() {
    return 'DepartmentControlUpdatePerformControlRequest(object: $object, dcControlResultId: $dcControlResultId, performControl: $performControl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlUpdatePerformControlRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.dcControlResultId, dcControlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.dcControlResultId, dcControlResultId)) &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(dcControlResultId) ^
      const DeepCollectionEquality().hash(performControl);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlUpdatePerformControlRequestCopyWith<
          _DepartmentControlUpdatePerformControlRequest>
      get copyWith =>
          __$DepartmentControlUpdatePerformControlRequestCopyWithImpl<
              _DepartmentControlUpdatePerformControlRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlUpdatePerformControlRequestToJson(this);
  }
}

abstract class _DepartmentControlUpdatePerformControlRequest
    implements DepartmentControlUpdatePerformControlRequest {
  const factory _DepartmentControlUpdatePerformControlRequest(
          ControlObject object,
          int dcControlResultId,
          PerformControl performControl) =
      _$_DepartmentControlUpdatePerformControlRequest;

  factory _DepartmentControlUpdatePerformControlRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlUpdatePerformControlRequest.fromJson;

  @override
  ControlObject get object;
  @override
  int get dcControlResultId;
  @override
  PerformControl get performControl;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlUpdatePerformControlRequestCopyWith<
      _DepartmentControlUpdatePerformControlRequest> get copyWith;
}

DepartmentControlRemovePerformControlRequest
    _$DepartmentControlRemovePerformControlRequestFromJson(
        Map<String, dynamic> json) {
  return _DepartmentControlRemovePerformControlRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlRemovePerformControlRequestTearOff {
  const _$DepartmentControlRemovePerformControlRequestTearOff();

// ignore: unused_element
  _DepartmentControlRemovePerformControlRequest call(ControlObject object,
      int dcControlResultId, PerformControl performControl) {
    return _DepartmentControlRemovePerformControlRequest(
      object,
      dcControlResultId,
      performControl,
    );
  }

// ignore: unused_element
  DepartmentControlRemovePerformControlRequest fromJson(
      Map<String, Object> json) {
    return DepartmentControlRemovePerformControlRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlRemovePerformControlRequest =
    _$DepartmentControlRemovePerformControlRequestTearOff();

/// @nodoc
mixin _$DepartmentControlRemovePerformControlRequest {
  ControlObject get object;
  int get dcControlResultId;
  PerformControl get performControl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlRemovePerformControlRequestCopyWith<
      DepartmentControlRemovePerformControlRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlRemovePerformControlRequestCopyWith<$Res> {
  factory $DepartmentControlRemovePerformControlRequestCopyWith(
          DepartmentControlRemovePerformControlRequest value,
          $Res Function(DepartmentControlRemovePerformControlRequest) then) =
      _$DepartmentControlRemovePerformControlRequestCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      PerformControl performControl});

  $ControlObjectCopyWith<$Res> get object;
  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class _$DepartmentControlRemovePerformControlRequestCopyWithImpl<$Res>
    implements $DepartmentControlRemovePerformControlRequestCopyWith<$Res> {
  _$DepartmentControlRemovePerformControlRequestCopyWithImpl(
      this._value, this._then);

  final DepartmentControlRemovePerformControlRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlRemovePerformControlRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object performControl = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      dcControlResultId: dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      performControl: performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }

  @override
  $PerformControlCopyWith<$Res> get performControl {
    if (_value.performControl == null) {
      return null;
    }
    return $PerformControlCopyWith<$Res>(_value.performControl, (value) {
      return _then(_value.copyWith(performControl: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlRemovePerformControlRequestCopyWith<$Res>
    implements $DepartmentControlRemovePerformControlRequestCopyWith<$Res> {
  factory _$DepartmentControlRemovePerformControlRequestCopyWith(
          _DepartmentControlRemovePerformControlRequest value,
          $Res Function(_DepartmentControlRemovePerformControlRequest) then) =
      __$DepartmentControlRemovePerformControlRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      PerformControl performControl});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class __$DepartmentControlRemovePerformControlRequestCopyWithImpl<$Res>
    extends _$DepartmentControlRemovePerformControlRequestCopyWithImpl<$Res>
    implements _$DepartmentControlRemovePerformControlRequestCopyWith<$Res> {
  __$DepartmentControlRemovePerformControlRequestCopyWithImpl(
      _DepartmentControlRemovePerformControlRequest _value,
      $Res Function(_DepartmentControlRemovePerformControlRequest) _then)
      : super(_value,
            (v) => _then(v as _DepartmentControlRemovePerformControlRequest));

  @override
  _DepartmentControlRemovePerformControlRequest get _value =>
      super._value as _DepartmentControlRemovePerformControlRequest;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object performControl = freezed,
  }) {
    return _then(_DepartmentControlRemovePerformControlRequest(
      object == freezed ? _value.object : object as ControlObject,
      dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlRemovePerformControlRequest
    implements _DepartmentControlRemovePerformControlRequest {
  const _$_DepartmentControlRemovePerformControlRequest(
      this.object, this.dcControlResultId, this.performControl)
      : assert(object != null),
        assert(dcControlResultId != null),
        assert(performControl != null);

  factory _$_DepartmentControlRemovePerformControlRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlRemovePerformControlRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final int dcControlResultId;
  @override
  final PerformControl performControl;

  @override
  String toString() {
    return 'DepartmentControlRemovePerformControlRequest(object: $object, dcControlResultId: $dcControlResultId, performControl: $performControl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlRemovePerformControlRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.dcControlResultId, dcControlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.dcControlResultId, dcControlResultId)) &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(dcControlResultId) ^
      const DeepCollectionEquality().hash(performControl);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlRemovePerformControlRequestCopyWith<
          _DepartmentControlRemovePerformControlRequest>
      get copyWith =>
          __$DepartmentControlRemovePerformControlRequestCopyWithImpl<
              _DepartmentControlRemovePerformControlRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlRemovePerformControlRequestToJson(this);
  }
}

abstract class _DepartmentControlRemovePerformControlRequest
    implements DepartmentControlRemovePerformControlRequest {
  const factory _DepartmentControlRemovePerformControlRequest(
          ControlObject object,
          int dcControlResultId,
          PerformControl performControl) =
      _$_DepartmentControlRemovePerformControlRequest;

  factory _DepartmentControlRemovePerformControlRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlRemovePerformControlRequest.fromJson;

  @override
  ControlObject get object;
  @override
  int get dcControlResultId;
  @override
  PerformControl get performControl;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlRemovePerformControlRequestCopyWith<
      _DepartmentControlRemovePerformControlRequest> get copyWith;
}

DepartmentControlExtendControlPeriodRequest
    _$DepartmentControlExtendControlPeriodRequestFromJson(
        Map<String, dynamic> json) {
  return _DepartmentControlExtendControlPeriodRequest.fromJson(json);
}

/// @nodoc
class _$DepartmentControlExtendControlPeriodRequestTearOff {
  const _$DepartmentControlExtendControlPeriodRequestTearOff();

// ignore: unused_element
  _DepartmentControlExtendControlPeriodRequest call(
      ControlObject object,
      int dcControlResultId,
      ViolationExtensionPeriod violationExtensionPeriod) {
    return _DepartmentControlExtendControlPeriodRequest(
      object,
      dcControlResultId,
      violationExtensionPeriod,
    );
  }

// ignore: unused_element
  DepartmentControlExtendControlPeriodRequest fromJson(
      Map<String, Object> json) {
    return DepartmentControlExtendControlPeriodRequest.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlExtendControlPeriodRequest =
    _$DepartmentControlExtendControlPeriodRequestTearOff();

/// @nodoc
mixin _$DepartmentControlExtendControlPeriodRequest {
  ControlObject get object;
  int get dcControlResultId;
  ViolationExtensionPeriod get violationExtensionPeriod;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlExtendControlPeriodRequestCopyWith<
      DepartmentControlExtendControlPeriodRequest> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlExtendControlPeriodRequestCopyWith<$Res> {
  factory $DepartmentControlExtendControlPeriodRequestCopyWith(
          DepartmentControlExtendControlPeriodRequest value,
          $Res Function(DepartmentControlExtendControlPeriodRequest) then) =
      _$DepartmentControlExtendControlPeriodRequestCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      ViolationExtensionPeriod violationExtensionPeriod});

  $ControlObjectCopyWith<$Res> get object;
  $ViolationExtensionPeriodCopyWith<$Res> get violationExtensionPeriod;
}

/// @nodoc
class _$DepartmentControlExtendControlPeriodRequestCopyWithImpl<$Res>
    implements $DepartmentControlExtendControlPeriodRequestCopyWith<$Res> {
  _$DepartmentControlExtendControlPeriodRequestCopyWithImpl(
      this._value, this._then);

  final DepartmentControlExtendControlPeriodRequest _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlExtendControlPeriodRequest) _then;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object violationExtensionPeriod = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      dcControlResultId: dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      violationExtensionPeriod: violationExtensionPeriod == freezed
          ? _value.violationExtensionPeriod
          : violationExtensionPeriod as ViolationExtensionPeriod,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
  }

  @override
  $ViolationExtensionPeriodCopyWith<$Res> get violationExtensionPeriod {
    if (_value.violationExtensionPeriod == null) {
      return null;
    }
    return $ViolationExtensionPeriodCopyWith<$Res>(
        _value.violationExtensionPeriod, (value) {
      return _then(_value.copyWith(violationExtensionPeriod: value));
    });
  }
}

/// @nodoc
abstract class _$DepartmentControlExtendControlPeriodRequestCopyWith<$Res>
    implements $DepartmentControlExtendControlPeriodRequestCopyWith<$Res> {
  factory _$DepartmentControlExtendControlPeriodRequestCopyWith(
          _DepartmentControlExtendControlPeriodRequest value,
          $Res Function(_DepartmentControlExtendControlPeriodRequest) then) =
      __$DepartmentControlExtendControlPeriodRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object,
      int dcControlResultId,
      ViolationExtensionPeriod violationExtensionPeriod});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $ViolationExtensionPeriodCopyWith<$Res> get violationExtensionPeriod;
}

/// @nodoc
class __$DepartmentControlExtendControlPeriodRequestCopyWithImpl<$Res>
    extends _$DepartmentControlExtendControlPeriodRequestCopyWithImpl<$Res>
    implements _$DepartmentControlExtendControlPeriodRequestCopyWith<$Res> {
  __$DepartmentControlExtendControlPeriodRequestCopyWithImpl(
      _DepartmentControlExtendControlPeriodRequest _value,
      $Res Function(_DepartmentControlExtendControlPeriodRequest) _then)
      : super(_value,
            (v) => _then(v as _DepartmentControlExtendControlPeriodRequest));

  @override
  _DepartmentControlExtendControlPeriodRequest get _value =>
      super._value as _DepartmentControlExtendControlPeriodRequest;

  @override
  $Res call({
    Object object = freezed,
    Object dcControlResultId = freezed,
    Object violationExtensionPeriod = freezed,
  }) {
    return _then(_DepartmentControlExtendControlPeriodRequest(
      object == freezed ? _value.object : object as ControlObject,
      dcControlResultId == freezed
          ? _value.dcControlResultId
          : dcControlResultId as int,
      violationExtensionPeriod == freezed
          ? _value.violationExtensionPeriod
          : violationExtensionPeriod as ViolationExtensionPeriod,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlExtendControlPeriodRequest
    implements _DepartmentControlExtendControlPeriodRequest {
  const _$_DepartmentControlExtendControlPeriodRequest(
      this.object, this.dcControlResultId, this.violationExtensionPeriod)
      : assert(object != null),
        assert(dcControlResultId != null),
        assert(violationExtensionPeriod != null);

  factory _$_DepartmentControlExtendControlPeriodRequest.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlExtendControlPeriodRequestFromJson(json);

  @override
  final ControlObject object;
  @override
  final int dcControlResultId;
  @override
  final ViolationExtensionPeriod violationExtensionPeriod;

  @override
  String toString() {
    return 'DepartmentControlExtendControlPeriodRequest(object: $object, dcControlResultId: $dcControlResultId, violationExtensionPeriod: $violationExtensionPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlExtendControlPeriodRequest &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.dcControlResultId, dcControlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.dcControlResultId, dcControlResultId)) &&
            (identical(
                    other.violationExtensionPeriod, violationExtensionPeriod) ||
                const DeepCollectionEquality().equals(
                    other.violationExtensionPeriod, violationExtensionPeriod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(dcControlResultId) ^
      const DeepCollectionEquality().hash(violationExtensionPeriod);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlExtendControlPeriodRequestCopyWith<
          _DepartmentControlExtendControlPeriodRequest>
      get copyWith =>
          __$DepartmentControlExtendControlPeriodRequestCopyWithImpl<
              _DepartmentControlExtendControlPeriodRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlExtendControlPeriodRequestToJson(this);
  }
}

abstract class _DepartmentControlExtendControlPeriodRequest
    implements DepartmentControlExtendControlPeriodRequest {
  const factory _DepartmentControlExtendControlPeriodRequest(
          ControlObject object,
          int dcControlResultId,
          ViolationExtensionPeriod violationExtensionPeriod) =
      _$_DepartmentControlExtendControlPeriodRequest;

  factory _DepartmentControlExtendControlPeriodRequest.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlExtendControlPeriodRequest.fromJson;

  @override
  ControlObject get object;
  @override
  int get dcControlResultId;
  @override
  ViolationExtensionPeriod get violationExtensionPeriod;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlExtendControlPeriodRequestCopyWith<
      _DepartmentControlExtendControlPeriodRequest> get copyWith;
}
