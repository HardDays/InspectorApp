// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationSearchResult _$ViolationSearchResultFromJson(
    Map<String, dynamic> json) {
  return _ViolationSearchResult.fromJson(json);
}

/// @nodoc
class _$ViolationSearchResultTearOff {
  const _$ViolationSearchResultTearOff();

// ignore: unused_element
  _ViolationSearchResult call(
      {int id,
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
      DCViolationKind violationKind,
      String cafapAssigmentId,
      String cafapPrescriptionId,
      int cafapPrescriptionNum,
      bool cafapViolationConfirmed,
      List<PerformMark> performMarks,
      List<PerformControlSearchResult> performControls,
      List<ViolationExtensionPeriodSearchResult> extensionPeriods,
      bool creationSentToCafap,
      bool closureSentToCafap,
      int objectId,
      String objectName}) {
    return _ViolationSearchResult(
      id: id,
      detectionDate: detectionDate,
      eknViolationClassification: eknViolationClassification,
      otherViolationClassification: otherViolationClassification,
      btiAddress: btiAddress,
      address: address,
      btiRefAddress: btiRefAddress,
      refAddressTinao: refAddressTinao,
      objectElement: objectElement,
      description: description,
      violator: violator,
      critical: critical,
      resolveDate: resolveDate,
      controlDate: controlDate,
      additionalFeatures: additionalFeatures,
      photos: photos,
      violationNum: violationNum,
      violationStatus: violationStatus,
      source: source,
      violationKind: violationKind,
      cafapAssigmentId: cafapAssigmentId,
      cafapPrescriptionId: cafapPrescriptionId,
      cafapPrescriptionNum: cafapPrescriptionNum,
      cafapViolationConfirmed: cafapViolationConfirmed,
      performMarks: performMarks,
      performControls: performControls,
      extensionPeriods: extensionPeriods,
      creationSentToCafap: creationSentToCafap,
      closureSentToCafap: closureSentToCafap,
      objectId: objectId,
      objectName: objectName,
    );
  }

// ignore: unused_element
  ViolationSearchResult fromJson(Map<String, Object> json) {
    return ViolationSearchResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationSearchResult = _$ViolationSearchResultTearOff();

/// @nodoc
mixin _$ViolationSearchResult {
  int get id;
  DateTime get detectionDate;
  ViolationClassification get eknViolationClassification;
  ViolationClassification get otherViolationClassification;
  Address get btiAddress;
  String get address;
  Address get btiRefAddress;
  bool get refAddressTinao;
  ObjectElement get objectElement;
  String get description;
  Contractor get violator;
  bool get critical;
  DateTime get resolveDate;
  DateTime get controlDate;
  List<ViolationAdditionalFeature> get additionalFeatures;
  List<DCPhoto> get photos;
  String get violationNum;
  ViolationStatus get violationStatus;
  Source get source;
  DCViolationKind get violationKind;
  String get cafapAssigmentId;
  String get cafapPrescriptionId;
  int get cafapPrescriptionNum;
  bool get cafapViolationConfirmed;
  List<PerformMark> get performMarks;
  List<PerformControlSearchResult> get performControls;
  List<ViolationExtensionPeriodSearchResult> get extensionPeriods;
  bool get creationSentToCafap;
  bool get closureSentToCafap;
  int get objectId;
  String get objectName;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationSearchResultCopyWith<ViolationSearchResult> get copyWith;
}

/// @nodoc
abstract class $ViolationSearchResultCopyWith<$Res> {
  factory $ViolationSearchResultCopyWith(ViolationSearchResult value,
          $Res Function(ViolationSearchResult) then) =
      _$ViolationSearchResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
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
      DCViolationKind violationKind,
      String cafapAssigmentId,
      String cafapPrescriptionId,
      int cafapPrescriptionNum,
      bool cafapViolationConfirmed,
      List<PerformMark> performMarks,
      List<PerformControlSearchResult> performControls,
      List<ViolationExtensionPeriodSearchResult> extensionPeriods,
      bool creationSentToCafap,
      bool closureSentToCafap,
      int objectId,
      String objectName});

