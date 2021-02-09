// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlFiltersBlocEventTearOff {
  const _$ControlFiltersBlocEventTearOff();

// ignore: unused_element
  ChangeDCObjectTypeEvent changeDCObjectType(DCObjectType type) {
    return ChangeDCObjectTypeEvent(
      type,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlFiltersBlocEvent = _$ControlFiltersBlocEventTearOff();

/// @nodoc
mixin _$ControlFiltersBlocEvent {
  DCObjectType get type;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDCObjectType(DCObjectType type),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDCObjectType(DCObjectType type),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDCObjectType(ChangeDCObjectTypeEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDCObjectType(ChangeDCObjectTypeEvent value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ControlFiltersBlocEventCopyWith<ControlFiltersBlocEvent> get copyWith;
}

/// @nodoc
abstract class $ControlFiltersBlocEventCopyWith<$Res> {
  factory $ControlFiltersBlocEventCopyWith(ControlFiltersBlocEvent value,
          $Res Function(ControlFiltersBlocEvent) then) =
      _$ControlFiltersBlocEventCopyWithImpl<$Res>;
  $Res call({DCObjectType type});
}

/// @nodoc
class _$ControlFiltersBlocEventCopyWithImpl<$Res>
    implements $ControlFiltersBlocEventCopyWith<$Res> {
  _$ControlFiltersBlocEventCopyWithImpl(this._value, this._then);

  final ControlFiltersBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ControlFiltersBlocEvent) _then;

  @override
  $Res call({
    Object type = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed ? _value.type : type as DCObjectType,
    ));
  }
}

/// @nodoc
abstract class $ChangeDCObjectTypeEventCopyWith<$Res>
    implements $ControlFiltersBlocEventCopyWith<$Res> {
  factory $ChangeDCObjectTypeEventCopyWith(ChangeDCObjectTypeEvent value,
          $Res Function(ChangeDCObjectTypeEvent) then) =
      _$ChangeDCObjectTypeEventCopyWithImpl<$Res>;
  @override
  $Res call({DCObjectType type});
}

/// @nodoc
class _$ChangeDCObjectTypeEventCopyWithImpl<$Res>
    extends _$ControlFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeDCObjectTypeEventCopyWith<$Res> {
  _$ChangeDCObjectTypeEventCopyWithImpl(ChangeDCObjectTypeEvent _value,
      $Res Function(ChangeDCObjectTypeEvent) _then)
      : super(_value, (v) => _then(v as ChangeDCObjectTypeEvent));

  @override
  ChangeDCObjectTypeEvent get _value => super._value as ChangeDCObjectTypeEvent;

  @override
  $Res call({
    Object type = freezed,
  }) {
    return _then(ChangeDCObjectTypeEvent(
      type == freezed ? _value.type : type as DCObjectType,
    ));
  }
}

/// @nodoc
class _$ChangeDCObjectTypeEvent implements ChangeDCObjectTypeEvent {
  const _$ChangeDCObjectTypeEvent(this.type) : assert(type != null);

  @override
  final DCObjectType type;

  @override
  String toString() {
    return 'ControlFiltersBlocEvent.changeDCObjectType(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeDCObjectTypeEvent &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  $ChangeDCObjectTypeEventCopyWith<ChangeDCObjectTypeEvent> get copyWith =>
      _$ChangeDCObjectTypeEventCopyWithImpl<ChangeDCObjectTypeEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDCObjectType(DCObjectType type),
  }) {
    assert(changeDCObjectType != null);
    return changeDCObjectType(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDCObjectType(DCObjectType type),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeDCObjectType != null) {
      return changeDCObjectType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDCObjectType(ChangeDCObjectTypeEvent value),
  }) {
    assert(changeDCObjectType != null);
    return changeDCObjectType(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDCObjectType(ChangeDCObjectTypeEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeDCObjectType != null) {
      return changeDCObjectType(this);
    }
    return orElse();
  }
}

abstract class ChangeDCObjectTypeEvent implements ControlFiltersBlocEvent {
  const factory ChangeDCObjectTypeEvent(DCObjectType type) =
      _$ChangeDCObjectTypeEvent;

  @override
  DCObjectType get type;
  @override
  @JsonKey(ignore: true)
  $ChangeDCObjectTypeEventCopyWith<ChangeDCObjectTypeEvent> get copyWith;
}
