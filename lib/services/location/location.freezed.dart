// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Location _$LocationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _Location.fromJson(json);
    case 'noLocationProvided':
      return NoLocationProvider.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

// ignore: unused_element
  _Location call({@required double longitude, @required double latitude}) {
    return _Location(
      longitude: longitude,
      latitude: latitude,
    );
  }

// ignore: unused_element
  NoLocationProvider noLocationProvided() {
    return const NoLocationProvider();
  }

// ignore: unused_element
  Location fromJson(Map<String, Object> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(double longitude, double latitude), {
    @required TResult noLocationProvided(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(double longitude, double latitude), {
    TResult noLocationProvided(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_Location value), {
    @required TResult noLocationProvided(NoLocationProvider value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_Location value), {
    TResult noLocationProvided(NoLocationProvider value),
    @required TResult orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
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
      longitude: longitude == freezed ? _value.longitude : longitude as double,
      latitude: latitude == freezed ? _value.latitude : latitude as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Location implements _Location {
  const _$_Location({@required this.longitude, @required this.latitude})
      : assert(longitude != null),
        assert(latitude != null);

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$_$_LocationFromJson(json);

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

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(double longitude, double latitude), {
    @required TResult noLocationProvided(),
  }) {
    assert($default != null);
    assert(noLocationProvided != null);
    return $default(longitude, latitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(double longitude, double latitude), {
    TResult noLocationProvided(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(longitude, latitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_Location value), {
    @required TResult noLocationProvided(NoLocationProvider value),
  }) {
    assert($default != null);
    assert(noLocationProvided != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_Location value), {
    TResult noLocationProvided(NoLocationProvider value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocationToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _Location implements Location {
  const factory _Location(
      {@required double longitude, @required double latitude}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  double get longitude;
  double get latitude;
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith;
}

/// @nodoc
abstract class $NoLocationProviderCopyWith<$Res> {
  factory $NoLocationProviderCopyWith(
          NoLocationProvider value, $Res Function(NoLocationProvider) then) =
      _$NoLocationProviderCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoLocationProviderCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res>
    implements $NoLocationProviderCopyWith<$Res> {
  _$NoLocationProviderCopyWithImpl(
      NoLocationProvider _value, $Res Function(NoLocationProvider) _then)
      : super(_value, (v) => _then(v as NoLocationProvider));

  @override
  NoLocationProvider get _value => super._value as NoLocationProvider;
}

@JsonSerializable()

/// @nodoc
class _$NoLocationProvider implements NoLocationProvider {
  const _$NoLocationProvider();

  factory _$NoLocationProvider.fromJson(Map<String, dynamic> json) =>
      _$_$NoLocationProviderFromJson(json);

  @override
  String toString() {
    return 'Location.noLocationProvided()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoLocationProvider);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(double longitude, double latitude), {
    @required TResult noLocationProvided(),
  }) {
    assert($default != null);
    assert(noLocationProvided != null);
    return noLocationProvided();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(double longitude, double latitude), {
    TResult noLocationProvided(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (noLocationProvided != null) {
      return noLocationProvided();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_Location value), {
    @required TResult noLocationProvided(NoLocationProvider value),
  }) {
    assert($default != null);
    assert(noLocationProvided != null);
    return noLocationProvided(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_Location value), {
    TResult noLocationProvided(NoLocationProvider value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (noLocationProvided != null) {
      return noLocationProvided(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$NoLocationProviderToJson(this)
      ..['runtimeType'] = 'noLocationProvided';
  }
}

abstract class NoLocationProvider implements Location {
  const factory NoLocationProvider() = _$NoLocationProvider;

  factory NoLocationProvider.fromJson(Map<String, dynamic> json) =
      _$NoLocationProvider.fromJson;
}
