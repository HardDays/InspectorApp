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
  LoadEvent loadEvent() {
    return const LoadEvent();
  }

// ignore: unused_element
  ChangeFitersEvent changeFitersEvent(ControlObjectFilters filters) {
    return ChangeFitersEvent(
      filters,
    );
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
    @required TResult changeFitersEvent(ControlObjectFilters filters),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadEvent(),
    TResult changeFitersEvent(ControlObjectFilters filters),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadEvent(LoadEvent value),
    @required TResult changeFitersEvent(ChangeFitersEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadEvent(LoadEvent value),
    TResult changeFitersEvent(ChangeFitersEvent value),
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
abstract class $LoadEventCopyWith<$Res> {
  factory $LoadEventCopyWith(LoadEvent value, $Res Function(LoadEvent) then) =
      _$LoadEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadEventCopyWithImpl<$Res>
    extends _$ControlObjectBlocEventCopyWithImpl<$Res>
    implements $LoadEventCopyWith<$Res> {
  _$LoadEventCopyWithImpl(LoadEvent _value, $Res Function(LoadEvent) _then)
      : super(_value, (v) => _then(v as LoadEvent));

  @override
  LoadEvent get _value => super._value as LoadEvent;
}

/// @nodoc
class _$LoadEvent implements LoadEvent {
  const _$LoadEvent();

  @override
  String toString() {
    return 'ControlObjectBlocEvent.loadEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadEvent(),
    @required TResult changeFitersEvent(ControlObjectFilters filters),
  }) {
    assert(loadEvent != null);
    assert(changeFitersEvent != null);
    return loadEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadEvent(),
    TResult changeFitersEvent(ControlObjectFilters filters),
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
    @required TResult loadEvent(LoadEvent value),
    @required TResult changeFitersEvent(ChangeFitersEvent value),
  }) {
    assert(loadEvent != null);
    assert(changeFitersEvent != null);
    return loadEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadEvent(LoadEvent value),
    TResult changeFitersEvent(ChangeFitersEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadEvent != null) {
      return loadEvent(this);
    }
    return orElse();
  }
}

abstract class LoadEvent implements ControlObjectBlocEvent {
  const factory LoadEvent() = _$LoadEvent;
}

/// @nodoc
abstract class $ChangeFitersEventCopyWith<$Res> {
  factory $ChangeFitersEventCopyWith(
          ChangeFitersEvent value, $Res Function(ChangeFitersEvent) then) =
      _$ChangeFitersEventCopyWithImpl<$Res>;
  $Res call({ControlObjectFilters filters});

  $ControlObjectFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$ChangeFitersEventCopyWithImpl<$Res>
    extends _$ControlObjectBlocEventCopyWithImpl<$Res>
    implements $ChangeFitersEventCopyWith<$Res> {
  _$ChangeFitersEventCopyWithImpl(
      ChangeFitersEvent _value, $Res Function(ChangeFitersEvent) _then)
      : super(_value, (v) => _then(v as ChangeFitersEvent));

  @override
  ChangeFitersEvent get _value => super._value as ChangeFitersEvent;

  @override
  $Res call({
    Object filters = freezed,
  }) {
    return _then(ChangeFitersEvent(
      filters == freezed ? _value.filters : filters as ControlObjectFilters,
    ));
  }

  @override
  $ControlObjectFiltersCopyWith<$Res> get filters {
    if (_value.filters == null) {
      return null;
    }
    return $ControlObjectFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value));
    });
  }
}

/// @nodoc
class _$ChangeFitersEvent implements ChangeFitersEvent {
  const _$ChangeFitersEvent(this.filters) : assert(filters != null);

  @override
  final ControlObjectFilters filters;

  @override
  String toString() {
    return 'ControlObjectBlocEvent.changeFitersEvent(filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeFitersEvent &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(filters);

  @JsonKey(ignore: true)
  @override
  $ChangeFitersEventCopyWith<ChangeFitersEvent> get copyWith =>
      _$ChangeFitersEventCopyWithImpl<ChangeFitersEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadEvent(),
    @required TResult changeFitersEvent(ControlObjectFilters filters),
  }) {
    assert(loadEvent != null);
    assert(changeFitersEvent != null);
    return changeFitersEvent(filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadEvent(),
    TResult changeFitersEvent(ControlObjectFilters filters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeFitersEvent != null) {
      return changeFitersEvent(filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadEvent(LoadEvent value),
    @required TResult changeFitersEvent(ChangeFitersEvent value),
  }) {
    assert(loadEvent != null);
    assert(changeFitersEvent != null);
    return changeFitersEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadEvent(LoadEvent value),
    TResult changeFitersEvent(ChangeFitersEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeFitersEvent != null) {
      return changeFitersEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeFitersEvent implements ControlObjectBlocEvent {
  const factory ChangeFitersEvent(ControlObjectFilters filters) =
      _$ChangeFitersEvent;

  ControlObjectFilters get filters;
  @JsonKey(ignore: true)
  $ChangeFitersEventCopyWith<ChangeFitersEvent> get copyWith;
}
