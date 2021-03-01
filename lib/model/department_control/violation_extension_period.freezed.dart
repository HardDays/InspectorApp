// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'violation_extension_period.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ViolationExtensionPeriod _$ViolationExtensionPeriodFromJson(
    Map<String, dynamic> json) {
  return _ViolationExtensionPeriod.fromJson(json);
}

/// @nodoc
class _$ViolationExtensionPeriodTearOff {
  const _$ViolationExtensionPeriodTearOff();

// ignore: unused_element
  _ViolationExtensionPeriod call(
      {DateTime resolveDate,
      ViolationExtensionReason extensionReason,
      String comments}) {
    return _ViolationExtensionPeriod(
      resolveDate: resolveDate,
      extensionReason: extensionReason,
      comments: comments,
    );
  }

// ignore: unused_element
  ViolationExtensionPeriod fromJson(Map<String, Object> json) {
    return ViolationExtensionPeriod.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ViolationExtensionPeriod = _$ViolationExtensionPeriodTearOff();

/// @nodoc
mixin _$ViolationExtensionPeriod {
  DateTime get resolveDate;
  ViolationExtensionReason get extensionReason;
  String get comments;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ViolationExtensionPeriodCopyWith<ViolationExtensionPeriod> get copyWith;
}

/// @nodoc
abstract class $ViolationExtensionPeriodCopyWith<$Res> {
  factory $ViolationExtensionPeriodCopyWith(ViolationExtensionPeriod value,
          $Res Function(ViolationExtensionPeriod) then) =
      _$ViolationExtensionPeriodCopyWithImpl<$Res>;
  $Res call(
      {DateTime resolveDate,
      ViolationExtensionReason extensionReason,
      String comments});

  $ViolationExtensionReasonCopyWith<$Res> get extensionReason;
}

/// @nodoc
class _$ViolationExtensionPeriodCopyWithImpl<$Res>
    implements $ViolationExtensionPeriodCopyWith<$Res> {
  _$ViolationExtensionPeriodCopyWithImpl(this._value, this._then);

  final ViolationExtensionPeriod _value;
  // ignore: unused_field
  final $Res Function(ViolationExtensionPeriod) _then;

  @override
  $Res call({
    Object resolveDate = freezed,
    Object extensionReason = freezed,
    Object comments = freezed,
  }) {
    return _then(_value.copyWith(
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      extensionReason: extensionReason == freezed
          ? _value.extensionReason
          : extensionReason as ViolationExtensionReason,
      comments: comments == freezed ? _value.comments : comments as String,
    ));
  }

  @override
  $ViolationExtensionReasonCopyWith<$Res> get extensionReason {
    if (_value.extensionReason == null) {
      return null;
    }
    return $ViolationExtensionReasonCopyWith<$Res>(_value.extensionReason,
        (value) {
      return _then(_value.copyWith(extensionReason: value));
    });
  }
}

/// @nodoc
abstract class _$ViolationExtensionPeriodCopyWith<$Res>
    implements $ViolationExtensionPeriodCopyWith<$Res> {
  factory _$ViolationExtensionPeriodCopyWith(_ViolationExtensionPeriod value,
          $Res Function(_ViolationExtensionPeriod) then) =
      __$ViolationExtensionPeriodCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime resolveDate,
      ViolationExtensionReason extensionReason,
      String comments});

  @override
  $ViolationExtensionReasonCopyWith<$Res> get extensionReason;
}

/// @nodoc
class __$ViolationExtensionPeriodCopyWithImpl<$Res>
    extends _$ViolationExtensionPeriodCopyWithImpl<$Res>
    implements _$ViolationExtensionPeriodCopyWith<$Res> {
  __$ViolationExtensionPeriodCopyWithImpl(_ViolationExtensionPeriod _value,
      $Res Function(_ViolationExtensionPeriod) _then)
      : super(_value, (v) => _then(v as _ViolationExtensionPeriod));

  @override
  _ViolationExtensionPeriod get _value =>
      super._value as _ViolationExtensionPeriod;

  @override
  $Res call({
    Object resolveDate = freezed,
    Object extensionReason = freezed,
    Object comments = freezed,
  }) {
    return _then(_ViolationExtensionPeriod(
      resolveDate:
          resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      extensionReason: extensionReason == freezed
          ? _value.extensionReason
          : extensionReason as ViolationExtensionReason,
      comments: comments == freezed ? _value.comments : comments as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ViolationExtensionPeriod implements _ViolationExtensionPeriod {
  const _$_ViolationExtensionPeriod(
      {this.resolveDate, this.extensionReason, this.comments});

  factory _$_ViolationExtensionPeriod.fromJson(Map<String, dynamic> json) =>
      _$_$_ViolationExtensionPeriodFromJson(json);

  @override
  final DateTime resolveDate;
  @override
  final ViolationExtensionReason extensionReason;
  @override
  final String comments;

  @override
  String toString() {
    return 'ViolationExtensionPeriod(resolveDate: $resolveDate, extensionReason: $extensionReason, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ViolationExtensionPeriod &&
            (identical(other.resolveDate, resolveDate) ||
                const DeepCollectionEquality()
                    .equals(other.resolveDate, resolveDate)) &&
            (identical(other.extensionReason, extensionReason) ||
                const DeepCollectionEquality()
                    .equals(other.extensionReason, extensionReason)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(resolveDate) ^
      const DeepCollectionEquality().hash(extensionReason) ^
      const DeepCollectionEquality().hash(comments);

  @JsonKey(ignore: true)
  @override
  _$ViolationExtensionPeriodCopyWith<_ViolationExtensionPeriod> get copyWith =>
      __$ViolationExtensionPeriodCopyWithImpl<_ViolationExtensionPeriod>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ViolationExtensionPeriodToJson(this);
  }
}

abstract class _ViolationExtensionPeriod implements ViolationExtensionPeriod {
  const factory _ViolationExtensionPeriod(
      {DateTime resolveDate,
      ViolationExtensionReason extensionReason,
      String comments}) = _$_ViolationExtensionPeriod;

  factory _ViolationExtensionPeriod.fromJson(Map<String, dynamic> json) =
      _$_ViolationExtensionPeriod.fromJson;

  @override
  DateTime get resolveDate;
  @override
  ViolationExtensionReason get extensionReason;
  @override
  String get comments;
  @override
  @JsonKey(ignore: true)
  _$ViolationExtensionPeriodCopyWith<_ViolationExtensionPeriod> get copyWith;
}
