// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DepartmentControlLocalServiceMetadata
    _$DepartmentControlLocalServiceMetadataFromJson(Map<String, dynamic> json) {
  return _DepartmentControlLocalServiceMetadata.fromJson(json);
}

/// @nodoc
class _$DepartmentControlLocalServiceMetadataTearOff {
  const _$DepartmentControlLocalServiceMetadataTearOff();

// ignore: unused_element
  _DepartmentControlLocalServiceMetadata call(
      DateTime lastUpdatedDate, int count, bool loaded) {
    return _DepartmentControlLocalServiceMetadata(
      lastUpdatedDate,
      count,
      loaded,
    );
  }

// ignore: unused_element
  DepartmentControlLocalServiceMetadata fromJson(Map<String, Object> json) {
    return DepartmentControlLocalServiceMetadata.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DepartmentControlLocalServiceMetadata =
    _$DepartmentControlLocalServiceMetadataTearOff();

/// @nodoc
mixin _$DepartmentControlLocalServiceMetadata {
  DateTime get lastUpdatedDate;
  int get count;
  bool get loaded;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $DepartmentControlLocalServiceMetadataCopyWith<
      DepartmentControlLocalServiceMetadata> get copyWith;
}

/// @nodoc
abstract class $DepartmentControlLocalServiceMetadataCopyWith<$Res> {
  factory $DepartmentControlLocalServiceMetadataCopyWith(
          DepartmentControlLocalServiceMetadata value,
          $Res Function(DepartmentControlLocalServiceMetadata) then) =
      _$DepartmentControlLocalServiceMetadataCopyWithImpl<$Res>;
  $Res call({DateTime lastUpdatedDate, int count, bool loaded});
}

/// @nodoc
class _$DepartmentControlLocalServiceMetadataCopyWithImpl<$Res>
    implements $DepartmentControlLocalServiceMetadataCopyWith<$Res> {
  _$DepartmentControlLocalServiceMetadataCopyWithImpl(this._value, this._then);

  final DepartmentControlLocalServiceMetadata _value;
  // ignore: unused_field
  final $Res Function(DepartmentControlLocalServiceMetadata) _then;

  @override
  $Res call({
    Object lastUpdatedDate = freezed,
    Object count = freezed,
    Object loaded = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdatedDate: lastUpdatedDate == freezed
          ? _value.lastUpdatedDate
          : lastUpdatedDate as DateTime,
      count: count == freezed ? _value.count : count as int,
      loaded: loaded == freezed ? _value.loaded : loaded as bool,
    ));
  }
}

/// @nodoc
abstract class _$DepartmentControlLocalServiceMetadataCopyWith<$Res>
    implements $DepartmentControlLocalServiceMetadataCopyWith<$Res> {
  factory _$DepartmentControlLocalServiceMetadataCopyWith(
          _DepartmentControlLocalServiceMetadata value,
          $Res Function(_DepartmentControlLocalServiceMetadata) then) =
      __$DepartmentControlLocalServiceMetadataCopyWithImpl<$Res>;
  @override
  $Res call({DateTime lastUpdatedDate, int count, bool loaded});
}

/// @nodoc
class __$DepartmentControlLocalServiceMetadataCopyWithImpl<$Res>
    extends _$DepartmentControlLocalServiceMetadataCopyWithImpl<$Res>
    implements _$DepartmentControlLocalServiceMetadataCopyWith<$Res> {
  __$DepartmentControlLocalServiceMetadataCopyWithImpl(
      _DepartmentControlLocalServiceMetadata _value,
      $Res Function(_DepartmentControlLocalServiceMetadata) _then)
      : super(
            _value, (v) => _then(v as _DepartmentControlLocalServiceMetadata));

  @override
  _DepartmentControlLocalServiceMetadata get _value =>
      super._value as _DepartmentControlLocalServiceMetadata;

  @override
  $Res call({
    Object lastUpdatedDate = freezed,
    Object count = freezed,
    Object loaded = freezed,
  }) {
    return _then(_DepartmentControlLocalServiceMetadata(
      lastUpdatedDate == freezed
          ? _value.lastUpdatedDate
          : lastUpdatedDate as DateTime,
      count == freezed ? _value.count : count as int,
      loaded == freezed ? _value.loaded : loaded as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_DepartmentControlLocalServiceMetadata
    implements _DepartmentControlLocalServiceMetadata {
  const _$_DepartmentControlLocalServiceMetadata(
      this.lastUpdatedDate, this.count, this.loaded)
      : assert(lastUpdatedDate != null),
        assert(count != null),
        assert(loaded != null);

  factory _$_DepartmentControlLocalServiceMetadata.fromJson(
          Map<String, dynamic> json) =>
      _$_$_DepartmentControlLocalServiceMetadataFromJson(json);

  @override
  final DateTime lastUpdatedDate;
  @override
  final int count;
  @override
  final bool loaded;

  @override
  String toString() {
    return 'DepartmentControlLocalServiceMetadata(lastUpdatedDate: $lastUpdatedDate, count: $count, loaded: $loaded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DepartmentControlLocalServiceMetadata &&
            (identical(other.lastUpdatedDate, lastUpdatedDate) ||
                const DeepCollectionEquality()
                    .equals(other.lastUpdatedDate, lastUpdatedDate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)) &&
            (identical(other.loaded, loaded) ||
                const DeepCollectionEquality().equals(other.loaded, loaded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(lastUpdatedDate) ^
      const DeepCollectionEquality().hash(count) ^
      const DeepCollectionEquality().hash(loaded);

  @JsonKey(ignore: true)
  @override
  _$DepartmentControlLocalServiceMetadataCopyWith<
          _DepartmentControlLocalServiceMetadata>
      get copyWith => __$DepartmentControlLocalServiceMetadataCopyWithImpl<
          _DepartmentControlLocalServiceMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DepartmentControlLocalServiceMetadataToJson(this);
  }
}

abstract class _DepartmentControlLocalServiceMetadata
    implements DepartmentControlLocalServiceMetadata {
  const factory _DepartmentControlLocalServiceMetadata(
          DateTime lastUpdatedDate, int count, bool loaded) =
      _$_DepartmentControlLocalServiceMetadata;

  factory _DepartmentControlLocalServiceMetadata.fromJson(
          Map<String, dynamic> json) =
      _$_DepartmentControlLocalServiceMetadata.fromJson;

  @override
  DateTime get lastUpdatedDate;
  @override
  int get count;
  @override
  bool get loaded;
  @override
  @JsonKey(ignore: true)
  _$DepartmentControlLocalServiceMetadataCopyWith<
      _DepartmentControlLocalServiceMetadata> get copyWith;
}
