// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'control_result_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ControlResultSearchResult _$ControlResultSearchResultFromJson(
    Map<String, dynamic> json) {
  return _ControlResultSearchResult.fromJson(json);
}

/// @nodoc
class _$ControlResultSearchResultTearOff {
  const _$ControlResultSearchResultTearOff();

// ignore: unused_element
  _ControlResultSearchResult call(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      ViolationSearchResult violation,
      bool creationSentToCafap,
      bool closureSentToCafap}) {
    return _ControlResultSearchResult(
      id: id,
      surveyDate: surveyDate,
      geometryX: geometryX,
      geometryY: geometryY,
      violationExists: violationExists,
      violation: violation,
      creationSentToCafap: creationSentToCafap,
      closureSentToCafap: closureSentToCafap,
    );
  }

// ignore: unused_element
  ControlResultSearchResult fromJson(Map<String, Object> json) {
    return ControlResultSearchResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ControlResultSearchResult = _$ControlResultSearchResultTearOff();

/// @nodoc
mixin _$ControlResultSearchResult {
  int get id;
  DateTime get surveyDate;
  double get geometryX;
  double get geometryY;
  bool get violationExists;
  ViolationSearchResult get violation;
  bool get creationSentToCafap;
  bool get closureSentToCafap;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ControlResultSearchResultCopyWith<ControlResultSearchResult> get copyWith;
}

/// @nodoc
abstract class $ControlResultSearchResultCopyWith<$Res> {
  factory $ControlResultSearchResultCopyWith(ControlResultSearchResult value,
          $Res Function(ControlResultSearchResult) then) =
      _$ControlResultSearchResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      ViolationSearchResult violation,
      bool creationSentToCafap,
      bool closureSentToCafap});

  $ViolationSearchResultCopyWith<$Res> get violation;
}

/// @nodoc
class _$ControlResultSearchResultCopyWithImpl<$Res>
    implements $ControlResultSearchResultCopyWith<$Res> {
  _$ControlResultSearchResultCopyWithImpl(this._value, this._then);

  final ControlResultSearchResult _value;
  // ignore: unused_field
  final $Res Function(ControlResultSearchResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object surveyDate = freezed,
    Object geometryX = freezed,
    Object geometryY = freezed,
    Object violationExists = freezed,
    Object violation = freezed,
    Object creationSentToCafap = freezed,
    Object closureSentToCafap = freezed,
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
      violation: violation == freezed
          ? _value.violation
          : violation as ViolationSearchResult,
      creationSentToCafap: creationSentToCafap == freezed
          ? _value.creationSentToCafap
          : creationSentToCafap as bool,
      closureSentToCafap: closureSentToCafap == freezed
          ? _value.closureSentToCafap
          : closureSentToCafap as bool,
    ));
  }

  @override
  $ViolationSearchResultCopyWith<$Res> get violation {
    if (_value.violation == null) {
      return null;
    }
    return $ViolationSearchResultCopyWith<$Res>(_value.violation, (value) {
      return _then(_value.copyWith(violation: value));
    });
  }
}

/// @nodoc
abstract class _$ControlResultSearchResultCopyWith<$Res>
    implements $ControlResultSearchResultCopyWith<$Res> {
  factory _$ControlResultSearchResultCopyWith(_ControlResultSearchResult value,
          $Res Function(_ControlResultSearchResult) then) =
      __$ControlResultSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      ViolationSearchResult violation,
      bool creationSentToCafap,
      bool closureSentToCafap});

  @override
  $ViolationSearchResultCopyWith<$Res> get violation;
}

