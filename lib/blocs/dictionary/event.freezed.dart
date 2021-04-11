// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DictionaryBlocEventTearOff {
  const _$DictionaryBlocEventTearOff();

// ignore: unused_element
  _InitEvent initEvent() {
    return const _InitEvent();
  }
}

/// @nodoc
// ignore: unused_element
const $DictionaryBlocEvent = _$DictionaryBlocEventTearOff();

/// @nodoc
mixin _$DictionaryBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initEvent(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initEvent(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initEvent(_InitEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initEvent(_InitEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $DictionaryBlocEventCopyWith<$Res> {
  factory $DictionaryBlocEventCopyWith(
          DictionaryBlocEvent value, $Res Function(DictionaryBlocEvent) then) =
      _$DictionaryBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DictionaryBlocEventCopyWithImpl<$Res>
    implements $DictionaryBlocEventCopyWith<$Res> {
  _$DictionaryBlocEventCopyWithImpl(this._value, this._then);

  final DictionaryBlocEvent _value;
  // ignore: unused_field
  final $Res Function(DictionaryBlocEvent) _then;
}

/// @nodoc
abstract class _$InitEventCopyWith<$Res> {
  factory _$InitEventCopyWith(
          _InitEvent value, $Res Function(_InitEvent) then) =
      __$InitEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitEventCopyWithImpl<$Res>
    extends _$DictionaryBlocEventCopyWithImpl<$Res>
    implements _$InitEventCopyWith<$Res> {
  __$InitEventCopyWithImpl(_InitEvent _value, $Res Function(_InitEvent) _then)
      : super(_value, (v) => _then(v as _InitEvent));

  @override
  _InitEvent get _value => super._value as _InitEvent;
}

/// @nodoc
class _$_InitEvent implements _InitEvent {
  const _$_InitEvent();

  @override
  String toString() {
    return 'DictionaryBlocEvent.initEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initEvent(),
  }) {
    assert(initEvent != null);
    return initEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initEvent != null) {
      return initEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initEvent(_InitEvent value),
  }) {
    assert(initEvent != null);
    return initEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initEvent(_InitEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initEvent != null) {
      return initEvent(this);
    }
    return orElse();
  }
}

abstract class _InitEvent implements DictionaryBlocEvent {
  const factory _InitEvent() = _$_InitEvent;
}
