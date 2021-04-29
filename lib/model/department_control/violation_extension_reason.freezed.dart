// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_extension_reason.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationExtensionReason _$ViolationExtensionReasonFromJson(
    Map<String, dynamic> json) {
  return _ViolationExtensionReason.fromJson(json);
}

/// @nodoc
class _$ViolationExtensionReasonTearOff {
  const _$ViolationExtensionReasonTearOff();

// ignore: unused_element
  _ViolationExtensionReason call({int id, String name}) {
    return _ViolationExtensionReason(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  ViolationExtensionReason fromJson(Map<String, Object> json) {
    return ViolationExtensionReason.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationExtensionReason = _$ViolationExtensionReasonTearOff();

/// @nodoc
mixin _$ViolationExtensionReason {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationExtensionReasonCopyWith<ViolationExtensionReason> get copyWith;
}

/// @nodoc
abstract class $ViolationExtensionReasonCopyWith<$Res> {
  factory $ViolationExtensionReasonCopyWith(ViolationExtensionReason value,
          $Res Function(ViolationExtensionReason) then) =
      _$ViolationExtensionReasonCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$ViolationExtensionReasonCopyWithImpl<$Res>
    implements $ViolationExtensionReasonCopyWith<$Res> {
  _$ViolationExtensionReasonCopyWithImpl(this._value, this._then);

  final ViolationExtensionReason _value;
  // ignore: unused_field
  final $Res Function(ViolationExtensionReason) _then;

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
abstract class _$ViolationExtensionReasonCopyWith<$Res>
    implements $ViolationExtensionReasonCopyWith<$Res> {
  factory _$ViolationExtensionReasonCopyWith(_ViolationExtensionReason value,
          $Res Function(_ViolationExtensionReason) then) =
      __$ViolationExtensionReasonCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$ViolationExtensionReasonCopyWithImpl<$Res>
    extends _$ViolationExtensionReasonCopyWithImpl<$Res>
    implements _$ViolationExtensionReasonCopyWith<$Res> {
  __$ViolationExtensionReasonCopyWithImpl(_ViolationExtensionReason _value,
      $Res Function(_ViolationExtensionReason) _then)
      : super(_value, (v) => _then(v as _ViolationExtensionReason));

  @override
  _ViolationExtensionReason get _value =>
      super._value as _ViolationExtensionReason;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_ViolationExtensionReason(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationExtensionReason extends _ViolationExtensionReason {
  const _$_ViolationExtensionReason({this.id, this.name}) : super._();

  factory _$_ViolationExtensionReason.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationExtensionReasonFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ViolationExtensionReason(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationExtensionReason &&
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
  _$ViolationExtensionReasonCopyWith<_ViolationExtensionReason> get copyWith =>
      __$ViolationExtensionReasonCopyWithImpl<_ViolationExtensionReason>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationExtensionReasonToJson(this);
  }
}

abstract class _ViolationExtensionReason extends ViolationExtensionReason {
  const _ViolationExtensionReason._() : super._();
  const factory _ViolationExtensionReason({int id, String name}) =
      _$_ViolationExtensionReason;

  factory _ViolationExtensionReason.fromJson(Map<String, dynamic> json) =
      _$_ViolationExtensionReason.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$ViolationExtensionReasonCopyWith<_ViolationExtensionReason> get copyWith;
}