/// @nodoc
class __$ControlResultSearchResultCopyWithImpl<$Res>
    extends _$ControlResultSearchResultCopyWithImpl<$Res>
    implements _$ControlResultSearchResultCopyWith<$Res> {
  __$ControlResultSearchResultCopyWithImpl(_ControlResultSearchResult _value,
      $Res Function(_ControlResultSearchResult) _then)
      : super(_value, (v) => _then(v as _ControlResultSearchResult));

  @override
  _ControlResultSearchResult get _value =>
      super._value as _ControlResultSearchResult;

  @override
  $Res call({
    Object id = freezed,
    Object surveyDate = freezed,
    Object geometryX = freezed,
    Object geometryY = freezed,
    Object violationExists = freezed,
    Object violation = freezed,
    Object creationSentToCafap = freezed,
    Object closureSentToCafap = freezed,
  }) {
    return _then(_ControlResultSearchResult(
      id: id == freezed ? _value.id : id as int,
      surveyDate:
          surveyDate == freezed ? _value.surveyDate : surveyDate as DateTime,
      geometryX: geometryX == freezed ? _value.geometryX : geometryX as double,
      geometryY: geometryY == freezed ? _value.geometryY : geometryY as double,
      violationExists: violationExists == freezed
          ? _value.violationExists
          : violationExists as bool,
      violation: violation == freezed
          ? _value.violation
          : violation as ViolationSearchResult,
      creationSentToCafap: creationSentToCafap == freezed
          ? _value.creationSentToCafap
          : creationSentToCafap as bool,
      closureSentToCafap: closureSentToCafap == freezed
          ? _value.closureSentToCafap
          : closureSentToCafap as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ControlResultSearchResult implements _ControlResultSearchResult {
  const _$_ControlResultSearchResult(
      {this.id,
      this.surveyDate,
      this.geometryX,
      this.geometryY,
      this.violationExists,
      this.violation,
      this.creationSentToCafap,
      this.closureSentToCafap});

  factory _$_ControlResultSearchResult.fromJson(Map<String, dynamic> json) =>
      _$_$_ControlResultSearchResultFromJson(json);

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
  final ViolationSearchResult violation;
  @override
  final bool creationSentToCafap;
  @override
  final bool closureSentToCafap;

  @override
  String toString() {
    return 'ControlResultSearchResult(id: $id, surveyDate: $surveyDate, geometryX: $geometryX, geometryY: $geometryY, violationExists: $violationExists, violation: $violation, creationSentToCafap: $creationSentToCafap, closureSentToCafap: $closureSentToCafap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlResultSearchResult &&
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
                    .equals(other.violation, violation)) &&
            (identical(other.creationSentToCafap, creationSentToCafap) ||
                const DeepCollectionEquality()
                    .equals(other.creationSentToCafap, creationSentToCafap)) &&
            (identical(other.closureSentToCafap, closureSentToCafap) ||
                const DeepCollectionEquality()
                    .equals(other.closureSentToCafap, closureSentToCafap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(surveyDate) ^
      const DeepCollectionEquality().hash(geometryX) ^
      const DeepCollectionEquality().hash(geometryY) ^
      const DeepCollectionEquality().hash(violationExists) ^
      const DeepCollectionEquality().hash(violation) ^
      const DeepCollectionEquality().hash(creationSentToCafap) ^
      const DeepCollectionEquality().hash(closureSentToCafap);

  @JsonKey(ignore: true)
  @override
  _$ControlResultSearchResultCopyWith<_ControlResultSearchResult>
      get copyWith =>
          __$ControlResultSearchResultCopyWithImpl<_ControlResultSearchResult>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ControlResultSearchResultToJson(this);
  }
}

abstract class _ControlResultSearchResult implements ControlResultSearchResult {
  const factory _ControlResultSearchResult(
      {int id,
      DateTime surveyDate,
      double geometryX,
      double geometryY,
      bool violationExists,
      ViolationSearchResult violation,
      bool creationSentToCafap,
      bool closureSentToCafap}) = _$_ControlResultSearchResult;

  factory _ControlResultSearchResult.fromJson(Map<String, dynamic> json) =
      _$_ControlResultSearchResult.fromJson;

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
  ViolationSearchResult get violation;
  @override
  bool get creationSentToCafap;
  @override
  bool get closureSentToCafap;
  @override
  @JsonKey(ignore: true)
  _$ControlResultSearchResultCopyWith<_ControlResultSearchResult> get copyWith;
}
