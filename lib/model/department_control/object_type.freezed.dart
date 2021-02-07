// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'object_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ObjectType _$ObjectTypeFromJson(Map<String, dynamic> json) {
  return _ObjectType.fromJson(json);
}

/// @nodoc
class _$ObjectTypeTearOff {
  const _$ObjectTypeTearOff();

// ignore: unused_element
  _ObjectType call({int id, String name, String code}) {
    return _ObjectType(
      id: id,
      name: name,
      code: code,
    );
  }

// ignore: unused_element
  ObjectType fromJson(Map<String, Object> json) {
    return ObjectType.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ObjectType = _$ObjectTypeTearOff();

/// @nodoc
mixin _$ObjectType {
  int get id;
  String get name;
  String get code;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ObjectTypeCopyWith<ObjectType> get copyWith;
}

/// @nodoc
abstract class $ObjectTypeCopyWith<$Res> {
  factory $ObjectTypeCopyWith(
          ObjectType value, $Res Function(ObjectType) then) =
      _$ObjectTypeCopyWithImpl<$Res>;
  $Res call({int id, String name, String code});
}

/// @nodoc
class _$ObjectTypeCopyWithImpl<$Res> implements $ObjectTypeCopyWith<$Res> {
  _$ObjectTypeCopyWithImpl(this._value, this._then);

  final ObjectType _value;
  // ignore: unused_field
  final $Res Function(ObjectType) _then;

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
abstract class _$ObjectTypeCopyWith<$Res> implements $ObjectTypeCopyWith<$Res> {
  factory _$ObjectTypeCopyWith(
          _ObjectType value, $Res Function(_ObjectType) then) =
      __$ObjectTypeCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String code});
}

/// @nodoc
class __$ObjectTypeCopyWithImpl<$Res> extends _$ObjectTypeCopyWithImpl<$Res>
    implements _$ObjectTypeCopyWith<$Res> {
  __$ObjectTypeCopyWithImpl(
      _ObjectType _value, $Res Function(_ObjectType) _then)
      : super(_value, (v) => _then(v as _ObjectType));

  @override
  _ObjectType get _value => super._value as _ObjectType;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object code = freezed,
  }) {
    return _then(_ObjectType(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      code: code == freezed ? _value.code : code as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ObjectType implements _ObjectType {
  const _$_ObjectType({this.id, this.name, this.code});

  factory _$_ObjectType.fromJson(Map<String, dynamic> json) =>
      _$_$_ObjectTypeFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'ObjectType(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ObjectType &&
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
  _$ObjectTypeCopyWith<_ObjectType> get copyWith =>
      __$ObjectTypeCopyWithImpl<_ObjectType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ObjectTypeToJson(this);
  }
}

abstract class _ObjectType implements ObjectType {
  const factory _ObjectType({int id, String name, String code}) = _$_ObjectType;

  factory _ObjectType.fromJson(Map<String, dynamic> json) =
      _$_ObjectType.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$ObjectTypeCopyWith<_ObjectType> get copyWith;
}
