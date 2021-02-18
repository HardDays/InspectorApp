// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_short_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationShortSearchResult _$ViolationShortSearchResultFromJson(
    Map<String, dynamic> json) {
  return _ViolationShortSearchResult.fromJson(json);
}

/// @nodoc
class _$ViolationShortSearchResultTearOff {
  const _$ViolationShortSearchResultTearOff();

// ignore: unused_element
  _ViolationShortSearchResult call(
      {int id,
      String violationNum,
      ViolationStatus violationStatus,
      DateTime detectionDate,
      Source source,
      ObjectElement objectElement,
      ViolationName eknViolationName,
      ViolationName otherViolationName,
      DateTime resolveDate,
      DateTime controlDate,
      List<DCPhoto> photos}) {
    return _ViolationShortSearchResult(
      id: id,
      violationNum: violationNum,
      violationStatus: violationStatus,
      detectionDate: detectionDate,
      source: source,
      objectElement: objectElement,
      eknViolationName: eknViolationName,
      otherViolationName: otherViolationName,
      resolveDate: resolveDate,
      controlDate: controlDate,
      photos: photos,
    );
  }

// ignore: unused_element
  ViolationShortSearchResult fromJson(Map<String, Object> json) {
    return ViolationShortSearchResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationShortSearchResult = _$ViolationShortSearchResultTearOff();

/// @nodoc
mixin _$ViolationShortSearchResult {
  int get id;
  String get violationNum;
  ViolationStatus get violationStatus;
  DateTime get detectionDate;
  Source get source;
  ObjectElement get objectElement;
  ViolationName get eknViolationName;
  ViolationName get otherViolationName;
  DateTime get resolveDate;
  DateTime get controlDate;
  List<DCPhoto> get photos;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationShortSearchResultCopyWith<ViolationShortSearchResult> get copyWith;
}

/// @nodoc
abstract class $ViolationShortSearchResultCopyWith<$Res> {
  factory $ViolationShortSearchResultCopyWith(ViolationShortSearchResult value,
          $Res Function(ViolationShortSearchResult) then) =
      _$ViolationShortSearchResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String violationNum,
      ViolationStatus violationStatus,
      DateTime detectionDate,
      Source source,
      ObjectElement objectElement,
      ViolationName eknViolationName,
      ViolationName otherViolationName,
      DateTime resolveDate,
      DateTime controlDate,
      List<DCPhoto> photos});

  $ViolationStatusCopyWith<$Res> get violationStatus;
  $SourceCopyWith<$Res> get source;
  $ObjectElementCopyWith<$Res> get objectElement;
  $ViolationNameCopyWith<$Res> get eknViolationName;
  $ViolationNameCopyWith<$Res> get otherViolationName;
}

/// @nodoc
class _$ViolationShortSearchResultCopyWithImpl<$Res>
    implements $ViolationShortSearchResultCopyWith<$Res> {
  _$ViolationShortSearchResultCopyWithImpl(this._value, this._then);

  final ViolationShortSearchResult _value;
  // ignore: unused_field
  final $Res Function(ViolationShortSearchResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object violationNum = freezed,
    Object violationStatus = freezed,
    Object detectionDate = freezed,
    Object source = freezed,
    Object objectElement = freezed,
    Object eknViolationName = freezed,
    Object otherViolationName = freezed,
    Object resolveDate = freezed,
    Object controlDate = freezed,
    Object photos = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      violationStatus: violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
      detectionDate: detectionDate == freezed
          ? _value.detectionDate
          : detectionDate as DateTime,
      source: source == freezed ? _value.source : source as Source,
      objectElement: objectElement == freezed
          ? _value.objectElement
          : objectElement as ObjectElement,
      eknViolationName: eknViolationName == freezed
          ? _value.eknViolationName
          : eknViolationName as ViolationName,
      otherViolationName: otherViolationName == freezed
          ? _value.otherViolationName
          : otherViolationName as ViolationName,
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      controlDate:
          controlDate == freezed ? _value.controlDate : controlDate as DateTime,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
    ));
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
  $ObjectElementCopyWith<$Res> get objectElement {
    if (_value.objectElement == null) {
      return null;
    }
    return $ObjectElementCopyWith<$Res>(_value.objectElement, (value) {
      return _then(_value.copyWith(objectElement: value));
    });
  }

  @override
  $ViolationNameCopyWith<$Res> get eknViolationName {
    if (_value.eknViolationName == null) {
      return null;
    }
    return $ViolationNameCopyWith<$Res>(_value.eknViolationName, (value) {
      return _then(_value.copyWith(eknViolationName: value));
    });
  }

  @override
  $ViolationNameCopyWith<$Res> get otherViolationName {
    if (_value.otherViolationName == null) {
      return null;
    }
    return $ViolationNameCopyWith<$Res>(_value.otherViolationName, (value) {
      return _then(_value.copyWith(otherViolationName: value));
    });
  }
}

