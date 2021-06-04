// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AddressFormStateTearOff {
  const _$AddressFormStateTearOff();

// ignore: unused_element
  _AddressFormState call(
      {String area,
      String district,
      String street,
      String house,
      Address address}) {
    return _AddressFormState(
      area: area,
      district: district,
      street: street,
      house: house,
      address: address,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AddressFormState = _$AddressFormStateTearOff();

/// @nodoc
mixin _$AddressFormState {
  String get area;
  String get district;
  String get street;
  String get house;
  Address get address;

  @JsonKey(ignore: true)
  $AddressFormStateCopyWith<AddressFormState> get copyWith;
}

/// @nodoc
abstract class $AddressFormStateCopyWith<$Res> {
  factory $AddressFormStateCopyWith(
          AddressFormState value, $Res Function(AddressFormState) then) =
      _$AddressFormStateCopyWithImpl<$Res>;
  $Res call(
      {String area,
      String district,
      String street,
      String house,
      Address address});
}

/// @nodoc
class _$AddressFormStateCopyWithImpl<$Res>
    implements $AddressFormStateCopyWith<$Res> {
  _$AddressFormStateCopyWithImpl(this._value, this._then);

  final AddressFormState _value;
  // ignore: unused_field
  final $Res Function(AddressFormState) _then;

  @override
  $Res call({
    Object area = freezed,
    Object district = freezed,
    Object street = freezed,
    Object house = freezed,
    Object address = freezed,
  }) {
    return _then(_value.copyWith(
      area: area == freezed ? _value.area : area as String,
      district: district == freezed ? _value.district : district as String,
      street: street == freezed ? _value.street : street as String,
      house: house == freezed ? _value.house : house as String,
      address: address == freezed ? _value.address : address as Address,
    ));
  }
}

/// @nodoc
abstract class _$AddressFormStateCopyWith<$Res>
    implements $AddressFormStateCopyWith<$Res> {
  factory _$AddressFormStateCopyWith(
          _AddressFormState value, $Res Function(_AddressFormState) then) =
      __$AddressFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String area,
      String district,
      String street,
      String house,
      Address address});
}

/// @nodoc
class __$AddressFormStateCopyWithImpl<$Res>
    extends _$AddressFormStateCopyWithImpl<$Res>
    implements _$AddressFormStateCopyWith<$Res> {
  __$AddressFormStateCopyWithImpl(
      _AddressFormState _value, $Res Function(_AddressFormState) _then)
      : super(_value, (v) => _then(v as _AddressFormState));

  @override
  _AddressFormState get _value => super._value as _AddressFormState;

  @override
  $Res call({
    Object area = freezed,
    Object district = freezed,
    Object street = freezed,
    Object house = freezed,
    Object address = freezed,
  }) {
    return _then(_AddressFormState(
      area: area == freezed ? _value.area : area as String,
      district: district == freezed ? _value.district : district as String,
      street: street == freezed ? _value.street : street as String,
      house: house == freezed ? _value.house : house as String,
      address: address == freezed ? _value.address : address as Address,
    ));
  }
}

/// @nodoc
class _$_AddressFormState implements _AddressFormState {
  const _$_AddressFormState(
      {this.area, this.district, this.street, this.house, this.address});

  @override
  final String area;
  @override
  final String district;
  @override
  final String street;
  @override
  final String house;
  @override
  final Address address;

  @override
  String toString() {
    return 'AddressFormState(area: $area, district: $district, street: $street, house: $house, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AddressFormState &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)) &&
            (identical(other.district, district) ||
                const DeepCollectionEquality()
                    .equals(other.district, district)) &&
            (identical(other.street, street) ||
                const DeepCollectionEquality().equals(other.street, street)) &&
            (identical(other.house, house) ||
                const DeepCollectionEquality().equals(other.house, house)) &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(area) ^
      const DeepCollectionEquality().hash(district) ^
      const DeepCollectionEquality().hash(street) ^
      const DeepCollectionEquality().hash(house) ^
      const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  _$AddressFormStateCopyWith<_AddressFormState> get copyWith =>
      __$AddressFormStateCopyWithImpl<_AddressFormState>(this, _$identity);
}

abstract class _AddressFormState implements AddressFormState {
  const factory _AddressFormState(
      {String area,
      String district,
      String street,
      String house,
      Address address}) = _$_AddressFormState;

  @override
  String get area;
  @override
  String get district;
  @override
  String get street;
  @override
  String get house;
  @override
  Address get address;
  @override
  @JsonKey(ignore: true)
  _$AddressFormStateCopyWith<_AddressFormState> get copyWith;
}
