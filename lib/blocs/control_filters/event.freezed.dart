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
  CopyStateEvent copyState(ControlFiltersBlocState state) {
    return CopyStateEvent(
      state,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlFiltersBlocEvent = _$ControlFiltersBlocEventTearOff();

/// @nodoc
mixin _$ControlFiltersBlocEvent {
  ControlFiltersBlocState get state;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult copyState(ControlFiltersBlocState state),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult copyState(ControlFiltersBlocState state),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult copyState(CopyStateEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult copyState(CopyStateEvent value),
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
  $Res call({ControlFiltersBlocState state});

  $ControlFiltersBlocStateCopyWith<$Res> get state;
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
    Object state = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed ? _value.state : state as ControlFiltersBlocState,
    ));
  }

  @override
  $ControlFiltersBlocStateCopyWith<$Res> get state {
    if (_value.state == null) {
      return null;
    }
    return $ControlFiltersBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
abstract class $CopyStateEventCopyWith<$Res>
    implements $ControlFiltersBlocEventCopyWith<$Res> {
  factory $CopyStateEventCopyWith(
          CopyStateEvent value, $Res Function(CopyStateEvent) then) =
      _$CopyStateEventCopyWithImpl<$Res>;
  @override
  $Res call({ControlFiltersBlocState state});

  @override
  $ControlFiltersBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class _$CopyStateEventCopyWithImpl<$Res>
    extends _$ControlFiltersBlocEventCopyWithImpl<$Res>
    implements $CopyStateEventCopyWith<$Res> {
  _$CopyStateEventCopyWithImpl(
      CopyStateEvent _value, $Res Function(CopyStateEvent) _then)
      : super(_value, (v) => _then(v as CopyStateEvent));

  @override
  CopyStateEvent get _value => super._value as CopyStateEvent;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(CopyStateEvent(
      state == freezed ? _value.state : state as ControlFiltersBlocState,
    ));
  }
}

/// @nodoc
class _$CopyStateEvent implements CopyStateEvent {
  const _$CopyStateEvent(this.state) : assert(state != null);

  @override
  final ControlFiltersBlocState state;

  @override
  String toString() {
    return 'ControlFiltersBlocEvent.copyState(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CopyStateEvent &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  $CopyStateEventCopyWith<CopyStateEvent> get copyWith =>
      _$CopyStateEventCopyWithImpl<CopyStateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult copyState(ControlFiltersBlocState state),
  }) {
    assert(copyState != null);
    return copyState(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult copyState(ControlFiltersBlocState state),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (copyState != null) {
      return copyState(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult copyState(CopyStateEvent value),
  }) {
    assert(copyState != null);
    return copyState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult copyState(CopyStateEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (copyState != null) {
      return copyState(this);
    }
    return orElse();
  }
}

abstract class CopyStateEvent implements ControlFiltersBlocEvent {
  const factory CopyStateEvent(ControlFiltersBlocState state) =
      _$CopyStateEvent;

  @override
  ControlFiltersBlocState get state;
  @override
  @JsonKey(ignore: true)
  $CopyStateEventCopyWith<CopyStateEvent> get copyWith;
}