/// @nodoc
abstract class _$ViolationShortSearchResultCopyWith<$Res>
    implements $ViolationShortSearchResultCopyWith<$Res> {
  factory _$ViolationShortSearchResultCopyWith(
          _ViolationShortSearchResult value,
          $Res Function(_ViolationShortSearchResult) then) =
      __$ViolationShortSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String violationNum,
      ViolationStatus violationStatus,
      DateTime detectionDate,
      Source source,
      ObjectElement objectElement,
      ViolationName eknViolationName,
      ViolationName otherViolationName,
      DateTime resolveDate,
      DateTime controlDate,
      List<DCPhoto> photos});

  @override
  $ViolationStatusCopyWith<$Res> get violationStatus;
  @override
  $SourceCopyWith<$Res> get source;
  @override
  $ObjectElementCopyWith<$Res> get objectElement;
  @override
  $ViolationNameCopyWith<$Res> get eknViolationName;
  @override
  $ViolationNameCopyWith<$Res> get otherViolationName;
}

/// @nodoc
class __$ViolationShortSearchResultCopyWithImpl<$Res>
    extends _$ViolationShortSearchResultCopyWithImpl<$Res>
    implements _$ViolationShortSearchResultCopyWith<$Res> {
  __$ViolationShortSearchResultCopyWithImpl(_ViolationShortSearchResult _value,
      $Res Function(_ViolationShortSearchResult) _then)
      : super(_value, (v) => _then(v as _ViolationShortSearchResult));

  @override
  _ViolationShortSearchResult get _value =>
      super._value as _ViolationShortSearchResult;

  @override
  $Res call({
    Object id = freezed,
    Object violationNum = freezed,
    Object violationStatus = freezed,
    Object detectionDate = freezed,
    Object source = freezed,
    Object objectElement = freezed,
    Object eknViolationName = freezed,
    Object otherViolationName = freezed,
    Object resolveDate = freezed,
    Object controlDate = freezed,
    Object photos = freezed,
  }) {
    return _then(_ViolationShortSearchResult(
      id: id == freezed ? _value.id : id as int,
      violationNum: violationNum == freezed
          ? _value.violationNum
          : violationNum as String,
      violationStatus: violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
      detectionDate: detectionDate == freezed
          ? _value.detectionDate
          : detectionDate as DateTime,
      source: source == freezed ? _value.source : source as Source,
      objectElement: objectElement == freezed
          ? _value.objectElement
          : objectElement as ObjectElement,
      eknViolationName: eknViolationName == freezed
          ? _value.eknViolationName
          : eknViolationName as ViolationName,
      otherViolationName: otherViolationName == freezed
          ? _value.otherViolationName
          : otherViolationName as ViolationName,
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      controlDate:
          controlDate == freezed ? _value.controlDate : controlDate as DateTime,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationShortSearchResult implements _ViolationShortSearchResult {
  const _$_ViolationShortSearchResult(
      {this.id,
      this.violationNum,
      this.violationStatus,
      this.detectionDate,
      this.source,
      this.objectElement,
      this.eknViolationName,
      this.otherViolationName,
      this.resolveDate,
      this.controlDate,
      this.photos});

  factory _$_ViolationShortSearchResult.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationShortSearchResultFromJson(json);

  @override
  final int id;
  @override
  final String violationNum;
  @override
  final ViolationStatus violationStatus;
  @override
  final DateTime detectionDate;
  @override
  final Source source;
  @override
  final ObjectElement objectElement;
  @override
  final ViolationName eknViolationName;
  @override
  final ViolationName otherViolationName;
  @override
  final DateTime resolveDate;
  @override
  final DateTime controlDate;
  @override
  final List<DCPhoto> photos;

  @override
  String toString() {
    return 'ViolationShortSearchResult(id: $id, violationNum: $violationNum, violationStatus: $violationStatus, detectionDate: $detectionDate, source: $source, objectElement: $objectElement, eknViolationName: $eknViolationName, otherViolationName: $otherViolationName, resolveDate: $resolveDate, controlDate: $controlDate, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationShortSearchResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.violationNum, violationNum) ||
                const DeepCollectionEquality()
                    .equals(other.violationNum, violationNum)) &&
            (identical(other.violationStatus, violationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.violationStatus, violationStatus)) &&
            (identical(other.detectionDate, detectionDate) ||
                const DeepCollectionEquality()
                    .equals(other.detectionDate, detectionDate)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)) &&
            (identical(other.objectElement, objectElement) ||
                const DeepCollectionEquality()
                    .equals(other.objectElement, objectElement)) &&
            (identical(other.eknViolationName, eknViolationName) ||
                const DeepCollectionEquality()
                    .equals(other.eknViolationName, eknViolationName)) &&
            (identical(other.otherViolationName, otherViolationName) ||
                const DeepCollectionEquality()
                    .equals(other.otherViolationName, otherViolationName)) &&
            (identical(other.resolveDate, resolveDate) ||
                const DeepCollectionEquality()
                    .equals(other.resolveDate, resolveDate)) &&
            (identical(other.controlDate, controlDate) ||
                const DeepCollectionEquality()
                    .equals(other.controlDate, controlDate)) &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(violationNum) ^
      const DeepCollectionEquality().hash(violationStatus) ^
      const DeepCollectionEquality().hash(detectionDate) ^
      const DeepCollectionEquality().hash(source) ^
      const DeepCollectionEquality().hash(objectElement) ^
      const DeepCollectionEquality().hash(eknViolationName) ^
      const DeepCollectionEquality().hash(otherViolationName) ^
      const DeepCollectionEquality().hash(resolveDate) ^
      const DeepCollectionEquality().hash(controlDate) ^
      const DeepCollectionEquality().hash(photos);

  @JsonKey(ignore: true)
  @override
  _$ViolationShortSearchResultCopyWith<_ViolationShortSearchResult>
      get copyWith => __$ViolationShortSearchResultCopyWithImpl<
          _ViolationShortSearchResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationShortSearchResultToJson(this);
  }
}

abstract class _ViolationShortSearchResult
    implements ViolationShortSearchResult {
  const factory _ViolationShortSearchResult(
      {int id,
      String violationNum,
      ViolationStatus violationStatus,
      DateTime detectionDate,
      Source source,
      ObjectElement objectElement,
      ViolationName eknViolationName,
      ViolationName otherViolationName,
      DateTime resolveDate,
      DateTime controlDate,
      List<DCPhoto> photos}) = _$_ViolationShortSearchResult;

  factory _ViolationShortSearchResult.fromJson(Map<String, dynamic> json) =
      _$_ViolationShortSearchResult.fromJson;

  @override
  int get id;
  @override
  String get violationNum;
  @override
  ViolationStatus get violationStatus;
  @override
  DateTime get detectionDate;
  @override
  Source get source;
  @override
  ObjectElement get objectElement;
  @override
  ViolationName get eknViolationName;
  @override
  ViolationName get otherViolationName;
  @override
  DateTime get resolveDate;
  @override
  DateTime get controlDate;
  @override
  List<DCPhoto> get photos;
  @override
  @JsonKey(ignore: true)
  _$ViolationShortSearchResultCopyWith<_ViolationShortSearchResult>
      get copyWith;
}
