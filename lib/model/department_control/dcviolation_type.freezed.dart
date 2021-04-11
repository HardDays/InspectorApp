// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dcviolation_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DCViolationType _$DCViolationTypeFromJson(Map<String, dynamic> json) {
  return _DCViolationType.fromJson(json);
}

/// @nodoc
class _$DCViolationTypeTearOff {
  const _$DCViolationTypeTearOff();

// ignore: unused_element
  _DCViolationType call({int id, String name}) {
    return _DCViolationType(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  DCViolationType fromJson(Map<String, Object> json) {
    return DCViolationType.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DCViolationType = _$DCViolationTypeTearOff();

/// @nodoc
mixin _$DCViolationType {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DCViolationTypeCopyWith<DCViolationType> get copyWith;
}

/// @nodoc
abstract class $DCViolationTypeCopyWith<$Res> {
  factory $DCViolationTypeCopyWith(
          DCViolationType value, $Res Function(DCViolationType) then) =
      _$DCViolationTypeCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$DCViolationTypeCopyWithImpl<$Res>
    implements $DCViolationTypeCopyWith<$Res> {
  _$DCViolationTypeCopyWithImpl(this._value, this._then);

  final DCViolationType _value;
  // ignore: unused_field
  final $Res Function(DCViolationType) _then;

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
abstract class _$DCViolationTypeCopyWith<$Res>
    implements $DCViolationTypeCopyWith<$Res> {
  factory _$DCViolationTypeCopyWith(
          _DCViolationType value, $Res Function(_DCViolationType) then) =
      __$DCViolationTypeCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$DCViolationTypeCopyWithImpl<$Res>
    extends _$DCViolationTypeCopyWithImpl<$Res>
    implements _$DCViolationTypeCopyWith<$Res> {
  __$DCViolationTypeCopyWithImpl(
      _DCViolationType _value, $Res Function(_DCViolationType) _then)
      : super(_value, (v) => _then(v as _DCViolationType));

  @override
  _DCViolationType get _value => super._value as _DCViolationType;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_DCViolationType(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DCViolationType implements _DCViolationType {
  const _$_DCViolationType({this.id, this.name});

  factory _$_DCViolationType.fromJson(Map<String, dynamic> json) =>
      _$_$_DCViolationTypeFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'DCViolationType(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DCViolationType &&
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
  _$DCViolationTypeCopyWith<_DCViolationType> get copyWith =>
      __$DCViolationTypeCopyWithImpl<_DCViolationType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DCViolationTypeToJson(this);
  }
}

abstract class _DCViolationType implements DCViolationType {
  const factory _DCViolationType({int id, String name}) = _$_DCViolationType;

  factory _DCViolationType.fromJson(Map<String, dynamic> json) =
      _$_DCViolationType.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$DCViolationTypeCopyWith<_DCViolationType> get copyWith;
}
