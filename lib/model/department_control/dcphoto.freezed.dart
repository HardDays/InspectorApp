// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'dcphoto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DCPhoto _$DCPhotoFromJson(Map<String, dynamic> json) {
  return _DCPhoto.fromJson(json);
}

/// @nodoc
class _$DCPhotoTearOff {
  const _$DCPhotoTearOff();

// ignore: unused_element
  _DCPhoto call(
      {int id,
      String name,
      String data,
      String loadDate,
      double geometryX,
      double geometryY}) {
    return _DCPhoto(
      id: id,
      name: name,
      data: data,
      loadDate: loadDate,
      geometryX: geometryX,
      geometryY: geometryY,
    );
  }

// ignore: unused_element
  DCPhoto fromJson(Map<String, Object> json) {
    return DCPhoto.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DCPhoto = _$DCPhotoTearOff();

/// @nodoc
mixin _$DCPhoto {
  int get id;
  String get name;
  String get data;
  String get loadDate;
  double get geometryX;
  double get geometryY;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DCPhotoCopyWith<DCPhoto> get copyWith;
}

/// @nodoc
abstract class $DCPhotoCopyWith<$Res> {
  factory $DCPhotoCopyWith(DCPhoto value, $Res Function(DCPhoto) then) =
      _$DCPhotoCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      String data,
      String loadDate,
      double geometryX,
      double geometryY});
}

/// @nodoc
class _$DCPhotoCopyWithImpl<$Res> implements $DCPhotoCopyWith<$Res> {
  _$DCPhotoCopyWithImpl(this._value, this._then);

  final DCPhoto _value;
  // ignore: unused_field
  final $Res Function(DCPhoto) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object data = freezed,
    Object loadDate = freezed,
    Object geometryX = freezed,
    Object geometryY = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      data: data == freezed ? _value.data : data as String,
      loadDate: loadDate == freezed ? _value.loadDate : loadDate as String,
      geometryX: geometryX == freezed ? _value.geometryX : geometryX as double,
      geometryY: geometryY == freezed ? _value.geometryY : geometryY as double,
    ));
  }
}

/// @nodoc
abstract class _$DCPhotoCopyWith<$Res> implements $DCPhotoCopyWith<$Res> {
  factory _$DCPhotoCopyWith(_DCPhoto value, $Res Function(_DCPhoto) then) =
      __$DCPhotoCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      String data,
      String loadDate,
      double geometryX,
      double geometryY});
}

/// @nodoc
class __$DCPhotoCopyWithImpl<$Res> extends _$DCPhotoCopyWithImpl<$Res>
    implements _$DCPhotoCopyWith<$Res> {
  __$DCPhotoCopyWithImpl(_DCPhoto _value, $Res Function(_DCPhoto) _then)
      : super(_value, (v) => _then(v as _DCPhoto));

  @override
  _DCPhoto get _value => super._value as _DCPhoto;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object data = freezed,
    Object loadDate = freezed,
    Object geometryX = freezed,
    Object geometryY = freezed,
  }) {
    return _then(_DCPhoto(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      data: data == freezed ? _value.data : data as String,
      loadDate: loadDate == freezed ? _value.loadDate : loadDate as String,
      geometryX: geometryX == freezed ? _value.geometryX : geometryX as double,
      geometryY: geometryY == freezed ? _value.geometryY : geometryY as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DCPhoto implements _DCPhoto {
  const _$_DCPhoto(
      {this.id,
      this.name,
      this.data,
      this.loadDate,
      this.geometryX,
      this.geometryY});

  factory _$_DCPhoto.fromJson(Map<String, dynamic> json) =>
      _$_$_DCPhotoFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String data;
  @override
  final String loadDate;
  @override
  final double geometryX;
  @override
  final double geometryY;

  @override
  String toString() {
    return 'DCPhoto(id: $id, name: $name, data: $data, loadDate: $loadDate, geometryX: $geometryX, geometryY: $geometryY)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DCPhoto &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.loadDate, loadDate) ||
                const DeepCollectionEquality()
                    .equals(other.loadDate, loadDate)) &&
            (identical(other.geometryX, geometryX) ||
                const DeepCollectionEquality()
                    .equals(other.geometryX, geometryX)) &&
            (identical(other.geometryY, geometryY) ||
                const DeepCollectionEquality()
                    .equals(other.geometryY, geometryY)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(loadDate) ^
      const DeepCollectionEquality().hash(geometryX) ^
      const DeepCollectionEquality().hash(geometryY);

  @JsonKey(ignore: true)
  @override
  _$DCPhotoCopyWith<_DCPhoto> get copyWith =>
      __$DCPhotoCopyWithImpl<_DCPhoto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DCPhotoToJson(this);
  }
}

abstract class _DCPhoto implements DCPhoto {
  const factory _DCPhoto(
      {int id,
      String name,
      String data,
      String loadDate,
      double geometryX,
      double geometryY}) = _$_DCPhoto;

  factory _DCPhoto.fromJson(Map<String, dynamic> json) = _$_DCPhoto.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get data;
  @override
  String get loadDate;
  @override
  double get geometryX;
  @override
  double get geometryY;
  @override
  @JsonKey(ignore: true)
  _$DCPhotoCopyWith<_DCPhoto> get copyWith;
}
