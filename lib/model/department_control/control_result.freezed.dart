// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'control_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ControlResult _$ControlResultFromJson(Map<String, dynamic> json) {
  return _ControlResult.fromJson(json);
}

/// @nodoc
class _$ControlResultTearOff {
  const _$ControlResultTearOff();

// ignore: unused_element
  _ControlResult call(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      DCViolation violation}) {
    return _ControlResult(
      id: id,
      surveyDate: surveyDate,
      geometryX: geometryX,
      geometryY: geometryY,
      violationExists: violationExists,
      violation: violation,
    );
  }

// ignore: unused_element
  ControlResult fromJson(Map<String, Object> json) {
    return ControlResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ControlResult = _$ControlResultTearOff();

/// @nodoc
mixin _$ControlResult {
  int get id;
  DateTime get surveyDate;
  double get geometryX;
  double get geometryY;
  bool get violationExists;
  DCViolation get violation;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ControlResultCopyWith<ControlResult> get copyWith;
}

/// @nodoc
abstract class $ControlResultCopyWith<$Res> {
  factory $ControlResultCopyWith(
          ControlResult value, $Res Function(ControlResult) then) =
      _$ControlResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      DCViolation violation});

  $DCViolationCopyWith<$Res> get violation;
}

/// @nodoc
class _$ControlResultCopyWithImpl<$Res>
    implements $ControlResultCopyWith<$Res> {
  _$ControlResultCopyWithImpl(this._value, this._then);

  final ControlResult _value;
  // ignore: unused_field
  final $Res Function(ControlResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object surveyDate = freezed,
    Object geometryX = freezed,
    Object geometryY = freezed,
    Object violationExists = freezed,
    Object violation = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      surveyDate:
          surveyDate == freezed ? _value.surveyDate : surveyDate as DateTime,
      geometryX: geometryX == freezed ? _value.geometryX : geometryX as double,
      geometryY: geometryY == freezed ? _value.geometryY : geometryY as double,
      violationExists: violationExists == freezed
          ? _value.violationExists
          : violationExists as bool,
      violation:
          violation == freezed ? _value.violation : violation as DCViolation,
    ));
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
abstract class _$ControlResultCopyWith<$Res>
    implements $ControlResultCopyWith<$Res> {
  factory _$ControlResultCopyWith(
          _ControlResult value, $Res Function(_ControlResult) then) =
      __$ControlResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      DCViolation violation});

  @override
  $DCViolationCopyWith<$Res> get violation;
}

/// @nodoc
class __$ControlResultCopyWithImpl<$Res>
    extends _$ControlResultCopyWithImpl<$Res>
    implements _$ControlResultCopyWith<$Res> {
  __$ControlResultCopyWithImpl(
      _ControlResult _value, $Res Function(_ControlResult) _then)
      : super(_value, (v) => _then(v as _ControlResult));

  @override
  _ControlResult get _value => super._value as _ControlResult;

  @override
  $Res call({
    Object id = freezed,
    Object surveyDate = freezed,
    Object geometryX = freezed,
    Object geometryY = freezed,
    Object violationExists = freezed,
    Object violation = freezed,
  }) {
    return _then(_ControlResult(
      id: id == freezed ? _value.id : id as int,
      surveyDate:
          surveyDate == freezed ? _value.surveyDate : surveyDate as DateTime,
      geometryX: geometryX == freezed ? _value.geometryX : geometryX as double,
      geometryY: geometryY == freezed ? _value.geometryY : geometryY as double,
      violationExists: violationExists == freezed
          ? _value.violationExists
          : violationExists as bool,
      violation:
          violation == freezed ? _value.violation : violation as DCViolation,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ControlResult implements _ControlResult {
  const _$_ControlResult(
      {this.id,
      this.surveyDate,
      this.geometryX,
      this.geometryY,
      this.violationExists,
      this.violation});

  factory _$_ControlResult.fromJson(Map<String, dynamic> json) =>
      _$_$_ControlResultFromJson(json);

  @override
  final int id;
  @override
  final DateTime surveyDate;
  @override
  final double geometryX;
  @override
  final double geometryY;
  @override
  final bool violationExists;
  @override
  final DCViolation violation;

  @override
  String toString() {
    return 'ControlResult(id: $id, surveyDate: $surveyDate, geometryX: $geometryX, geometryY: $geometryY, violationExists: $violationExists, violation: $violation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlResult &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.surveyDate, surveyDate) ||
                const DeepCollectionEquality()
                    .equals(other.surveyDate, surveyDate)) &&
            (identical(other.geometryX, geometryX) ||
                const DeepCollectionEquality()
                    .equals(other.geometryX, geometryX)) &&
            (identical(other.geometryY, geometryY) ||
                const DeepCollectionEquality()
                    .equals(other.geometryY, geometryY)) &&
            (identical(other.violationExists, violationExists) ||
                const DeepCollectionEquality()
                    .equals(other.violationExists, violationExists)) &&
            (identical(other.violation, violation) ||
                const DeepCollectionEquality()
                    .equals(other.violation, violation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(surveyDate) ^
      const DeepCollectionEquality().hash(geometryX) ^
      const DeepCollectionEquality().hash(geometryY) ^
      const DeepCollectionEquality().hash(violationExists) ^
      const DeepCollectionEquality().hash(violation);

  @JsonKey(ignore: true)
  @override
  _$ControlResultCopyWith<_ControlResult> get copyWith =>
      __$ControlResultCopyWithImpl<_ControlResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ControlResultToJson(this);
  }
}

abstract class _ControlResult implements ControlResult {
  const factory _ControlResult(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      DCViolation violation}) = _$_ControlResult;

  factory _ControlResult.fromJson(Map<String, dynamic> json) =
      _$_ControlResult.fromJson;

  @override
  int get id;
  @override
  DateTime get surveyDate;
  @override
  double get geometryX;
  @override
  double get geometryY;
  @override
  bool get violationExists;
  @override
  DCViolation get violation;
  @override
  @JsonKey(ignore: true)
  _$ControlResultCopyWith<_ControlResult> get copyWith;
}
