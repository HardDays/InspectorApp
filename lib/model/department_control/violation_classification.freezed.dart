// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_classification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationClassification _$ViolationClassificationFromJson(
    Map<String, dynamic> json) {
  return _ViolationClassification.fromJson(json);
}

/// @nodoc
class _$ViolationClassificationTearOff {
  const _$ViolationClassificationTearOff();

// ignore: unused_element
  _ViolationClassification call({int id, ViolationName violationName}) {
    return _ViolationClassification(
      id: id,
      violationName: violationName,
    );
  }

// ignore: unused_element
  ViolationClassification fromJson(Map<String, Object> json) {
    return ViolationClassification.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationClassification = _$ViolationClassificationTearOff();

/// @nodoc
mixin _$ViolationClassification {
  int get id;
  ViolationName get violationName;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationClassificationCopyWith<ViolationClassification> get copyWith;
}

/// @nodoc
abstract class $ViolationClassificationCopyWith<$Res> {
  factory $ViolationClassificationCopyWith(ViolationClassification value,
          $Res Function(ViolationClassification) then) =
      _$ViolationClassificationCopyWithImpl<$Res>;
  $Res call({int id, ViolationName violationName});

  $ViolationNameCopyWith<$Res> get violationName;
}

/// @nodoc
class _$ViolationClassificationCopyWithImpl<$Res>
    implements $ViolationClassificationCopyWith<$Res> {
  _$ViolationClassificationCopyWithImpl(this._value, this._then);

  final ViolationClassification _value;
  // ignore: unused_field
  final $Res Function(ViolationClassification) _then;

  @override
  $Res call({
    Object id = freezed,
    Object violationName = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      violationName: violationName == freezed
          ? _value.violationName
          : violationName as ViolationName,
    ));
  }

  @override
  $ViolationNameCopyWith<$Res> get violationName {
    if (_value.violationName == null) {
      return null;
    }
    return $ViolationNameCopyWith<$Res>(_value.violationName, (value) {
      return _then(_value.copyWith(violationName: value));
    });
  }
}

/// @nodoc
abstract class _$ViolationClassificationCopyWith<$Res>
    implements $ViolationClassificationCopyWith<$Res> {
  factory _$ViolationClassificationCopyWith(_ViolationClassification value,
          $Res Function(_ViolationClassification) then) =
      __$ViolationClassificationCopyWithImpl<$Res>;
  @override
  $Res call({int id, ViolationName violationName});

  @override
  $ViolationNameCopyWith<$Res> get violationName;
}

/// @nodoc
class __$ViolationClassificationCopyWithImpl<$Res>
    extends _$ViolationClassificationCopyWithImpl<$Res>
    implements _$ViolationClassificationCopyWith<$Res> {
  __$ViolationClassificationCopyWithImpl(_ViolationClassification _value,
      $Res Function(_ViolationClassification) _then)
      : super(_value, (v) => _then(v as _ViolationClassification));

  @override
  _ViolationClassification get _value =>
      super._value as _ViolationClassification;

  @override
  $Res call({
    Object id = freezed,
    Object violationName = freezed,
  }) {
    return _then(_ViolationClassification(
      id: id == freezed ? _value.id : id as int,
      violationName: violationName == freezed
          ? _value.violationName
          : violationName as ViolationName,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationClassification implements _ViolationClassification {
  const _$_ViolationClassification({this.id, this.violationName});

  factory _$_ViolationClassification.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationClassificationFromJson(json);

  @override
  final int id;
  @override
  final ViolationName violationName;

  @override
  String toString() {
    return 'ViolationClassification(id: $id, violationName: $violationName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationClassification &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.violationName, violationName) ||
                const DeepCollectionEquality()
                    .equals(other.violationName, violationName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(violationName);

  @JsonKey(ignore: true)
  @override
  _$ViolationClassificationCopyWith<_ViolationClassification> get copyWith =>
      __$ViolationClassificationCopyWithImpl<_ViolationClassification>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationClassificationToJson(this);
  }
}

abstract class _ViolationClassification implements ViolationClassification {
  const factory _ViolationClassification(
      {int id, ViolationName violationName}) = _$_ViolationClassification;

  factory _ViolationClassification.fromJson(Map<String, dynamic> json) =
      _$_ViolationClassification.fromJson;

  @override
  int get id;
  @override
  ViolationName get violationName;
  @override
  @JsonKey(ignore: true)
  _$ViolationClassificationCopyWith<_ViolationClassification> get copyWith;
}