  $ViolationClassificationCopyWith<$Res> get eknViolationClassification;
  $ViolationClassificationCopyWith<$Res> get otherViolationClassification;
  $ObjectElementCopyWith<$Res> get objectElement;
  $ContractorCopyWith<$Res> get violator;
  $ViolationStatusCopyWith<$Res> get violationStatus;
  $SourceCopyWith<$Res> get source;
  $DCViolationKindCopyWith<$Res> get violationKind;
}

/// @nodoc
class _$ViolationSearchResultCopyWithImpl<$Res>
    implements $ViolationSearchResultCopyWith<$Res> {
  _$ViolationSearchResultCopyWithImpl(this._value, this._then);

  final ViolationSearchResult _value;
  // ignore: unused_field
  final $Res Function(ViolationSearchResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object detectionDate = freezed,
    Object eknViolationClassification = freezed,
    Object otherViolationClassification = freezed,
    Object btiAddress = freezed,
    Object address = freezed,
    Object btiRefAddress = freezed,
    Object refAddressTinao = freezed,
    Object objectElement = freezed,
    Object description = freezed,
    Object violator = freezed,
    Object critical = freezed,
    Object resolveDate = freezed,
    Object controlDate = freezed,
    Object additionalFeatures = freezed,
    Object photos = freezed,
    Object violationNum = freezed,
    Object violationStatus = freezed,
    Object source = freezed,
    Object violationKind = freezed,
    Object cafapAssigmentId = freezed,
    Object cafapPrescriptionId = freezed,
    Object cafapPrescriptionNum = freezed,
    Object cafapViolationConfirmed = freezed,
    Object performMarks = freezed,
    Object performControls = freezed,
    Object extensionPeriods = freezed,
    Object creationSentToCafap = freezed,
    Object closureSentToCafap = freezed,
    Object objectId = freezed,
    Object objectName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      detectionDate: detectionDate == freezed
          ? _value.detectionDate
          : detectionDate as DateTime,
      eknViolationClassification: eknViolationClassification == freezed
          ? _value.eknViolationClassification
          : eknViolationClassification as ViolationClassification,
      otherViolationClassification: otherViolationClassification == freezed
          ? _value.otherViolationClassification
          : otherViolationClassification as ViolationClassification,
      btiAddress:
          btiAddress == freezed ? _value.btiAddress : btiAddress as Address,
      address: address == freezed ? _value.address : address as String,
      btiRefAddress: btiRefAddress == freezed
          ? _value.btiRefAddress
          : btiRefAddress as Address,
      refAddressTinao: refAddressTinao == freezed
          ? _value.refAddressTinao
          : refAddressTinao as bool,
      objectElement: objectElement == freezed
          ? _value.objectElement
          : objectElement as ObjectElement,
      description:
          description == freezed ? _value.description : description as String,
      violator: violator == freezed ? _value.violator : violator as Contractor,
      critical: critical == freezed ? _value.critical : critical as bool,
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      controlDate:
          controlDate == freezed ? _value.controlDate : controlDate as DateTime,
      additionalFeatures: additionalFeatures == freezed
          ? _value.additionalFeatures
          : additionalFeatures as List<ViolationAdditionalFeature>,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      violationStatus: violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
      source: source == freezed ? _value.source : source as Source,
      violationKind: violationKind == freezed
          ? _value.violationKind
          : violationKind as DCViolationKind,
      cafapAssigmentId: cafapAssigmentId == freezed
          ? _value.cafapAssigmentId
          : cafapAssigmentId as String,
      cafapPrescriptionId: cafapPrescriptionId == freezed
          ? _value.cafapPrescriptionId
          : cafapPrescriptionId as String,
      cafapPrescriptionNum: cafapPrescriptionNum == freezed
          ? _value.cafapPrescriptionNum
          : cafapPrescriptionNum as int,
      cafapViolationConfirmed: cafapViolationConfirmed == freezed
          ? _value.cafapViolationConfirmed
          : cafapViolationConfirmed as bool,
      performMarks: performMarks == freezed
          ? _value.performMarks
          : performMarks as List<PerformMark>,
      performControls: performControls == freezed
          ? _value.performControls
          : performControls as List<PerformControlSearchResult>,
      extensionPeriods: extensionPeriods == freezed
          ? _value.extensionPeriods
          : extensionPeriods as List<ViolationExtensionPeriodSearchResult>,
      creationSentToCafap: creationSentToCafap == freezed
          ? _value.creationSentToCafap
          : creationSentToCafap as bool,
      closureSentToCafap: closureSentToCafap == freezed
          ? _value.closureSentToCafap
          : closureSentToCafap as bool,
      objectId: objectId == freezed ? _value.objectId : objectId as int,
      objectName:
          objectName == freezed ? _value.objectName : objectName as String,
    ));
  }

  @override
  $ViolationClassificationCopyWith<$Res> get eknViolationClassification {
    if (_value.eknViolationClassification == null) {
      return null;
    }
    return $ViolationClassificationCopyWith<$Res>(
        _value.eknViolationClassification, (value) {
      return _then(_value.copyWith(eknViolationClassification: value));
    });
  }

  @override
  $ViolationClassificationCopyWith<$Res> get otherViolationClassification {
    if (_value.otherViolationClassification == null) {
      return null;
    }
    return $ViolationClassificationCopyWith<$Res>(
        _value.otherViolationClassification, (value) {
      return _then(_value.copyWith(otherViolationClassification: value));
    });
  }

  @override
  $ObjectElementCopyWith<$Res> get objectElement {
    if (_value.objectElement == null) {
      return null;
    }
    return $ObjectElementCopyWith<$Res>(_value.objectElement, (value) {
      return _then(_value.copyWith(objectElement: value));
    });
  }

  @override
  $ContractorCopyWith<$Res> get violator {
    if (_value.violator == null) {
      return null;
    }
    return $ContractorCopyWith<$Res>(_value.violator, (value) {
      return _then(_value.copyWith(violator: value));
    });
  }

  @override
  $ViolationStatusCopyWith<$Res> get violationStatus {
    if (_value.violationStatus == null) {
      return null;
    }
    return $ViolationStatusCopyWith<$Res>(_value.violationStatus, (value) {
      return _then(_value.copyWith(violationStatus: value));
    });
  }

  @override
  $SourceCopyWith<$Res> get source {
    if (_value.source == null) {
      return null;
    }
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }

  @override
  $DCViolationKindCopyWith<$Res> get violationKind {
    if (_value.violationKind == null) {
      return null;
    }
    return $DCViolationKindCopyWith<$Res>(_value.violationKind, (value) {
      return _then(_value.copyWith(violationKind: value));
    });
  }
}

