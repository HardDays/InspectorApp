// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlObjectBlocEventTearOff {
  const _$ControlObjectBlocEventTearOff();

// ignore: unused_element
  _LoadEvent loadEvent() {
    return const _LoadEvent();
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectBlocEvent = _$ControlObjectBlocEventTearOff();

/// @nodoc
mixin _$ControlObjectBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadEvent(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadEvent(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadEvent(_LoadEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadEvent(_LoadEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlObjectBlocEventCopyWith<$Res> {
  factory $ControlObjectBlocEventCopyWith(ControlObjectBlocEvent value,
          $Res Function(ControlObjectBlocEvent) then) =
      _$ControlObjectBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlObjectBlocEventCopyWithImpl<$Res>
    implements $ControlObjectBlocEventCopyWith<$Res> {
  _$ControlObjectBlocEventCopyWithImpl(this._value, this._then);

  final ControlObjectBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ControlObjectBlocEvent) _then;
}

/// @nodoc
abstract class _$LoadEventCopyWith<$Res> {
  factory _$LoadEventCopyWith(
          _LoadEvent value, $Res Function(_LoadEvent) then) =
      __$LoadEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadEventCopyWithImpl<$Res>
    extends _$ControlObjectBlocEventCopyWithImpl<$Res>
    implements _$LoadEventCopyWith<$Res> {
  __$LoadEventCopyWithImpl(_LoadEvent _value, $Res Function(_LoadEvent) _then)
      : super(_value, (v) => _then(v as _LoadEvent));

  @override
  _LoadEvent get _value => super._value as _LoadEvent;
}

/// @nodoc
class _$_LoadEvent implements _LoadEvent {
  const _$_LoadEvent();

  @override
  String toString() {
    return 'ControlObjectBlocEvent.loadEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _LoadEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadEvent(),
  }) {
    assert(loadEvent != null);
    return loadEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadEvent != null) {
      return loadEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadEvent(_LoadEvent value),
  }) {
    assert(loadEvent != null);
    return loadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadEvent(_LoadEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadEvent != null) {
      return loadEvent(this);
    }
    return orElse();
  }
}

abstract class _LoadEvent implements ControlObjectBlocEvent {
  const factory _LoadEvent() = _$_LoadEvent;
}
