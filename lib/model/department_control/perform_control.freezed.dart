// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'perform_control.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PerformControl _$PerformControlFromJson(Map<String, dynamic> json) {
  return _PerformControl.fromJson(json);
}

/// @nodoc
class _$PerformControlTearOff {
  const _$PerformControlTearOff();

// ignore: unused_element
  _PerformControl call(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos}) {
    return _PerformControl(
      id: id,
      planDate: planDate,
      factDate: factDate,
      resolved: resolved,
      photos: photos,
    );
  }

// ignore: unused_element
  PerformControl fromJson(Map<String, Object> json) {
    return PerformControl.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PerformControl = _$PerformControlTearOff();

/// @nodoc
mixin _$PerformControl {
  int get id;
  DateTime get planDate;
  DateTime get factDate;
  bool get resolved;
  List<DCPhoto> get photos;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PerformControlCopyWith<PerformControl> get copyWith;
}

/// @nodoc
abstract class $PerformControlCopyWith<$Res> {
  factory $PerformControlCopyWith(
          PerformControl value, $Res Function(PerformControl) then) =
      _$PerformControlCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos});
}

/// @nodoc
class _$PerformControlCopyWithImpl<$Res>
    implements $PerformControlCopyWith<$Res> {
  _$PerformControlCopyWithImpl(this._value, this._then);

  final PerformControl _value;
  // ignore: unused_field
  final $Res Function(PerformControl) _then;

  @override
  $Res call({
    Object id = freezed,
    Object planDate = freezed,
    Object factDate = freezed,
    Object resolved = freezed,
    Object photos = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      planDate: planDate == freezed ? _value.planDate : planDate as DateTime,
      factDate: factDate == freezed ? _value.factDate : factDate as DateTime,
      resolved: resolved == freezed ? _value.resolved : resolved as bool,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
    ));
  }
}

/// @nodoc
abstract class _$PerformControlCopyWith<$Res>
    implements $PerformControlCopyWith<$Res> {
  factory _$PerformControlCopyWith(
          _PerformControl value, $Res Function(_PerformControl) then) =
      __$PerformControlCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos});
}

/// @nodoc
class __$PerformControlCopyWithImpl<$Res>
    extends _$PerformControlCopyWithImpl<$Res>
    implements _$PerformControlCopyWith<$Res> {
  __$PerformControlCopyWithImpl(
      _PerformControl _value, $Res Function(_PerformControl) _then)
      : super(_value, (v) => _then(v as _PerformControl));

  @override
  _PerformControl get _value => super._value as _PerformControl;

  @override
  $Res call({
    Object id = freezed,
    Object planDate = freezed,
    Object factDate = freezed,
    Object resolved = freezed,
    Object photos = freezed,
  }) {
    return _then(_PerformControl(
      id: id == freezed ? _value.id : id as int,
      planDate: planDate == freezed ? _value.planDate : planDate as DateTime,
      factDate: factDate == freezed ? _value.factDate : factDate as DateTime,
      resolved: resolved == freezed ? _value.resolved : resolved as bool,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PerformControl implements _PerformControl {
  const _$_PerformControl(
      {this.id, this.planDate, this.factDate, this.resolved, this.photos});

  factory _$_PerformControl.fromJson(Map<String, dynamic> json) =>
      _$_$_PerformControlFromJson(json);

  @override
  final int id;
  @override
  final DateTime planDate;
  @override
  final DateTime factDate;
  @override
  final bool resolved;
  @override
  final List<DCPhoto> photos;

  @override
  String toString() {
    return 'PerformControl(id: $id, planDate: $planDate, factDate: $factDate, resolved: $resolved, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PerformControl &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.planDate, planDate) ||
                const DeepCollectionEquality()
                    .equals(other.planDate, planDate)) &&
            (identical(other.factDate, factDate) ||
                const DeepCollectionEquality()
                    .equals(other.factDate, factDate)) &&
            (identical(other.resolved, resolved) ||
                const DeepCollectionEquality()
                    .equals(other.resolved, resolved)) &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(planDate) ^
      const DeepCollectionEquality().hash(factDate) ^
      const DeepCollectionEquality().hash(resolved) ^
      const DeepCollectionEquality().hash(photos);

  @JsonKey(ignore: true)
  @override
  _$PerformControlCopyWith<_PerformControl> get copyWith =>
      __$PerformControlCopyWithImpl<_PerformControl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PerformControlToJson(this);
  }
}

abstract class _PerformControl implements PerformControl {
  const factory _PerformControl(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos}) = _$_PerformControl;

  factory _PerformControl.fromJson(Map<String, dynamic> json) =
      _$_PerformControl.fromJson;

  @override
  int get id;
  @override
  DateTime get planDate;
  @override
  DateTime get factDate;
  @override
  bool get resolved;
  @override
  List<DCPhoto> get photos;
  @override
  @JsonKey(ignore: true)
  _$PerformControlCopyWith<_PerformControl> get copyWith;
}
