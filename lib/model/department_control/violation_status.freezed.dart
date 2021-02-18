// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationStatus _$ViolationStatusFromJson(Map<String, dynamic> json) {
  return _ViolationStatus.fromJson(json);
}

/// @nodoc
class _$ViolationStatusTearOff {
  const _$ViolationStatusTearOff();

// ignore: unused_element
  _ViolationStatus call({int id, String name}) {
    return _ViolationStatus(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  ViolationStatus fromJson(Map<String, Object> json) {
    return ViolationStatus.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationStatus = _$ViolationStatusTearOff();

/// @nodoc
mixin _$ViolationStatus {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationStatusCopyWith<ViolationStatus> get copyWith;
}

/// @nodoc
abstract class $ViolationStatusCopyWith<$Res> {
  factory $ViolationStatusCopyWith(
          ViolationStatus value, $Res Function(ViolationStatus) then) =
      _$ViolationStatusCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$ViolationStatusCopyWithImpl<$Res>
    implements $ViolationStatusCopyWith<$Res> {
  _$ViolationStatusCopyWithImpl(this._value, this._then);

  final ViolationStatus _value;
  // ignore: unused_field
  final $Res Function(ViolationStatus) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
abstract class _$ViolationStatusCopyWith<$Res>
    implements $ViolationStatusCopyWith<$Res> {
  factory _$ViolationStatusCopyWith(
          _ViolationStatus value, $Res Function(_ViolationStatus) then) =
      __$ViolationStatusCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$ViolationStatusCopyWithImpl<$Res>
    extends _$ViolationStatusCopyWithImpl<$Res>
    implements _$ViolationStatusCopyWith<$Res> {
  __$ViolationStatusCopyWithImpl(
      _ViolationStatus _value, $Res Function(_ViolationStatus) _then)
      : super(_value, (v) => _then(v as _ViolationStatus));

  @override
  _ViolationStatus get _value => super._value as _ViolationStatus;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_ViolationStatus(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationStatus extends _ViolationStatus {
  const _$_ViolationStatus({this.id, this.name}) : super._();

  factory _$_ViolationStatus.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationStatusFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ViolationStatus(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationStatus &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$ViolationStatusCopyWith<_ViolationStatus> get copyWith =>
      __$ViolationStatusCopyWithImpl<_ViolationStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationStatusToJson(this);
  }
}

abstract class _ViolationStatus extends ViolationStatus {
  const _ViolationStatus._() : super._();
  const factory _ViolationStatus({int id, String name}) = _$_ViolationStatus;

  factory _ViolationStatus.fromJson(Map<String, dynamic> json) =
      _$_ViolationStatus.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$ViolationStatusCopyWith<_ViolationStatus> get copyWith;
}
