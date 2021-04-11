// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dcviolation_kind.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DCViolationKind _$DCViolationKindFromJson(Map<String, dynamic> json) {
  return _DCViolationKind.fromJson(json);
}

/// @nodoc
class _$DCViolationKindTearOff {
  const _$DCViolationKindTearOff();

// ignore: unused_element
  _DCViolationKind call({int id, String name}) {
    return _DCViolationKind(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  DCViolationKind fromJson(Map<String, Object> json) {
    return DCViolationKind.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DCViolationKind = _$DCViolationKindTearOff();

/// @nodoc
mixin _$DCViolationKind {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DCViolationKindCopyWith<DCViolationKind> get copyWith;
}

/// @nodoc
abstract class $DCViolationKindCopyWith<$Res> {
  factory $DCViolationKindCopyWith(
          DCViolationKind value, $Res Function(DCViolationKind) then) =
      _$DCViolationKindCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$DCViolationKindCopyWithImpl<$Res>
    implements $DCViolationKindCopyWith<$Res> {
  _$DCViolationKindCopyWithImpl(this._value, this._then);

  final DCViolationKind _value;
  // ignore: unused_field
  final $Res Function(DCViolationKind) _then;

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
abstract class _$DCViolationKindCopyWith<$Res>
    implements $DCViolationKindCopyWith<$Res> {
  factory _$DCViolationKindCopyWith(
          _DCViolationKind value, $Res Function(_DCViolationKind) then) =
      __$DCViolationKindCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$DCViolationKindCopyWithImpl<$Res>
    extends _$DCViolationKindCopyWithImpl<$Res>
    implements _$DCViolationKindCopyWith<$Res> {
  __$DCViolationKindCopyWithImpl(
      _DCViolationKind _value, $Res Function(_DCViolationKind) _then)
      : super(_value, (v) => _then(v as _DCViolationKind));

  @override
  _DCViolationKind get _value => super._value as _DCViolationKind;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_DCViolationKind(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DCViolationKind implements _DCViolationKind {
  const _$_DCViolationKind({this.id, this.name});

  factory _$_DCViolationKind.fromJson(Map<String, dynamic> json) =>
      _$_$_DCViolationKindFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'DCViolationKind(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DCViolationKind &&
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
  _$DCViolationKindCopyWith<_DCViolationKind> get copyWith =>
      __$DCViolationKindCopyWithImpl<_DCViolationKind>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DCViolationKindToJson(this);
  }
}

abstract class _DCViolationKind implements DCViolationKind {
  const factory _DCViolationKind({int id, String name}) = _$_DCViolationKind;

  factory _DCViolationKind.fromJson(Map<String, dynamic> json) =
      _$_DCViolationKind.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$DCViolationKindCopyWith<_DCViolationKind> get copyWith;
}
