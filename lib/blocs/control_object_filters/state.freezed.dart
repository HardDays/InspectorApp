// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlObjectFiltersTearOff {
  const _$ControlObjectFiltersTearOff();

// ignore: unused_element
  _ControlObjectFilters call(
      {DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      ViolationStatus violationStatus,
      DCViolationType dcViolationType,
      DCViolationKind dcViolationKind,
      Source source}) {
    return _ControlObjectFilters(
      surveyDateFrom: surveyDateFrom,
      surveyDateTo: surveyDateTo,
      violationExists: violationExists,
      violationNum: violationNum,
      violationStatus: violationStatus,
      dcViolationType: dcViolationType,
      dcViolationKind: dcViolationKind,
      source: source,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectFilters = _$ControlObjectFiltersTearOff();

/// @nodoc
mixin _$ControlObjectFilters {
  DateTime get surveyDateFrom;
  DateTime get surveyDateTo;
  bool get violationExists;
  String get violationNum;
  ViolationStatus get violationStatus;
  DCViolationType get dcViolationType;
  DCViolationKind get dcViolationKind;
  Source get source;

  @JsonKey(ignore: true)
  $ControlObjectFiltersCopyWith<ControlObjectFilters> get copyWith;
}

/// @nodoc
abstract class $ControlObjectFiltersCopyWith<$Res> {
  factory $ControlObjectFiltersCopyWith(ControlObjectFilters value,
          $Res Function(ControlObjectFilters) then) =
      _$ControlObjectFiltersCopyWithImpl<$Res>;
  $Res call(
      {DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      ViolationStatus violationStatus,
      DCViolationType dcViolationType,
      DCViolationKind dcViolationKind,
      Source source});

  $ViolationStatusCopyWith<$Res> get violationStatus;
  $DCViolationTypeCopyWith<$Res> get dcViolationType;
  $DCViolationKindCopyWith<$Res> get dcViolationKind;
  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class _$ControlObjectFiltersCopyWithImpl<$Res>
    implements $ControlObjectFiltersCopyWith<$Res> {
  _$ControlObjectFiltersCopyWithImpl(this._value, this._then);

  final ControlObjectFilters _value;
  // ignore: unused_field
  final $Res Function(ControlObjectFilters) _then;

  @override
  $Res call({
    Object surveyDateFrom = freezed,
    Object surveyDateTo = freezed,
    Object violationExists = freezed,
    Object violationNum = freezed,
    Object violationStatus = freezed,
    Object dcViolationType = freezed,
    Object dcViolationKind = freezed,
    Object source = freezed,
  }) {
    return _then(_value.copyWith(
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
      violationStatus: violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
      dcViolationType: dcViolationType == freezed
          ? _value.dcViolationType
          : dcViolationType as DCViolationType,
      dcViolationKind: dcViolationKind == freezed
          ? _value.dcViolationKind
          : dcViolationKind as DCViolationKind,
      source: source == freezed ? _value.source : source as Source,
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
  $DCViolationTypeCopyWith<$Res> get dcViolationType {
    if (_value.dcViolationType == null) {
      return null;
    }
    return $DCViolationTypeCopyWith<$Res>(_value.dcViolationType, (value) {
      return _then(_value.copyWith(dcViolationType: value));
    });
  }

  @override
  $DCViolationKindCopyWith<$Res> get dcViolationKind {
    if (_value.dcViolationKind == null) {
      return null;
    }
    return $DCViolationKindCopyWith<$Res>(_value.dcViolationKind, (value) {
      return _then(_value.copyWith(dcViolationKind: value));
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
}

/// @nodoc
abstract class _$ControlObjectFiltersCopyWith<$Res>
    implements $ControlObjectFiltersCopyWith<$Res> {
  factory _$ControlObjectFiltersCopyWith(_ControlObjectFilters value,
          $Res Function(_ControlObjectFilters) then) =
      __$ControlObjectFiltersCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      ViolationStatus violationStatus,
      DCViolationType dcViolationType,
      DCViolationKind dcViolationKind,
      Source source});

  @override
  $ViolationStatusCopyWith<$Res> get violationStatus;
  @override
  $DCViolationTypeCopyWith<$Res> get dcViolationType;
  @override
  $DCViolationKindCopyWith<$Res> get dcViolationKind;
  @override
  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class __$ControlObjectFiltersCopyWithImpl<$Res>
    extends _$ControlObjectFiltersCopyWithImpl<$Res>
    implements _$ControlObjectFiltersCopyWith<$Res> {
  __$ControlObjectFiltersCopyWithImpl(
      _ControlObjectFilters _value, $Res Function(_ControlObjectFilters) _then)
      : super(_value, (v) => _then(v as _ControlObjectFilters));

  @override
  _ControlObjectFilters get _value => super._value as _ControlObjectFilters;

  @override
  $Res call({
    Object surveyDateFrom = freezed,
    Object surveyDateTo = freezed,
    Object violationExists = freezed,
    Object violationNum = freezed,
    Object violationStatus = freezed,
    Object dcViolationType = freezed,
    Object dcViolationKind = freezed,
    Object source = freezed,
  }) {
    return _then(_ControlObjectFilters(
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
      violationStatus: violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
      dcViolationType: dcViolationType == freezed
          ? _value.dcViolationType
          : dcViolationType as DCViolationType,
      dcViolationKind: dcViolationKind == freezed
          ? _value.dcViolationKind
          : dcViolationKind as DCViolationKind,
      source: source == freezed ? _value.source : source as Source,
    ));
  }
}

/// @nodoc
class _$_ControlObjectFilters implements _ControlObjectFilters {
  const _$_ControlObjectFilters(
      {this.surveyDateFrom,
      this.surveyDateTo,
      this.violationExists,
      this.violationNum,
      this.violationStatus,
      this.dcViolationType,
      this.dcViolationKind,
      this.source});

  @override
  final DateTime surveyDateFrom;
  @override
  final DateTime surveyDateTo;
  @override
  final bool violationExists;
  @override
  final String violationNum;
  @override
  final ViolationStatus violationStatus;
  @override
  final DCViolationType dcViolationType;
  @override
  final DCViolationKind dcViolationKind;
  @override
  final Source source;

  @override
  String toString() {
    return 'ControlObjectFilters(surveyDateFrom: $surveyDateFrom, surveyDateTo: $surveyDateTo, violationExists: $violationExists, violationNum: $violationNum, violationStatus: $violationStatus, dcViolationType: $dcViolationType, dcViolationKind: $dcViolationKind, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlObjectFilters &&
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
            (identical(other.violationStatus, violationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.violationStatus, violationStatus)) &&
            (identical(other.dcViolationType, dcViolationType) ||
                const DeepCollectionEquality()
                    .equals(other.dcViolationType, dcViolationType)) &&
            (identical(other.dcViolationKind, dcViolationKind) ||
                const DeepCollectionEquality()
                    .equals(other.dcViolationKind, dcViolationKind)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(surveyDateFrom) ^
      const DeepCollectionEquality().hash(surveyDateTo) ^
      const DeepCollectionEquality().hash(violationExists) ^
      const DeepCollectionEquality().hash(violationNum) ^
      const DeepCollectionEquality().hash(violationStatus) ^
      const DeepCollectionEquality().hash(dcViolationType) ^
      const DeepCollectionEquality().hash(dcViolationKind) ^
      const DeepCollectionEquality().hash(source);

  @JsonKey(ignore: true)
  @override
  _$ControlObjectFiltersCopyWith<_ControlObjectFilters> get copyWith =>
      __$ControlObjectFiltersCopyWithImpl<_ControlObjectFilters>(
          this, _$identity);
}

abstract class _ControlObjectFilters implements ControlObjectFilters {
  const factory _ControlObjectFilters(
      {DateTime surveyDateFrom,
      DateTime surveyDateTo,
      bool violationExists,
      String violationNum,
      ViolationStatus violationStatus,
      DCViolationType dcViolationType,
      DCViolationKind dcViolationKind,
      Source source}) = _$_ControlObjectFilters;

  @override
  DateTime get surveyDateFrom;
  @override
  DateTime get surveyDateTo;
  @override
  bool get violationExists;
  @override
  String get violationNum;
  @override
  ViolationStatus get violationStatus;
  @override
  DCViolationType get dcViolationType;
  @override
  DCViolationKind get dcViolationKind;
  @override
  Source get source;
  @override
  @JsonKey(ignore: true)
  _$ControlObjectFiltersCopyWith<_ControlObjectFilters> get copyWith;
}
