// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'object_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ObjectElement _$ObjectElementFromJson(Map<String, dynamic> json) {
  return _ObjectElement.fromJson(json);
}

/// @nodoc
class _$ObjectElementTearOff {
  const _$ObjectElementTearOff();

// ignore: unused_element
  _ObjectElement call({int id, String name, ObjectType objectType}) {
    return _ObjectElement(
      id: id,
      name: name,
      objectType: objectType,
    );
  }

// ignore: unused_element
  ObjectElement fromJson(Map<String, Object> json) {
    return ObjectElement.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ObjectElement = _$ObjectElementTearOff();

/// @nodoc
mixin _$ObjectElement {
  int get id;
  String get name;
  ObjectType get objectType;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ObjectElementCopyWith<ObjectElement> get copyWith;
}

/// @nodoc
abstract class $ObjectElementCopyWith<$Res> {
  factory $ObjectElementCopyWith(
          ObjectElement value, $Res Function(ObjectElement) then) =
      _$ObjectElementCopyWithImpl<$Res>;
  $Res call({int id, String name, ObjectType objectType});

  $ObjectTypeCopyWith<$Res> get objectType;
}

/// @nodoc
class _$ObjectElementCopyWithImpl<$Res>
    implements $ObjectElementCopyWith<$Res> {
  _$ObjectElementCopyWithImpl(this._value, this._then);

  final ObjectElement _value;
  // ignore: unused_field
  final $Res Function(ObjectElement) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object objectType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      objectType:
          objectType == freezed ? _value.objectType : objectType as ObjectType,
    ));
  }

  @override
  $ObjectTypeCopyWith<$Res> get objectType {
    if (_value.objectType == null) {
      return null;
    }
    return $ObjectTypeCopyWith<$Res>(_value.objectType, (value) {
      return _then(_value.copyWith(objectType: value));
    });
  }
}

/// @nodoc
abstract class _$ObjectElementCopyWith<$Res>
    implements $ObjectElementCopyWith<$Res> {
  factory _$ObjectElementCopyWith(
          _ObjectElement value, $Res Function(_ObjectElement) then) =
      __$ObjectElementCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, ObjectType objectType});

  @override
  $ObjectTypeCopyWith<$Res> get objectType;
}

/// @nodoc
class __$ObjectElementCopyWithImpl<$Res>
    extends _$ObjectElementCopyWithImpl<$Res>
    implements _$ObjectElementCopyWith<$Res> {
  __$ObjectElementCopyWithImpl(
      _ObjectElement _value, $Res Function(_ObjectElement) _then)
      : super(_value, (v) => _then(v as _ObjectElement));

  @override
  _ObjectElement get _value => super._value as _ObjectElement;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object objectType = freezed,
  }) {
    return _then(_ObjectElement(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      objectType:
          objectType == freezed ? _value.objectType : objectType as ObjectType,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ObjectElement implements _ObjectElement {
  const _$_ObjectElement({this.id, this.name, this.objectType});

  factory _$_ObjectElement.fromJson(Map<String, dynamic> json) =>
      _$_$_ObjectElementFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final ObjectType objectType;

  @override
  String toString() {
    return 'ObjectElement(id: $id, name: $name, objectType: $objectType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ObjectElement &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.objectType, objectType) ||
                const DeepCollectionEquality()
                    .equals(other.objectType, objectType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(objectType);

  @JsonKey(ignore: true)
  @override
  _$ObjectElementCopyWith<_ObjectElement> get copyWith =>
      __$ObjectElementCopyWithImpl<_ObjectElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ObjectElementToJson(this);
  }
}

abstract class _ObjectElement implements ObjectElement {
  const factory _ObjectElement({int id, String name, ObjectType objectType}) =
      _$_ObjectElement;

  factory _ObjectElement.fromJson(Map<String, dynamic> json) =
      _$_ObjectElement.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  ObjectType get objectType;
  @override
  @JsonKey(ignore: true)
  _$ObjectElementCopyWith<_ObjectElement> get copyWith;
}
