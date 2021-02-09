// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_additional_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationAdditionalFeature _$ViolationAdditionalFeatureFromJson(
    Map<String, dynamic> json) {
  return _ViolationAdditionalFeature.fromJson(json);
}

/// @nodoc
class _$ViolationAdditionalFeatureTearOff {
  const _$ViolationAdditionalFeatureTearOff();

// ignore: unused_element
  _ViolationAdditionalFeature call({int id, String name}) {
    return _ViolationAdditionalFeature(
      id: id,
      name: name,
    );
  }

// ignore: unused_element
  ViolationAdditionalFeature fromJson(Map<String, Object> json) {
    return ViolationAdditionalFeature.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationAdditionalFeature = _$ViolationAdditionalFeatureTearOff();

/// @nodoc
mixin _$ViolationAdditionalFeature {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationAdditionalFeatureCopyWith<ViolationAdditionalFeature> get copyWith;
}

/// @nodoc
abstract class $ViolationAdditionalFeatureCopyWith<$Res> {
  factory $ViolationAdditionalFeatureCopyWith(ViolationAdditionalFeature value,
          $Res Function(ViolationAdditionalFeature) then) =
      _$ViolationAdditionalFeatureCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

/// @nodoc
class _$ViolationAdditionalFeatureCopyWithImpl<$Res>
    implements $ViolationAdditionalFeatureCopyWith<$Res> {
  _$ViolationAdditionalFeatureCopyWithImpl(this._value, this._then);

  final ViolationAdditionalFeature _value;
  // ignore: unused_field
  final $Res Function(ViolationAdditionalFeature) _then;

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
abstract class _$ViolationAdditionalFeatureCopyWith<$Res>
    implements $ViolationAdditionalFeatureCopyWith<$Res> {
  factory _$ViolationAdditionalFeatureCopyWith(
          _ViolationAdditionalFeature value,
          $Res Function(_ViolationAdditionalFeature) then) =
      __$ViolationAdditionalFeatureCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

/// @nodoc
class __$ViolationAdditionalFeatureCopyWithImpl<$Res>
    extends _$ViolationAdditionalFeatureCopyWithImpl<$Res>
    implements _$ViolationAdditionalFeatureCopyWith<$Res> {
  __$ViolationAdditionalFeatureCopyWithImpl(_ViolationAdditionalFeature _value,
      $Res Function(_ViolationAdditionalFeature) _then)
      : super(_value, (v) => _then(v as _ViolationAdditionalFeature));

  @override
  _ViolationAdditionalFeature get _value =>
      super._value as _ViolationAdditionalFeature;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_ViolationAdditionalFeature(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationAdditionalFeature extends _ViolationAdditionalFeature {
  const _$_ViolationAdditionalFeature({this.id, this.name}) : super._();

  factory _$_ViolationAdditionalFeature.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationAdditionalFeatureFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'ViolationAdditionalFeature(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationAdditionalFeature &&
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
  _$ViolationAdditionalFeatureCopyWith<_ViolationAdditionalFeature>
      get copyWith => __$ViolationAdditionalFeatureCopyWithImpl<
          _ViolationAdditionalFeature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationAdditionalFeatureToJson(this);
  }
}

abstract class _ViolationAdditionalFeature extends ViolationAdditionalFeature {
  const _ViolationAdditionalFeature._() : super._();
  const factory _ViolationAdditionalFeature({int id, String name}) =
      _$_ViolationAdditionalFeature;

  factory _ViolationAdditionalFeature.fromJson(Map<String, dynamic> json) =
      _$_ViolationAdditionalFeature.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$ViolationAdditionalFeatureCopyWith<_ViolationAdditionalFeature>
      get copyWith;
}
