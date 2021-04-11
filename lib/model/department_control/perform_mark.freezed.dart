// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'perform_mark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PerformMark _$PerformMarkFromJson(Map<String, dynamic> json) {
  return _PerformMark.fromJson(json);
}

/// @nodoc
class _$PerformMarkTearOff {
  const _$PerformMarkTearOff();

// ignore: unused_element
  _PerformMark call(
      {int id,
      DateTime resolveDate,
      String organization,
      String creator,
      String comments,
      List<DCPhoto> photos}) {
    return _PerformMark(
      id: id,
      resolveDate: resolveDate,
      organization: organization,
      creator: creator,
      comments: comments,
      photos: photos,
    );
  }

// ignore: unused_element
  PerformMark fromJson(Map<String, Object> json) {
    return PerformMark.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $PerformMark = _$PerformMarkTearOff();

/// @nodoc
mixin _$PerformMark {
  int get id;
  DateTime get resolveDate;
  String get organization;
  String get creator;
  String get comments;
  List<DCPhoto> get photos;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $PerformMarkCopyWith<PerformMark> get copyWith;
}

/// @nodoc
abstract class $PerformMarkCopyWith<$Res> {
  factory $PerformMarkCopyWith(
          PerformMark value, $Res Function(PerformMark) then) =
      _$PerformMarkCopyWithImpl<$Res>;
  $Res call(
      {int id,
      DateTime resolveDate,
      String organization,
      String creator,
      String comments,
      List<DCPhoto> photos});
}

/// @nodoc
class _$PerformMarkCopyWithImpl<$Res> implements $PerformMarkCopyWith<$Res> {
  _$PerformMarkCopyWithImpl(this._value, this._then);

  final PerformMark _value;
  // ignore: unused_field
  final $Res Function(PerformMark) _then;

  @override
  $Res call({
    Object id = freezed,
    Object resolveDate = freezed,
    Object organization = freezed,
    Object creator = freezed,
    Object comments = freezed,
    Object photos = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      organization: organization == freezed
          ? _value.organization
          : organization as String,
      creator: creator == freezed ? _value.creator : creator as String,
      comments: comments == freezed ? _value.comments : comments as String,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
    ));
  }
}

/// @nodoc
abstract class _$PerformMarkCopyWith<$Res>
    implements $PerformMarkCopyWith<$Res> {
  factory _$PerformMarkCopyWith(
          _PerformMark value, $Res Function(_PerformMark) then) =
      __$PerformMarkCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      DateTime resolveDate,
      String organization,
      String creator,
      String comments,
      List<DCPhoto> photos});
}

/// @nodoc
class __$PerformMarkCopyWithImpl<$Res> extends _$PerformMarkCopyWithImpl<$Res>
    implements _$PerformMarkCopyWith<$Res> {
  __$PerformMarkCopyWithImpl(
      _PerformMark _value, $Res Function(_PerformMark) _then)
      : super(_value, (v) => _then(v as _PerformMark));

  @override
  _PerformMark get _value => super._value as _PerformMark;

  @override
  $Res call({
    Object id = freezed,
    Object resolveDate = freezed,
    Object organization = freezed,
    Object creator = freezed,
    Object comments = freezed,
    Object photos = freezed,
  }) {
    return _then(_PerformMark(
      id: id == freezed ? _value.id : id as int,
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      organization: organization == freezed
          ? _value.organization
          : organization as String,
      creator: creator == freezed ? _value.creator : creator as String,
      comments: comments == freezed ? _value.comments : comments as String,
      photos: photos == freezed ? _value.photos : photos as List<DCPhoto>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_PerformMark implements _PerformMark {
  const _$_PerformMark(
      {this.id,
      this.resolveDate,
      this.organization,
      this.creator,
      this.comments,
      this.photos});

  factory _$_PerformMark.fromJson(Map<String, dynamic> json) =>
      _$_$_PerformMarkFromJson(json);

  @override
  final int id;
  @override
  final DateTime resolveDate;
  @override
  final String organization;
  @override
  final String creator;
  @override
  final String comments;
  @override
  final List<DCPhoto> photos;

  @override
  String toString() {
    return 'PerformMark(id: $id, resolveDate: $resolveDate, organization: $organization, creator: $creator, comments: $comments, photos: $photos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PerformMark &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.resolveDate, resolveDate) ||
                const DeepCollectionEquality()
                    .equals(other.resolveDate, resolveDate)) &&
            (identical(other.organization, organization) ||
                const DeepCollectionEquality()
                    .equals(other.organization, organization)) &&
            (identical(other.creator, creator) ||
                const DeepCollectionEquality()
                    .equals(other.creator, creator)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.photos, photos) ||
                const DeepCollectionEquality().equals(other.photos, photos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(resolveDate) ^
      const DeepCollectionEquality().hash(organization) ^
      const DeepCollectionEquality().hash(creator) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(photos);

  @JsonKey(ignore: true)
  @override
  _$PerformMarkCopyWith<_PerformMark> get copyWith =>
      __$PerformMarkCopyWithImpl<_PerformMark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PerformMarkToJson(this);
  }
}

abstract class _PerformMark implements PerformMark {
  const factory _PerformMark(
      {int id,
      DateTime resolveDate,
      String organization,
      String creator,
      String comments,
      List<DCPhoto> photos}) = _$_PerformMark;

  factory _PerformMark.fromJson(Map<String, dynamic> json) =
      _$_PerformMark.fromJson;

  @override
  int get id;
  @override
  DateTime get resolveDate;
  @override
  String get organization;
  @override
  String get creator;
  @override
  String get comments;
  @override
  List<DCPhoto> get photos;
  @override
  @JsonKey(ignore: true)
  _$PerformMarkCopyWith<_PerformMark> get copyWith;
}
