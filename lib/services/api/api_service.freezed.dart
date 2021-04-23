// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'api_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ApiParameters _$ApiParametersFromJson(Map<String, dynamic> json) {
  return _ApiParameters.fromJson(json);
}

/// @nodoc
class _$ApiParametersTearOff {
  const _$ApiParametersTearOff();

// ignore: unused_element
  _ApiParameters call(int nativeDepControl, String depControlUrl) {
    return _ApiParameters(
      nativeDepControl,
      depControlUrl,
    );
  }

// ignore: unused_element
  ApiParameters fromJson(Map<String, Object> json) {
    return ApiParameters.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ApiParameters = _$ApiParametersTearOff();

/// @nodoc
mixin _$ApiParameters {
  int get nativeDepControl;
  String get depControlUrl;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ApiParametersCopyWith<ApiParameters> get copyWith;
}

/// @nodoc
abstract class $ApiParametersCopyWith<$Res> {
  factory $ApiParametersCopyWith(
          ApiParameters value, $Res Function(ApiParameters) then) =
      _$ApiParametersCopyWithImpl<$Res>;
  $Res call({int nativeDepControl, String depControlUrl});
}

/// @nodoc
class _$ApiParametersCopyWithImpl<$Res>
    implements $ApiParametersCopyWith<$Res> {
  _$ApiParametersCopyWithImpl(this._value, this._then);

  final ApiParameters _value;
  // ignore: unused_field
  final $Res Function(ApiParameters) _then;

  @override
  $Res call({
    Object nativeDepControl = freezed,
    Object depControlUrl = freezed,
  }) {
    return _then(_value.copyWith(
      nativeDepControl: nativeDepControl == freezed
          ? _value.nativeDepControl
          : nativeDepControl as int,
      depControlUrl: depControlUrl == freezed
          ? _value.depControlUrl
          : depControlUrl as String,
    ));
  }
}

/// @nodoc
abstract class _$ApiParametersCopyWith<$Res>
    implements $ApiParametersCopyWith<$Res> {
  factory _$ApiParametersCopyWith(
          _ApiParameters value, $Res Function(_ApiParameters) then) =
      __$ApiParametersCopyWithImpl<$Res>;
  @override
  $Res call({int nativeDepControl, String depControlUrl});
}

/// @nodoc
class __$ApiParametersCopyWithImpl<$Res>
    extends _$ApiParametersCopyWithImpl<$Res>
    implements _$ApiParametersCopyWith<$Res> {
  __$ApiParametersCopyWithImpl(
      _ApiParameters _value, $Res Function(_ApiParameters) _then)
      : super(_value, (v) => _then(v as _ApiParameters));

  @override
  _ApiParameters get _value => super._value as _ApiParameters;

  @override
  $Res call({
    Object nativeDepControl = freezed,
    Object depControlUrl = freezed,
  }) {
    return _then(_ApiParameters(
      nativeDepControl == freezed
          ? _value.nativeDepControl
          : nativeDepControl as int,
      depControlUrl == freezed ? _value.depControlUrl : depControlUrl as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ApiParameters implements _ApiParameters {
  const _$_ApiParameters(this.nativeDepControl, this.depControlUrl)
      : assert(nativeDepControl != null),
        assert(depControlUrl != null);

  factory _$_ApiParameters.fromJson(Map<String, dynamic> json) =>
      _$_$_ApiParametersFromJson(json);

  @override
  final int nativeDepControl;
  @override
  final String depControlUrl;

  @override
  String toString() {
    return 'ApiParameters(nativeDepControl: $nativeDepControl, depControlUrl: $depControlUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiParameters &&
            (identical(other.nativeDepControl, nativeDepControl) ||
                const DeepCollectionEquality()
                    .equals(other.nativeDepControl, nativeDepControl)) &&
            (identical(other.depControlUrl, depControlUrl) ||
                const DeepCollectionEquality()
                    .equals(other.depControlUrl, depControlUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(nativeDepControl) ^
      const DeepCollectionEquality().hash(depControlUrl);

  @JsonKey(ignore: true)
  @override
  _$ApiParametersCopyWith<_ApiParameters> get copyWith =>
      __$ApiParametersCopyWithImpl<_ApiParameters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApiParametersToJson(this);
  }
}

abstract class _ApiParameters implements ApiParameters {
  const factory _ApiParameters(int nativeDepControl, String depControlUrl) =
      _$_ApiParameters;

  factory _ApiParameters.fromJson(Map<String, dynamic> json) =
      _$_ApiParameters.fromJson;

  @override
  int get nativeDepControl;
  @override
  String get depControlUrl;
  @override
  @JsonKey(ignore: true)
  _$ApiParametersCopyWith<_ApiParameters> get copyWith;
}
