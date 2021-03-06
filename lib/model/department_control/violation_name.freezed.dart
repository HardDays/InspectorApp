// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationName _$ViolationNameFromJson(Map<String, dynamic> json) {
  return _ViolationName.fromJson(json);
}

/// @nodoc
class _$ViolationNameTearOff {
  const _$ViolationNameTearOff();

// ignore: unused_element
  _ViolationName call(
      {int id, String name, String violationFullName, int externalId}) {
    return _ViolationName(
      id: id,
      name: name,
      violationFullName: violationFullName,
      externalId: externalId,
    );
  }

// ignore: unused_element
  ViolationName fromJson(Map<String, Object> json) {
    return ViolationName.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationName = _$ViolationNameTearOff();

/// @nodoc
mixin _$ViolationName {
  int get id;
  String get name;
  String get violationFullName;
  int get externalId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationNameCopyWith<ViolationName> get copyWith;
}

/// @nodoc
abstract class $ViolationNameCopyWith<$Res> {
  factory $ViolationNameCopyWith(
          ViolationName value, $Res Function(ViolationName) then) =
      _$ViolationNameCopyWithImpl<$Res>;
  $Res call({int id, String name, String violationFullName, int externalId});
}

/// @nodoc
class _$ViolationNameCopyWithImpl<$Res>
    implements $ViolationNameCopyWith<$Res> {
  _$ViolationNameCopyWithImpl(this._value, this._then);

  final ViolationName _value;
  // ignore: unused_field
  final $Res Function(ViolationName) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object violationFullName = freezed,
    Object externalId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      violationFullName: violationFullName == freezed
          ? _value.violationFullName
          : violationFullName as String,
      externalId: externalId == freezed ? _value.externalId : externalId as int,
    ));
  }
}

/// @nodoc
abstract class _$ViolationNameCopyWith<$Res>
    implements $ViolationNameCopyWith<$Res> {
  factory _$ViolationNameCopyWith(
          _ViolationName value, $Res Function(_ViolationName) then) =
      __$ViolationNameCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String violationFullName, int externalId});
}

/// @nodoc
class __$ViolationNameCopyWithImpl<$Res>
    extends _$ViolationNameCopyWithImpl<$Res>
    implements _$ViolationNameCopyWith<$Res> {
  __$ViolationNameCopyWithImpl(
      _ViolationName _value, $Res Function(_ViolationName) _then)
      : super(_value, (v) => _then(v as _ViolationName));

  @override
  _ViolationName get _value => super._value as _ViolationName;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object violationFullName = freezed,
    Object externalId = freezed,
  }) {
    return _then(_ViolationName(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      violationFullName: violationFullName == freezed
          ? _value.violationFullName
          : violationFullName as String,
      externalId: externalId == freezed ? _value.externalId : externalId as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationName extends _ViolationName {
  const _$_ViolationName(
      {this.id, this.name, this.violationFullName, this.externalId})
      : super._();

  factory _$_ViolationName.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationNameFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String violationFullName;
  @override
  final int externalId;

  @override
  String toString() {
    return 'ViolationName(id: $id, name: $name, violationFullName: $violationFullName, externalId: $externalId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationName &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.violationFullName, violationFullName) ||
                const DeepCollectionEquality()
                    .equals(other.violationFullName, violationFullName)) &&
            (identical(other.externalId, externalId) ||
                const DeepCollectionEquality()
                    .equals(other.externalId, externalId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(violationFullName) ^
      const DeepCollectionEquality().hash(externalId);

  @JsonKey(ignore: true)
  @override
  _$ViolationNameCopyWith<_ViolationName> get copyWith =>
      __$ViolationNameCopyWithImpl<_ViolationName>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationNameToJson(this);
  }
}

abstract class _ViolationName extends ViolationName {
  const _ViolationName._() : super._();
  const factory _ViolationName(
      {int id,
      String name,
      String violationFullName,
      int externalId}) = _$_ViolationName;

  factory _ViolationName.fromJson(Map<String, dynamic> json) =
      _$_ViolationName.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get violationFullName;
  @override
  int get externalId;
  @override
  @JsonKey(ignore: true)
  _$ViolationNameCopyWith<_ViolationName> get copyWith;
}
