// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlBackgroundServiceBlocEventTearOff {
  const _$ControlBackgroundServiceBlocEventTearOff();

// ignore: unused_element
  InitEvent initEvent() {
    return const InitEvent();
  }

// ignore: unused_element
  AcceptLoadingEvent acceptLoadingEvent(bool loadSearchResults) {
    return AcceptLoadingEvent(
      loadSearchResults,
    );
  }

// ignore: unused_element
  CancelLoadingEvent cancelLoadingEvent() {
    return const CancelLoadingEvent();
  }
}

/// @nodoc
// ignore: unused_element
const $ControlBackgroundServiceBlocEvent =
    _$ControlBackgroundServiceBlocEventTearOff();

/// @nodoc
mixin _$ControlBackgroundServiceBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initEvent(),
    @required TResult acceptLoadingEvent(bool loadSearchResults),
    @required TResult cancelLoadingEvent(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initEvent(),
    TResult acceptLoadingEvent(bool loadSearchResults),
    TResult cancelLoadingEvent(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initEvent(InitEvent value),
    @required TResult acceptLoadingEvent(AcceptLoadingEvent value),
    @required TResult cancelLoadingEvent(CancelLoadingEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initEvent(InitEvent value),
    TResult acceptLoadingEvent(AcceptLoadingEvent value),
    TResult cancelLoadingEvent(CancelLoadingEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlBackgroundServiceBlocEventCopyWith<$Res> {
  factory $ControlBackgroundServiceBlocEventCopyWith(
          ControlBackgroundServiceBlocEvent value,
          $Res Function(ControlBackgroundServiceBlocEvent) then) =
      _$ControlBackgroundServiceBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlBackgroundServiceBlocEventCopyWithImpl<$Res>
    implements $ControlBackgroundServiceBlocEventCopyWith<$Res> {
  _$ControlBackgroundServiceBlocEventCopyWithImpl(this._value, this._then);

  final ControlBackgroundServiceBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ControlBackgroundServiceBlocEvent) _then;
}

/// @nodoc
abstract class $InitEventCopyWith<$Res> {
  factory $InitEventCopyWith(InitEvent value, $Res Function(InitEvent) then) =
      _$InitEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitEventCopyWithImpl<$Res>
    extends _$ControlBackgroundServiceBlocEventCopyWithImpl<$Res>
    implements $InitEventCopyWith<$Res> {
  _$InitEventCopyWithImpl(InitEvent _value, $Res Function(InitEvent) _then)
      : super(_value, (v) => _then(v as InitEvent));

  @override
  InitEvent get _value => super._value as InitEvent;
}

/// @nodoc
class _$InitEvent implements InitEvent {
  const _$InitEvent();

  @override
  String toString() {
    return 'ControlBackgroundServiceBlocEvent.initEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initEvent(),
    @required TResult acceptLoadingEvent(bool loadSearchResults),
    @required TResult cancelLoadingEvent(),
  }) {
    assert(initEvent != null);
    assert(acceptLoadingEvent != null);
    assert(cancelLoadingEvent != null);
    return initEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initEvent(),
    TResult acceptLoadingEvent(bool loadSearchResults),
    TResult cancelLoadingEvent(),
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
    @required TResult initEvent(InitEvent value),
    @required TResult acceptLoadingEvent(AcceptLoadingEvent value),
    @required TResult cancelLoadingEvent(CancelLoadingEvent value),
  }) {
    assert(initEvent != null);
    assert(acceptLoadingEvent != null);
    assert(cancelLoadingEvent != null);
    return initEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initEvent(InitEvent value),
    TResult acceptLoadingEvent(AcceptLoadingEvent value),
    TResult cancelLoadingEvent(CancelLoadingEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initEvent != null) {
      return initEvent(this);
    }
    return orElse();
  }
}

abstract class InitEvent implements ControlBackgroundServiceBlocEvent {
  const factory InitEvent() = _$InitEvent;
}

/// @nodoc
abstract class $AcceptLoadingEventCopyWith<$Res> {
  factory $AcceptLoadingEventCopyWith(
          AcceptLoadingEvent value, $Res Function(AcceptLoadingEvent) then) =
      _$AcceptLoadingEventCopyWithImpl<$Res>;
  $Res call({bool loadSearchResults});
}

/// @nodoc
class _$AcceptLoadingEventCopyWithImpl<$Res>
    extends _$ControlBackgroundServiceBlocEventCopyWithImpl<$Res>
    implements $AcceptLoadingEventCopyWith<$Res> {
  _$AcceptLoadingEventCopyWithImpl(
      AcceptLoadingEvent _value, $Res Function(AcceptLoadingEvent) _then)
      : super(_value, (v) => _then(v as AcceptLoadingEvent));

  @override
  AcceptLoadingEvent get _value => super._value as AcceptLoadingEvent;

  @override
  $Res call({
    Object loadSearchResults = freezed,
  }) {
    return _then(AcceptLoadingEvent(
      loadSearchResults == freezed
          ? _value.loadSearchResults
          : loadSearchResults as bool,
    ));
  }
}

/// @nodoc
class _$AcceptLoadingEvent implements AcceptLoadingEvent {
  const _$AcceptLoadingEvent(this.loadSearchResults)
      : assert(loadSearchResults != null);

  @override
  final bool loadSearchResults;

  @override
  String toString() {
    return 'ControlBackgroundServiceBlocEvent.acceptLoadingEvent(loadSearchResults: $loadSearchResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcceptLoadingEvent &&
            (identical(other.loadSearchResults, loadSearchResults) ||
                const DeepCollectionEquality()
                    .equals(other.loadSearchResults, loadSearchResults)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loadSearchResults);

  @JsonKey(ignore: true)
  @override
  $AcceptLoadingEventCopyWith<AcceptLoadingEvent> get copyWith =>
      _$AcceptLoadingEventCopyWithImpl<AcceptLoadingEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initEvent(),
    @required TResult acceptLoadingEvent(bool loadSearchResults),
    @required TResult cancelLoadingEvent(),
  }) {
    assert(initEvent != null);
    assert(acceptLoadingEvent != null);
    assert(cancelLoadingEvent != null);
    return acceptLoadingEvent(loadSearchResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initEvent(),
    TResult acceptLoadingEvent(bool loadSearchResults),
    TResult cancelLoadingEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (acceptLoadingEvent != null) {
      return acceptLoadingEvent(loadSearchResults);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initEvent(InitEvent value),
    @required TResult acceptLoadingEvent(AcceptLoadingEvent value),
    @required TResult cancelLoadingEvent(CancelLoadingEvent value),
  }) {
    assert(initEvent != null);
    assert(acceptLoadingEvent != null);
    assert(cancelLoadingEvent != null);
    return acceptLoadingEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initEvent(InitEvent value),
    TResult acceptLoadingEvent(AcceptLoadingEvent value),
    TResult cancelLoadingEvent(CancelLoadingEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (acceptLoadingEvent != null) {
      return acceptLoadingEvent(this);
    }
    return orElse();
  }
}

abstract class AcceptLoadingEvent implements ControlBackgroundServiceBlocEvent {
  const factory AcceptLoadingEvent(bool loadSearchResults) =
      _$AcceptLoadingEvent;

  bool get loadSearchResults;
  @JsonKey(ignore: true)
  $AcceptLoadingEventCopyWith<AcceptLoadingEvent> get copyWith;
}

/// @nodoc
abstract class $CancelLoadingEventCopyWith<$Res> {
  factory $CancelLoadingEventCopyWith(
          CancelLoadingEvent value, $Res Function(CancelLoadingEvent) then) =
      _$CancelLoadingEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelLoadingEventCopyWithImpl<$Res>
    extends _$ControlBackgroundServiceBlocEventCopyWithImpl<$Res>
    implements $CancelLoadingEventCopyWith<$Res> {
  _$CancelLoadingEventCopyWithImpl(
      CancelLoadingEvent _value, $Res Function(CancelLoadingEvent) _then)
      : super(_value, (v) => _then(v as CancelLoadingEvent));

  @override
  CancelLoadingEvent get _value => super._value as CancelLoadingEvent;
}

/// @nodoc
class _$CancelLoadingEvent implements CancelLoadingEvent {
  const _$CancelLoadingEvent();

  @override
  String toString() {
    return 'ControlBackgroundServiceBlocEvent.cancelLoadingEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CancelLoadingEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initEvent(),
    @required TResult acceptLoadingEvent(bool loadSearchResults),
    @required TResult cancelLoadingEvent(),
  }) {
    assert(initEvent != null);
    assert(acceptLoadingEvent != null);
    assert(cancelLoadingEvent != null);
    return cancelLoadingEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initEvent(),
    TResult acceptLoadingEvent(bool loadSearchResults),
    TResult cancelLoadingEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cancelLoadingEvent != null) {
      return cancelLoadingEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initEvent(InitEvent value),
    @required TResult acceptLoadingEvent(AcceptLoadingEvent value),
    @required TResult cancelLoadingEvent(CancelLoadingEvent value),
  }) {
    assert(initEvent != null);
    assert(acceptLoadingEvent != null);
    assert(cancelLoadingEvent != null);
    return cancelLoadingEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initEvent(InitEvent value),
    TResult acceptLoadingEvent(AcceptLoadingEvent value),
    TResult cancelLoadingEvent(CancelLoadingEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cancelLoadingEvent != null) {
      return cancelLoadingEvent(this);
    }
    return orElse();
  }
}

abstract class CancelLoadingEvent implements ControlBackgroundServiceBlocEvent {
  const factory CancelLoadingEvent() = _$CancelLoadingEvent;
}
