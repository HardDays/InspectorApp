// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

// ignore: unused_element
  _Location call(double longitude, double latitude) {
    return _Location(
      longitude,
      latitude,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  double get longitude;
  double get latitude;

  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({double longitude, double latitude});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object longitude = freezed,
    Object latitude = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({double longitude, double latitude});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object longitude = freezed,
    Object latitude = freezed,
  }) {
    return _then(_Location(
      longitude == freezed ? _value.longitude : longitude as double,
      latitude == freezed ? _value.latitude : latitude as double,
    ));
  }
}

/// @nodoc
class _$_Location implements _Location {
  const _$_Location(this.longitude, this.latitude)
      : assert(longitude != null),
        assert(latitude != null);

  @override
  final double longitude;
  @override
  final double latitude;

  @override
  String toString() {
    return 'Location(longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)) &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(longitude) ^
      const DeepCollectionEquality().hash(latitude);

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);
}

abstract class _Location implements Location {
  const factory _Location(double longitude, double latitude) = _$_Location;

  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith;
}
