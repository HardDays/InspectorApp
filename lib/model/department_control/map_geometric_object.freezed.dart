// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'map_geometric_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MapGeometricObject _$MapGeometricObjectFromJson(Map<String, dynamic> json) {
  return _MapGeometricObject.fromJson(json);
}

/// @nodoc
class _$MapGeometricObjectTearOff {
  const _$MapGeometricObjectTearOff();

// ignore: unused_element
  _MapGeometricObject call(
      {MapGeometricObjectType type,
      String color,
      String label,
      List<Point> points}) {
    return _MapGeometricObject(
      type: type,
      color: color,
      label: label,
      points: points,
    );
  }

// ignore: unused_element
  MapGeometricObject fromJson(Map<String, Object> json) {
    return MapGeometricObject.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MapGeometricObject = _$MapGeometricObjectTearOff();

/// @nodoc
mixin _$MapGeometricObject {
  MapGeometricObjectType get type;
  String get color;
  String get label;
  List<Point> get points;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $MapGeometricObjectCopyWith<MapGeometricObject> get copyWith;
}

/// @nodoc
abstract class $MapGeometricObjectCopyWith<$Res> {
  factory $MapGeometricObjectCopyWith(
          MapGeometricObject value, $Res Function(MapGeometricObject) then) =
      _$MapGeometricObjectCopyWithImpl<$Res>;
  $Res call(
      {MapGeometricObjectType type,
      String color,
      String label,
      List<Point> points});
}

/// @nodoc
class _$MapGeometricObjectCopyWithImpl<$Res>
    implements $MapGeometricObjectCopyWith<$Res> {
  _$MapGeometricObjectCopyWithImpl(this._value, this._then);

  final MapGeometricObject _value;
  // ignore: unused_field
  final $Res Function(MapGeometricObject) _then;

  @override
  $Res call({
    Object type = freezed,
    Object color = freezed,
    Object label = freezed,
    Object points = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as MapGeometricObjectType,
      color: color == freezed ? _value.color : color as String,
      label: label == freezed ? _value.label : label as String,
      points: points == freezed ? _value.points : points as List<Point>,
    ));
  }
}

/// @nodoc
abstract class _$MapGeometricObjectCopyWith<$Res>
    implements $MapGeometricObjectCopyWith<$Res> {
  factory _$MapGeometricObjectCopyWith(
          _MapGeometricObject value, $Res Function(_MapGeometricObject) then) =
      __$MapGeometricObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {MapGeometricObjectType type,
      String color,
      String label,
      List<Point> points});
}

/// @nodoc
class __$MapGeometricObjectCopyWithImpl<$Res>
    extends _$MapGeometricObjectCopyWithImpl<$Res>
    implements _$MapGeometricObjectCopyWith<$Res> {
  __$MapGeometricObjectCopyWithImpl(
      _MapGeometricObject _value, $Res Function(_MapGeometricObject) _then)
      : super(_value, (v) => _then(v as _MapGeometricObject));

  @override
  _MapGeometricObject get _value => super._value as _MapGeometricObject;

  @override
  $Res call({
    Object type = freezed,
    Object color = freezed,
    Object label = freezed,
    Object points = freezed,
  }) {
    return _then(_MapGeometricObject(
      type: type == freezed ? _value.type : type as MapGeometricObjectType,
      color: color == freezed ? _value.color : color as String,
      label: label == freezed ? _value.label : label as String,
      points: points == freezed ? _value.points : points as List<Point>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MapGeometricObject implements _MapGeometricObject {
  const _$_MapGeometricObject({this.type, this.color, this.label, this.points});

  factory _$_MapGeometricObject.fromJson(Map<String, dynamic> json) =>
      _$_$_MapGeometricObjectFromJson(json);

  @override
  final MapGeometricObjectType type;
  @override
  final String color;
  @override
  final String label;
  @override
  final List<Point> points;

  @override
  String toString() {
    return 'MapGeometricObject(type: $type, color: $color, label: $label, points: $points)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MapGeometricObject &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.label, label) ||
                const DeepCollectionEquality().equals(other.label, label)) &&
            (identical(other.points, points) ||
                const DeepCollectionEquality().equals(other.points, points)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(label) ^
      const DeepCollectionEquality().hash(points);

  @JsonKey(ignore: true)
  @override
  _$MapGeometricObjectCopyWith<_MapGeometricObject> get copyWith =>
      __$MapGeometricObjectCopyWithImpl<_MapGeometricObject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MapGeometricObjectToJson(this);
  }
}

abstract class _MapGeometricObject implements MapGeometricObject {
  const factory _MapGeometricObject(
      {MapGeometricObjectType type,
      String color,
      String label,
      List<Point> points}) = _$_MapGeometricObject;

  factory _MapGeometricObject.fromJson(Map<String, dynamic> json) =
      _$_MapGeometricObject.fromJson;

  @override
  MapGeometricObjectType get type;
  @override
  String get color;
  @override
  String get label;
  @override
  List<Point> get points;
  @override
  @JsonKey(ignore: true)
  _$MapGeometricObjectCopyWith<_MapGeometricObject> get copyWith;
}
