// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'point.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Point _$PointFromJson(Map<String, dynamic> json) {
  return _Point.fromJson(json);
}

/// @nodoc
class _$PointTearOff {
  const _$PointTearOff();

// ignore: unused_element
  _Point call({int x, int y}) {
    return _Point(
      x: x,
      y: y,
    );
  }

// ignore: unused_element
  Point fromJson(Map<String, Object> json) {
    return Point.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Point = _$PointTearOff();

/// @nodoc
mixin _$Point {
  int get x;
  int get y;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PointCopyWith<Point> get copyWith;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res>;
  $Res call({int x, int y});
}

/// @nodoc
class _$PointCopyWithImpl<$Res> implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  final Point _value;
  // ignore: unused_field
  final $Res Function(Point) _then;

  @override
  $Res call({
    Object x = freezed,
    Object y = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
    ));
  }
}

/// @nodoc
abstract class _$PointCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$PointCopyWith(_Point value, $Res Function(_Point) then) =
      __$PointCopyWithImpl<$Res>;
  @override
  $Res call({int x, int y});
}

/// @nodoc
class __$PointCopyWithImpl<$Res> extends _$PointCopyWithImpl<$Res>
    implements _$PointCopyWith<$Res> {
  __$PointCopyWithImpl(_Point _value, $Res Function(_Point) _then)
      : super(_value, (v) => _then(v as _Point));

  @override
  _Point get _value => super._value as _Point;

  @override
  $Res call({
    Object x = freezed,
    Object y = freezed,
  }) {
    return _then(_Point(
      x: x == freezed ? _value.x : x as int,
      y: y == freezed ? _value.y : y as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Point implements _Point {
  const _$_Point({this.x, this.y});

  factory _$_Point.fromJson(Map<String, dynamic> json) =>
      _$_$_PointFromJson(json);

  @override
  final int x;
  @override
  final int y;

  @override
  String toString() {
    return 'Point(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Point &&
            (identical(other.x, x) ||
                const DeepCollectionEquality().equals(other.x, x)) &&
            (identical(other.y, y) ||
                const DeepCollectionEquality().equals(other.y, y)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(x) ^
      const DeepCollectionEquality().hash(y);

  @JsonKey(ignore: true)
  @override
  _$PointCopyWith<_Point> get copyWith =>
      __$PointCopyWithImpl<_Point>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PointToJson(this);
  }
}

abstract class _Point implements Point {
  const factory _Point({int x, int y}) = _$_Point;

  factory _Point.fromJson(Map<String, dynamic> json) = _$_Point.fromJson;

  @override
  int get x;
  @override
  int get y;
  @override
  @JsonKey(ignore: true)
  _$PointCopyWith<_Point> get copyWith;
}
