// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'perform_control_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PerformControlSearchResult _$PerformControlSearchResultFromJson(
    Map<String, dynamic> json) {
  return _PerformControlSearchResult.fromJson(json);
}

/// @nodoc
class _$PerformControlSearchResultTearOff {
  const _$PerformControlSearchResultTearOff();

// ignore: unused_element
  _PerformControlSearchResult call(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos,
      String creatorShortFio,
      bool sentToCafap}) {
    return _PerformControlSearchResult(
      id: id,
      planDate: planDate,
      factDate: factDate,
      resolved: resolved,
      photos: photos,
      creatorShortFio: creatorShortFio,
      sentToCafap: sentToCafap,
    );
  }

// ignore: unused_element
  PerformControlSearchResult fromJson(Map<String, Object> json) {
    return PerformControlSearchResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PerformControlSearchResult = _$PerformControlSearchResultTearOff();

/// @nodoc
mixin _$PerformControlSearchResult {
  int get id;
  DateTime get planDate;
  DateTime get factDate;
  bool get resolved;
  List<DCPhoto> get photos;
  String get creatorShortFio;
  bool get sentToCafap;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PerformControlSearchResultCopyWith<PerformControlSearchResult> get copyWith;
}

/// @nodoc
abstract class $PerformControlSearchResultCopyWith<$Res> {
  factory $PerformControlSearchResultCopyWith(PerformControlSearchResult value,
          $Res Function(PerformControlSearchResult) then) =
      _$PerformControlSearchResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos,
      String creatorShortFio,
      bool sentToCafap});
}

/// @nodoc
class _$PerformControlSearchResultCopyWithImpl<$Res>
    implements $PerformControlSearchResultCopyWith<$Res> {
  _$PerformControlSearchResultCopyWithImpl(this._value, this._then);

  final PerformControlSearchResult _value;
  // ignore: unused_field
  final $Res Function(PerformControlSearchResult) _then;

  @override
  $Res call({
    Object id = freezed,
    Object planDate = freezed,
    Object factDate = freezed,
    Object resolved = freezed,
    Object photos = freezed,
    Object creatorShortFio = freezed,
    Object sentToCafap = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      planDate: planDate == freezed ? _value.planDate : planDate as DateTime,
      factDate: factDate == freezed ? _value.factDate : factDate as DateTime,
      resolved: resolved == freezed ? _value.resolved : resolved as bool,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
      creatorShortFio: creatorShortFio == freezed
          ? _value.creatorShortFio
          : creatorShortFio as String,
      sentToCafap:
          sentToCafap == freezed ? _value.sentToCafap : sentToCafap as bool,
    ));
  }
}

/// @nodoc
abstract class _$PerformControlSearchResultCopyWith<$Res>
    implements $PerformControlSearchResultCopyWith<$Res> {
  factory _$PerformControlSearchResultCopyWith(
          _PerformControlSearchResult value,
          $Res Function(_PerformControlSearchResult) then) =
      __$PerformControlSearchResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos,
      String creatorShortFio,
      bool sentToCafap});
}

/// @nodoc
class __$PerformControlSearchResultCopyWithImpl<$Res>
    extends _$PerformControlSearchResultCopyWithImpl<$Res>
    implements _$PerformControlSearchResultCopyWith<$Res> {
  __$PerformControlSearchResultCopyWithImpl(_PerformControlSearchResult _value,
      $Res Function(_PerformControlSearchResult) _then)
      : super(_value, (v) => _then(v as _PerformControlSearchResult));

  @override
  _PerformControlSearchResult get _value =>
      super._value as _PerformControlSearchResult;

  @override
  $Res call({
    Object id = freezed,
    Object planDate = freezed,
    Object factDate = freezed,
    Object resolved = freezed,
    Object photos = freezed,
    Object creatorShortFio = freezed,
    Object sentToCafap = freezed,
  }) {
    return _then(_PerformControlSearchResult(
      id: id == freezed ? _value.id : id as int,
      planDate: planDate == freezed ? _value.planDate : planDate as DateTime,
      factDate: factDate == freezed ? _value.factDate : factDate as DateTime,
      resolved: resolved == freezed ? _value.resolved : resolved as bool,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
      creatorShortFio: creatorShortFio == freezed
          ? _value.creatorShortFio
          : creatorShortFio as String,
      sentToCafap:
          sentToCafap == freezed ? _value.sentToCafap : sentToCafap as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PerformControlSearchResult implements _PerformControlSearchResult {
  const _$_PerformControlSearchResult(
      {this.id,
      this.planDate,
      this.factDate,
      this.resolved,
      this.photos,
      this.creatorShortFio,
      this.sentToCafap});

  factory _$_PerformControlSearchResult.fromJson(Map<String, dynamic> json) =>
      _$_$_PerformControlSearchResultFromJson(json);

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
  final String creatorShortFio;
  @override
  final bool sentToCafap;

  @override
  String toString() {
    return 'PerformControlSearchResult(id: $id, planDate: $planDate, factDate: $factDate, resolved: $resolved, photos: $photos, creatorShortFio: $creatorShortFio, sentToCafap: $sentToCafap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PerformControlSearchResult &&
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
                const DeepCollectionEquality().equals(other.photos, photos)) &&
            (identical(other.creatorShortFio, creatorShortFio) ||
                const DeepCollectionEquality()
                    .equals(other.creatorShortFio, creatorShortFio)) &&
            (identical(other.sentToCafap, sentToCafap) ||
                const DeepCollectionEquality()
                    .equals(other.sentToCafap, sentToCafap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(planDate) ^
      const DeepCollectionEquality().hash(factDate) ^
      const DeepCollectionEquality().hash(resolved) ^
      const DeepCollectionEquality().hash(photos) ^
      const DeepCollectionEquality().hash(creatorShortFio) ^
      const DeepCollectionEquality().hash(sentToCafap);

  @JsonKey(ignore: true)
  @override
  _$PerformControlSearchResultCopyWith<_PerformControlSearchResult>
      get copyWith => __$PerformControlSearchResultCopyWithImpl<
          _PerformControlSearchResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PerformControlSearchResultToJson(this);
  }
}

abstract class _PerformControlSearchResult
    implements PerformControlSearchResult {
  const factory _PerformControlSearchResult(
      {int id,
      DateTime planDate,
      DateTime factDate,
      bool resolved,
      List<DCPhoto> photos,
      String creatorShortFio,
      bool sentToCafap}) = _$_PerformControlSearchResult;

  factory _PerformControlSearchResult.fromJson(Map<String, dynamic> json) =
      _$_PerformControlSearchResult.fromJson;

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
  String get creatorShortFio;
  @override
  bool get sentToCafap;
  @override
  @JsonKey(ignore: true)
  _$PerformControlSearchResultCopyWith<_PerformControlSearchResult>
      get copyWith;
}