/// @nodoc
abstract class _$ViolationSearchResultCopyWith<$Res>
    implements $ViolationSearchResultCopyWith<$Res> {
  factory _$ViolationSearchResultCopyWith(_ViolationSearchResult value,
          $Res Function(_ViolationSearchResult) then) =
      __$ViolationSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
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
      DCViolationKind violationKind,
      String cafapAssigmentId,
      String cafapPrescriptionId,
      int cafapPrescriptionNum,
      bool cafapViolationConfirmed,
      List<PerformMark> performMarks,
      List<PerformControlSearchResult> performControls,
      List<ViolationExtensionPeriodSearchResult> extensionPeriods,
      bool creationSentToCafap,
      bool closureSentToCafap,
      int objectId,
      String objectName});

  @override
  $ViolationClassificationCopyWith<$Res> get eknViolationClassification;
  @override
  $ViolationClassificationCopyWith<$Res> get otherViolationClassification;
  @override
  $ObjectElementCopyWith<$Res> get objectElement;
  @override
  $ContractorCopyWith<$Res> get violator;
  @override
  $ViolationStatusCopyWith<$Res> get violationStatus;
  @override
  $SourceCopyWith<$Res> get source;
  @override
  $DCViolationKindCopyWith<$Res> get violationKind;
}

