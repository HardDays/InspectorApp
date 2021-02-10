// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'object_kind.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ObjectKind _$ObjectKindFromJson(Map<String, dynamic> json) {
  return _ObjectKind.fromJson(json);
}

/// @nodoc
class _$ObjectKindTearOff {
  const _$ObjectKindTearOff();

// ignore: unused_element
  _ObjectKind call({int id, String name, String code}) {
    return _ObjectKind(
      id: id,
      name: name,
      code: code,
    );
  }

// ignore: unused_element
  ObjectKind fromJson(Map<String, Object> json) {
    return ObjectKind.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ObjectKind = _$ObjectKindTearOff();

/// @nodoc
mixin _$ObjectKind {
  int get id;
  String get name;
  String get code;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ObjectKindCopyWith<ObjectKind> get copyWith;
}

/// @nodoc
abstract class $ObjectKindCopyWith<$Res> {
  factory $ObjectKindCopyWith(
          ObjectKind value, $Res Function(ObjectKind) then) =
      _$ObjectKindCopyWithImpl<$Res>;
  $Res call({int id, String name, String code});
}

/// @nodoc
class _$ObjectKindCopyWithImpl<$Res> implements $ObjectKindCopyWith<$Res> {
  _$ObjectKindCopyWithImpl(this._value, this._then);

  final ObjectKind _value;
  // ignore: unused_field
  final $Res Function(ObjectKind) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object code = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
    ));
  }
}

/// @nodoc
abstract class _$ObjectKindCopyWith<$Res> implements $ObjectKindCopyWith<$Res> {
  factory _$ObjectKindCopyWith(
          _ObjectKind value, $Res Function(_ObjectKind) then) =
      __$ObjectKindCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String code});
}

/// @nodoc
class __$ObjectKindCopyWithImpl<$Res> extends _$ObjectKindCopyWithImpl<$Res>
    implements _$ObjectKindCopyWith<$Res> {
  __$ObjectKindCopyWithImpl(
      _ObjectKind _value, $Res Function(_ObjectKind) _then)
      : super(_value, (v) => _then(v as _ObjectKind));

  @override
  _ObjectKind get _value => super._value as _ObjectKind;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object code = freezed,
  }) {
    return _then(_ObjectKind(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ObjectKind extends _ObjectKind {
  const _$_ObjectKind({this.id, this.name, this.code}) : super._();

  factory _$_ObjectKind.fromJson(Map<String, dynamic> json) =>
      _$_$_ObjectKindFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'ObjectKind(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ObjectKind &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$ObjectKindCopyWith<_ObjectKind> get copyWith =>
      __$ObjectKindCopyWithImpl<_ObjectKind>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ObjectKindToJson(this);
  }
}

abstract class _ObjectKind extends ObjectKind {
  const _ObjectKind._() : super._();
  const factory _ObjectKind({int id, String name, String code}) = _$_ObjectKind;

  factory _ObjectKind.fromJson(Map<String, dynamic> json) =
      _$_ObjectKind.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$ObjectKindCopyWith<_ObjectKind> get copyWith;
}
