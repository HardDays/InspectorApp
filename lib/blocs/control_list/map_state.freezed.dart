// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlObjectsMapStateTearOff {
  const _$ControlObjectsMapStateTearOff();

// ignore: unused_element
  _ControlObjectsMapState call(
      {ControlObject selectedObject, Location userLocation}) {
    return _ControlObjectsMapState(
      selectedObject: selectedObject,
      userLocation: userLocation,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectsMapState = _$ControlObjectsMapStateTearOff();

/// @nodoc
mixin _$ControlObjectsMapState {
  ControlObject get selectedObject;
  Location get userLocation;

  @JsonKey(ignore: true)
  $ControlObjectsMapStateCopyWith<ControlObjectsMapState> get copyWith;
}

/// @nodoc
abstract class $ControlObjectsMapStateCopyWith<$Res> {
  factory $ControlObjectsMapStateCopyWith(ControlObjectsMapState value,
          $Res Function(ControlObjectsMapState) then) =
      _$ControlObjectsMapStateCopyWithImpl<$Res>;
  $Res call({ControlObject selectedObject, Location userLocation});

  $ControlObjectCopyWith<$Res> get selectedObject;
  $LocationCopyWith<$Res> get userLocation;
}

/// @nodoc
class _$ControlObjectsMapStateCopyWithImpl<$Res>
    implements $ControlObjectsMapStateCopyWith<$Res> {
  _$ControlObjectsMapStateCopyWithImpl(this._value, this._then);

  final ControlObjectsMapState _value;
  // ignore: unused_field
  final $Res Function(ControlObjectsMapState) _then;

  @override
  $Res call({
    Object selectedObject = freezed,
    Object userLocation = freezed,
  }) {
    return _then(_value.copyWith(
      selectedObject: selectedObject == freezed
          ? _value.selectedObject
          : selectedObject as ControlObject,
      userLocation: userLocation == freezed
          ? _value.userLocation
          : userLocation as Location,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get selectedObject {
    if (_value.selectedObject == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.selectedObject, (value) {
      return _then(_value.copyWith(selectedObject: value));
    });
  }

  @override
  $LocationCopyWith<$Res> get userLocation {
    if (_value.userLocation == null) {
      return null;
    }
    return $LocationCopyWith<$Res>(_value.userLocation, (value) {
      return _then(_value.copyWith(userLocation: value));
    });
  }
}

/// @nodoc
abstract class _$ControlObjectsMapStateCopyWith<$Res>
    implements $ControlObjectsMapStateCopyWith<$Res> {
  factory _$ControlObjectsMapStateCopyWith(_ControlObjectsMapState value,
          $Res Function(_ControlObjectsMapState) then) =
      __$ControlObjectsMapStateCopyWithImpl<$Res>;
  @override
  $Res call({ControlObject selectedObject, Location userLocation});

  @override
  $ControlObjectCopyWith<$Res> get selectedObject;
  @override
  $LocationCopyWith<$Res> get userLocation;
}

/// @nodoc
class __$ControlObjectsMapStateCopyWithImpl<$Res>
    extends _$ControlObjectsMapStateCopyWithImpl<$Res>
    implements _$ControlObjectsMapStateCopyWith<$Res> {
  __$ControlObjectsMapStateCopyWithImpl(_ControlObjectsMapState _value,
      $Res Function(_ControlObjectsMapState) _then)
      : super(_value, (v) => _then(v as _ControlObjectsMapState));

  @override
  _ControlObjectsMapState get _value => super._value as _ControlObjectsMapState;

  @override
  $Res call({
    Object selectedObject = freezed,
    Object userLocation = freezed,
  }) {
    return _then(_ControlObjectsMapState(
      selectedObject: selectedObject == freezed
          ? _value.selectedObject
          : selectedObject as ControlObject,
      userLocation: userLocation == freezed
          ? _value.userLocation
          : userLocation as Location,
    ));
  }
}

/// @nodoc
class _$_ControlObjectsMapState implements _ControlObjectsMapState {
  const _$_ControlObjectsMapState({this.selectedObject, this.userLocation});

  @override
  final ControlObject selectedObject;
  @override
  final Location userLocation;

  @override
  String toString() {
    return 'ControlObjectsMapState(selectedObject: $selectedObject, userLocation: $userLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlObjectsMapState &&
            (identical(other.selectedObject, selectedObject) ||
                const DeepCollectionEquality()
                    .equals(other.selectedObject, selectedObject)) &&
            (identical(other.userLocation, userLocation) ||
                const DeepCollectionEquality()
                    .equals(other.userLocation, userLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedObject) ^
      const DeepCollectionEquality().hash(userLocation);

  @JsonKey(ignore: true)
  @override
  _$ControlObjectsMapStateCopyWith<_ControlObjectsMapState> get copyWith =>
      __$ControlObjectsMapStateCopyWithImpl<_ControlObjectsMapState>(
          this, _$identity);
}

abstract class _ControlObjectsMapState implements ControlObjectsMapState {
  const factory _ControlObjectsMapState(
      {ControlObject selectedObject,
      Location userLocation}) = _$_ControlObjectsMapState;

  @override
  ControlObject get selectedObject;
  @override
  Location get userLocation;
  @override
  @JsonKey(ignore: true)
  _$ControlObjectsMapStateCopyWith<_ControlObjectsMapState> get copyWith;
}