/// @nodoc
class __$ViolationSearchResultCopyWithImpl<$Res>
    extends _$ViolationSearchResultCopyWithImpl<$Res>
    implements _$ViolationSearchResultCopyWith<$Res> {
  __$ViolationSearchResultCopyWithImpl(_ViolationSearchResult _value,
      $Res Function(_ViolationSearchResult) _then)
      : super(_value, (v) => _then(v as _ViolationSearchResult));

  @override
  _ViolationSearchResult get _value => super._value as _ViolationSearchResult;

  @override
  $Res call({
    Object id = freezed,
    Object detectionDate = freezed,
    Object eknViolationClassification = freezed,
    Object otherViolationClassification = freezed,
    Object btiAddress = freezed,
    Object address = freezed,
    Object btiRefAddress = freezed,
    Object refAddressTinao = freezed,
    Object objectElement = freezed,
    Object description = freezed,
    Object violator = freezed,
    Object critical = freezed,
    Object resolveDate = freezed,
    Object controlDate = freezed,
    Object additionalFeatures = freezed,
    Object photos = freezed,
    Object violationNum = freezed,
    Object violationStatus = freezed,
    Object source = freezed,
    Object violationKind = freezed,
    Object cafapAssigmentId = freezed,
    Object cafapPrescriptionId = freezed,
    Object cafapPrescriptionNum = freezed,
    Object cafapViolationConfirmed = freezed,
    Object performMarks = freezed,
    Object performControls = freezed,
    Object extensionPeriods = freezed,
    Object creationSentToCafap = freezed,
    Object closureSentToCafap = freezed,
    Object objectId = freezed,
    Object objectName = freezed,
  }) {
    return _then(_ViolationSearchResult(
      id: id == freezed ? _value.id : id as int,
      detectionDate: detectionDate == freezed
          ? _value.detectionDate
          : detectionDate as DateTime,
      eknViolationClassification: eknViolationClassification == freezed
          ? _value.eknViolationClassification
          : eknViolationClassification as ViolationClassification,
      otherViolationClassification: otherViolationClassification == freezed
          ? _value.otherViolationClassification
          : otherViolationClassification as ViolationClassification,
      btiAddress:
          btiAddress == freezed ? _value.btiAddress : btiAddress as Address,
      address: address == freezed ? _value.address : address as String,
      btiRefAddress: btiRefAddress == freezed
          ? _value.btiRefAddress
          : btiRefAddress as Address,
      refAddressTinao: refAddressTinao == freezed
          ? _value.refAddressTinao
          : refAddressTinao as bool,
      objectElement: objectElement == freezed
          ? _value.objectElement
          : objectElement as ObjectElement,
      description:
          description == freezed ? _value.description : description as String,
      violator: violator == freezed ? _value.violator : violator as Contractor,
      critical: critical == freezed ? _value.critical : critical as bool,
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      controlDate:
          controlDate == freezed ? _value.controlDate : controlDate as DateTime,
      additionalFeatures: additionalFeatures == freezed
          ? _value.additionalFeatures
          : additionalFeatures as List<ViolationAdditionalFeature>,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      violationStatus: violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
      source: source == freezed ? _value.source : source as Source,
      violationKind: violationKind == freezed
          ? _value.violationKind
          : violationKind as DCViolationKind,
      cafapAssigmentId: cafapAssigmentId == freezed
          ? _value.cafapAssigmentId
          : cafapAssigmentId as String,
      cafapPrescriptionId: cafapPrescriptionId == freezed
          ? _value.cafapPrescriptionId
          : cafapPrescriptionId as String,
      cafapPrescriptionNum: cafapPrescriptionNum == freezed
          ? _value.cafapPrescriptionNum
          : cafapPrescriptionNum as int,
      cafapViolationConfirmed: cafapViolationConfirmed == freezed
          ? _value.cafapViolationConfirmed
          : cafapViolationConfirmed as bool,
      performMarks: performMarks == freezed
          ? _value.performMarks
          : performMarks as List<PerformMark>,
      performControls: performControls == freezed
          ? _value.performControls
          : performControls as List<PerformControlSearchResult>,
      extensionPeriods: extensionPeriods == freezed
          ? _value.extensionPeriods
          : extensionPeriods as List<ViolationExtensionPeriodSearchResult>,
      creationSentToCafap: creationSentToCafap == freezed
          ? _value.creationSentToCafap
          : creationSentToCafap as bool,
      closureSentToCafap: closureSentToCafap == freezed
          ? _value.closureSentToCafap
          : closureSentToCafap as bool,
      objectId: objectId == freezed ? _value.objectId : objectId as int,
      objectName:
          objectName == freezed ? _value.objectName : objectName as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationSearchResult implements _ViolationSearchResult {
  const _$_ViolationSearchResult(
      {this.id,
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
      this.performControls,
      this.extensionPeriods,
      this.creationSentToCafap,
      this.closureSentToCafap,
      this.objectId,
      this.objectName});

  factory _$_ViolationSearchResult.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationSearchResultFromJson(json);

  @override
  final int id;
  @override
  final DateTime detectionDate;
  @override
  final ViolationClassification eknViolationClassification;
  @override
  final ViolationClassification otherViolationClassification;
  @override
  final Address btiAddress;
  @override
  final String address;
  @override
  final Address btiRefAddress;
  @override
  final bool refAddressTinao;
  @override
  final ObjectElement objectElement;
  @override
  final String description;
  @override
  final Contractor violator;
  @override
  final bool critical;
  @override
  final DateTime resolveDate;
  @override
  final DateTime controlDate;
  @override
  final List<ViolationAdditionalFeature> additionalFeatures;
  @override
  final List<DCPhoto> photos;
  @override
  final String violationNum;
  @override
  final ViolationStatus violationStatus;
  @override
  final Source source;
  @override
  final DCViolationKind violationKind;
  @override
  final String cafapAssigmentId;
  @override
  final String cafapPrescriptionId;
  @override
  final int cafapPrescriptionNum;
  @override
  final bool cafapViolationConfirmed;
  @override
  final List<PerformMark> performMarks;
  @override
  final List<PerformControlSearchResult> performControls;
  @override
  final List<ViolationExtensionPeriodSearchResult> extensionPeriods;
  @override
  final bool creationSentToCafap;
  @override
  final bool closureSentToCafap;
  @override
  final int objectId;
  @override
  final String objectName;

  @override
  String toString() {
    return 'ViolationSearchResult(id: $id, detectionDate: $detectionDate, eknViolationClassification: $eknViolationClassification, otherViolationClassification: $otherViolationClassification, btiAddress: $btiAddress, address: $address, btiRefAddress: $btiRefAddress, refAddressTinao: $refAddressTinao, objectElement: $objectElement, description: $description, violator: $violator, critical: $critical, resolveDate: $resolveDate, controlDate: $controlDate, additionalFeatures: $additionalFeatures, photos: $photos, violationNum: $violationNum, violationStatus: $violationStatus, source: $source, violationKind: $violationKind, cafapAssigmentId: $cafapAssigmentId, cafapPrescriptionId: $cafapPrescriptionId, cafapPrescriptionNum: $cafapPrescriptionNum, cafapViolationConfirmed: $cafapViolationConfirmed, performMarks: $performMarks, performControls: $performControls, extensionPeriods: $extensionPeriods, creationSentToCafap: $creationSentToCafap, closureSentToCafap: $closureSentToCafap, objectId: $objectId, objectName: $objectName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationSearchResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.detectionDate, detectionDate) ||
                const DeepCollectionEquality()
                    .equals(other.detectionDate, detectionDate)) &&
            (identical(other.eknViolationClassification, eknViolationClassification) ||
                const DeepCollectionEquality().equals(
                    other.eknViolationClassification,
                    eknViolationClassification)) &&
            (identical(other.otherViolationClassification, otherViolationClassification) ||
                const DeepCollectionEquality().equals(
                    other.otherViolationClassification,
                    otherViolationClassification)) &&
            (identical(other.btiAddress, btiAddress) ||
                const DeepCollectionEquality()
                    .equals(other.btiAddress, btiAddress)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality()
                    .equals(other.address, address)) &&
            (identical(other.btiRefAddress, btiRefAddress) ||
                const DeepCollectionEquality()
                    .equals(other.btiRefAddress, btiRefAddress)) &&
            (identical(other.refAddressTinao, refAddressTinao) ||
                const DeepCollectionEquality()
                    .equals(other.refAddressTinao, refAddressTinao)) &&
            (identical(other.objectElement, objectElement) ||
                const DeepCollectionEquality()
                    .equals(other.objectElement, objectElement)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.violator, violator) ||
                const DeepCollectionEquality()
                    .equals(other.violator, violator)) &&
            (identical(other.critical, critical) ||
                const DeepCollectionEquality()
                    .equals(other.critical, critical)) &&
            (identical(other.resolveDate, resolveDate) ||
                const DeepCollectionEquality()
                    .equals(other.resolveDate, resolveDate)) &&
            (identical(other.controlDate, controlDate) ||
                const DeepCollectionEquality().equals(other.controlDate, controlDate)) &&
            (identical(other.additionalFeatures, additionalFeatures) || const DeepCollectionEquality().equals(other.additionalFeatures, additionalFeatures)) &&
            (identical(other.photos, photos) || const DeepCollectionEquality().equals(other.photos, photos)) &&
            (identical(other.violationNum, violationNum) || const DeepCollectionEquality().equals(other.violationNum, violationNum)) &&
            (identical(other.violationStatus, violationStatus) || const DeepCollectionEquality().equals(other.violationStatus, violationStatus)) &&
            (identical(other.source, source) || const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.violationKind, violationKind) || const DeepCollectionEquality().equals(other.violationKind, violationKind)) &&
            (identical(other.cafapAssigmentId, cafapAssigmentId) || const DeepCollectionEquality().equals(other.cafapAssigmentId, cafapAssigmentId)) &&
            (identical(other.cafapPrescriptionId, cafapPrescriptionId) || const DeepCollectionEquality().equals(other.cafapPrescriptionId, cafapPrescriptionId)) &&
            (identical(other.cafapPrescriptionNum, cafapPrescriptionNum) || const DeepCollectionEquality().equals(other.cafapPrescriptionNum, cafapPrescriptionNum)) &&
            (identical(other.cafapViolationConfirmed, cafapViolationConfirmed) || const DeepCollectionEquality().equals(other.cafapViolationConfirmed, cafapViolationConfirmed)) &&
            (identical(other.performMarks, performMarks) || const DeepCollectionEquality().equals(other.performMarks, performMarks)) &&
            (identical(other.performControls, performControls) || const DeepCollectionEquality().equals(other.performControls, performControls)) &&
            (identical(other.extensionPeriods, extensionPeriods) || const DeepCollectionEquality().equals(other.extensionPeriods, extensionPeriods)) &&
            (identical(other.creationSentToCafap, creationSentToCafap) || const DeepCollectionEquality().equals(other.creationSentToCafap, creationSentToCafap)) &&
            (identical(other.closureSentToCafap, closureSentToCafap) || const DeepCollectionEquality().equals(other.closureSentToCafap, closureSentToCafap)) &&
            (identical(other.objectId, objectId) || const DeepCollectionEquality().equals(other.objectId, objectId)) &&
            (identical(other.objectName, objectName) || const DeepCollectionEquality().equals(other.objectName, objectName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(detectionDate) ^
      const DeepCollectionEquality().hash(eknViolationClassification) ^
      const DeepCollectionEquality().hash(otherViolationClassification) ^
      const DeepCollectionEquality().hash(btiAddress) ^
      const DeepCollectionEquality().hash(address) ^
      const DeepCollectionEquality().hash(btiRefAddress) ^
      const DeepCollectionEquality().hash(refAddressTinao) ^
      const DeepCollectionEquality().hash(objectElement) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(violator) ^
      const DeepCollectionEquality().hash(critical) ^
      const DeepCollectionEquality().hash(resolveDate) ^
      const DeepCollectionEquality().hash(controlDate) ^
      const DeepCollectionEquality().hash(additionalFeatures) ^
      const DeepCollectionEquality().hash(photos) ^
      const DeepCollectionEquality().hash(violationNum) ^
      const DeepCollectionEquality().hash(violationStatus) ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(violationKind) ^
      const DeepCollectionEquality().hash(cafapAssigmentId) ^
      const DeepCollectionEquality().hash(cafapPrescriptionId) ^
      const DeepCollectionEquality().hash(cafapPrescriptionNum) ^
      const DeepCollectionEquality().hash(cafapViolationConfirmed) ^
      const DeepCollectionEquality().hash(performMarks) ^
      const DeepCollectionEquality().hash(performControls) ^
      const DeepCollectionEquality().hash(extensionPeriods) ^
      const DeepCollectionEquality().hash(creationSentToCafap) ^
      const DeepCollectionEquality().hash(closureSentToCafap) ^
      const DeepCollectionEquality().hash(objectId) ^
      const DeepCollectionEquality().hash(objectName);

  @JsonKey(ignore: true)
  @override
  _$ViolationSearchResultCopyWith<_ViolationSearchResult> get copyWith =>
      __$ViolationSearchResultCopyWithImpl<_ViolationSearchResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationSearchResultToJson(this);
  }
}

abstract class _ViolationSearchResult implements ViolationSearchResult {
  const factory _ViolationSearchResult(
      {int id,
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
      DCViolationKind violationKind,
      String cafapAssigmentId,
      String cafapPrescriptionId,
      int cafapPrescriptionNum,
      bool cafapViolationConfirmed,
      List<PerformMark> performMarks,
      List<PerformControlSearchResult> performControls,
      List<ViolationExtensionPeriodSearchResult> extensionPeriods,
      bool creationSentToCafap,
      bool closureSentToCafap,
      int objectId,
      String objectName}) = _$_ViolationSearchResult;

  factory _ViolationSearchResult.fromJson(Map<String, dynamic> json) =
      _$_ViolationSearchResult.fromJson;

  @override
  int get id;
  @override
  DateTime get detectionDate;
  @override
  ViolationClassification get eknViolationClassification;
  @override
  ViolationClassification get otherViolationClassification;
  @override
  Address get btiAddress;
  @override
  String get address;
  @override
  Address get btiRefAddress;
  @override
  bool get refAddressTinao;
  @override
  ObjectElement get objectElement;
  @override
  String get description;
  @override
  Contractor get violator;
  @override
  bool get critical;
  @override
  DateTime get resolveDate;
  @override
  DateTime get controlDate;
  @override
  List<ViolationAdditionalFeature> get additionalFeatures;
  @override
  List<DCPhoto> get photos;
  @override
  String get violationNum;
  @override
  ViolationStatus get violationStatus;
  @override
  Source get source;
  @override
  DCViolationKind get violationKind;
  @override
  String get cafapAssigmentId;
  @override
  String get cafapPrescriptionId;
  @override
  int get cafapPrescriptionNum;
  @override
  bool get cafapViolationConfirmed;
  @override
  List<PerformMark> get performMarks;
  @override
  List<PerformControlSearchResult> get performControls;
  @override
  List<ViolationExtensionPeriodSearchResult> get extensionPeriods;
  @override
  bool get creationSentToCafap;
  @override
  bool get closureSentToCafap;
  @override
  int get objectId;
  @override
  String get objectName;
  @override
  @JsonKey(ignore: true)
  _$ViolationSearchResultCopyWith<_ViolationSearchResult> get copyWith;
}
