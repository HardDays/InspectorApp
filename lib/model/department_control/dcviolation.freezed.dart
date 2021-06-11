// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dcviolation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DCViolation _$DCViolationFromJson(Map<String, dynamic> json) {
  return _DCViolation.fromJson(json);
}

/// @nodoc
class _$DCViolationTearOff {
  const _$DCViolationTearOff();

// ignore: unused_element
  _DCViolation call(
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
      List<DCPhoto> photos}) {
    return _DCViolation(
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
    );
  }

// ignore: unused_element
  DCViolation fromJson(Map<String, Object> json) {
    return DCViolation.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DCViolation = _$DCViolationTearOff();

/// @nodoc
mixin _$DCViolation {
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

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DCViolationCopyWith<DCViolation> get copyWith;
}

/// @nodoc
abstract class $DCViolationCopyWith<$Res> {
  factory $DCViolationCopyWith(
          DCViolation value, $Res Function(DCViolation) then) =
      _$DCViolationCopyWithImpl<$Res>;
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
      List<DCPhoto> photos});

  $ViolationClassificationCopyWith<$Res> get eknViolationClassification;
  $ViolationClassificationCopyWith<$Res> get otherViolationClassification;
  $ObjectElementCopyWith<$Res> get objectElement;
  $ContractorCopyWith<$Res> get violator;
}

/// @nodoc
class _$DCViolationCopyWithImpl<$Res> implements $DCViolationCopyWith<$Res> {
  _$DCViolationCopyWithImpl(this._value, this._then);

  final DCViolation _value;
  // ignore: unused_field
  final $Res Function(DCViolation) _then;

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
}

/// @nodoc
abstract class _$DCViolationCopyWith<$Res>
    implements $DCViolationCopyWith<$Res> {
  factory _$DCViolationCopyWith(
          _DCViolation value, $Res Function(_DCViolation) then) =
      __$DCViolationCopyWithImpl<$Res>;
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
      List<DCPhoto> photos});

  @override
  $ViolationClassificationCopyWith<$Res> get eknViolationClassification;
  @override
  $ViolationClassificationCopyWith<$Res> get otherViolationClassification;
  @override
  $ObjectElementCopyWith<$Res> get objectElement;
  @override
  $ContractorCopyWith<$Res> get violator;
}

/// @nodoc
class __$DCViolationCopyWithImpl<$Res> extends _$DCViolationCopyWithImpl<$Res>
    implements _$DCViolationCopyWith<$Res> {
  __$DCViolationCopyWithImpl(
      _DCViolation _value, $Res Function(_DCViolation) _then)
      : super(_value, (v) => _then(v as _DCViolation));

  @override
  _DCViolation get _value => super._value as _DCViolation;

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
  }) {
    return _then(_DCViolation(
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
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DCViolation implements _DCViolation {
  const _$_DCViolation(
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
      this.photos});

  factory _$_DCViolation.fromJson(Map<String, dynamic> json) =>
      _$_$_DCViolationFromJson(json);

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
  String toString() {
    return 'DCViolation(id: $id, detectionDate: $detectionDate, eknViolationClassification: $eknViolationClassification, otherViolationClassification: $otherViolationClassification, btiAddress: $btiAddress, address: $address, btiRefAddress: $btiRefAddress, refAddressTinao: $refAddressTinao, objectElement: $objectElement, description: $description, violator: $violator, critical: $critical, resolveDate: $resolveDate, controlDate: $controlDate, additionalFeatures: $additionalFeatures, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DCViolation &&
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
            (identical(other.photos, photos) || const DeepCollectionEquality().equals(other.photos, photos)));
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
      const DeepCollectionEquality().hash(photos);

  @JsonKey(ignore: true)
  @override
  _$DCViolationCopyWith<_DCViolation> get copyWith =>
      __$DCViolationCopyWithImpl<_DCViolation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DCViolationToJson(this);
  }
}

abstract class _DCViolation implements DCViolation {
  const factory _DCViolation(
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
      List<DCPhoto> photos}) = _$_DCViolation;

  factory _DCViolation.fromJson(Map<String, dynamic> json) =
      _$_DCViolation.fromJson;

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
  @JsonKey(ignore: true)
  _$DCViolationCopyWith<_DCViolation> get copyWith;
}
