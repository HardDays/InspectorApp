// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'contractor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Contractor _$ContractorFromJson(Map<String, dynamic> json) {
  return _Contractor.fromJson(json);
}

/// @nodoc
class _$ContractorTearOff {
  const _$ContractorTearOff();

// ignore: unused_element
  _Contractor call({int id, String name, String inn}) {
    return _Contractor(
      id: id,
      name: name,
      inn: inn,
    );
  }

// ignore: unused_element
  Contractor fromJson(Map<String, Object> json) {
    return Contractor.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Contractor = _$ContractorTearOff();

/// @nodoc
mixin _$Contractor {
  int get id;
  String get name;
  String get inn;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ContractorCopyWith<Contractor> get copyWith;
}

/// @nodoc
abstract class $ContractorCopyWith<$Res> {
  factory $ContractorCopyWith(
          Contractor value, $Res Function(Contractor) then) =
      _$ContractorCopyWithImpl<$Res>;
  $Res call({int id, String name, String inn});
}

/// @nodoc
class _$ContractorCopyWithImpl<$Res> implements $ContractorCopyWith<$Res> {
  _$ContractorCopyWithImpl(this._value, this._then);

  final Contractor _value;
  // ignore: unused_field
  final $Res Function(Contractor) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object inn = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      inn: inn == freezed ? _value.inn : inn as String,
    ));
  }
}

/// @nodoc
abstract class _$ContractorCopyWith<$Res> implements $ContractorCopyWith<$Res> {
  factory _$ContractorCopyWith(
          _Contractor value, $Res Function(_Contractor) then) =
      __$ContractorCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name, String inn});
}

/// @nodoc
class __$ContractorCopyWithImpl<$Res> extends _$ContractorCopyWithImpl<$Res>
    implements _$ContractorCopyWith<$Res> {
  __$ContractorCopyWithImpl(
      _Contractor _value, $Res Function(_Contractor) _then)
      : super(_value, (v) => _then(v as _Contractor));

  @override
  _Contractor get _value => super._value as _Contractor;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object inn = freezed,
  }) {
    return _then(_Contractor(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      inn: inn == freezed ? _value.inn : inn as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Contractor extends _Contractor {
  const _$_Contractor({this.id, this.name, this.inn}) : super._();

  factory _$_Contractor.fromJson(Map<String, dynamic> json) =>
      _$_$_ContractorFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String inn;

  @override
  String toString() {
    return 'Contractor(id: $id, name: $name, inn: $inn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Contractor &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.inn, inn) ||
                const DeepCollectionEquality().equals(other.inn, inn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(inn);

  @JsonKey(ignore: true)
  @override
  _$ContractorCopyWith<_Contractor> get copyWith =>
      __$ContractorCopyWithImpl<_Contractor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContractorToJson(this);
  }
}

abstract class _Contractor extends Contractor {
  const _Contractor._() : super._();
  const factory _Contractor({int id, String name, String inn}) = _$_Contractor;

  factory _Contractor.fromJson(Map<String, dynamic> json) =
      _$_Contractor.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get inn;
  @override
  @JsonKey(ignore: true)
  _$ContractorCopyWith<_Contractor> get copyWith;
}
