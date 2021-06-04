// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BackgroundLoadingBlocStateTearOff {
  const _$BackgroundLoadingBlocStateTearOff();

// ignore: unused_element
  _EmptyQueueState emptyQueueState() {
    return const _EmptyQueueState();
  }

// ignore: unused_element
  _HaveStatusState haveStatusState(String status) {
    return _HaveStatusState(
      status,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $BackgroundLoadingBlocState = _$BackgroundLoadingBlocStateTearOff();

/// @nodoc
mixin _$BackgroundLoadingBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyQueueState(),
    @required TResult haveStatusState(String status),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyQueueState(),
    TResult haveStatusState(String status),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyQueueState(_EmptyQueueState value),
    @required TResult haveStatusState(_HaveStatusState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyQueueState(_EmptyQueueState value),
    TResult haveStatusState(_HaveStatusState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $BackgroundLoadingBlocStateCopyWith<$Res> {
  factory $BackgroundLoadingBlocStateCopyWith(BackgroundLoadingBlocState value,
          $Res Function(BackgroundLoadingBlocState) then) =
      _$BackgroundLoadingBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BackgroundLoadingBlocStateCopyWithImpl<$Res>
    implements $BackgroundLoadingBlocStateCopyWith<$Res> {
  _$BackgroundLoadingBlocStateCopyWithImpl(this._value, this._then);

  final BackgroundLoadingBlocState _value;
  // ignore: unused_field
  final $Res Function(BackgroundLoadingBlocState) _then;
}

/// @nodoc
abstract class _$EmptyQueueStateCopyWith<$Res> {
  factory _$EmptyQueueStateCopyWith(
          _EmptyQueueState value, $Res Function(_EmptyQueueState) then) =
      __$EmptyQueueStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyQueueStateCopyWithImpl<$Res>
    extends _$BackgroundLoadingBlocStateCopyWithImpl<$Res>
    implements _$EmptyQueueStateCopyWith<$Res> {
  __$EmptyQueueStateCopyWithImpl(
      _EmptyQueueState _value, $Res Function(_EmptyQueueState) _then)
      : super(_value, (v) => _then(v as _EmptyQueueState));

  @override
  _EmptyQueueState get _value => super._value as _EmptyQueueState;
}

/// @nodoc
class _$_EmptyQueueState implements _EmptyQueueState {
  const _$_EmptyQueueState();

  @override
  String toString() {
    return 'BackgroundLoadingBlocState.emptyQueueState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmptyQueueState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyQueueState(),
    @required TResult haveStatusState(String status),
  }) {
    assert(emptyQueueState != null);
    assert(haveStatusState != null);
    return emptyQueueState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyQueueState(),
    TResult haveStatusState(String status),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyQueueState != null) {
      return emptyQueueState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyQueueState(_EmptyQueueState value),
    @required TResult haveStatusState(_HaveStatusState value),
  }) {
    assert(emptyQueueState != null);
    assert(haveStatusState != null);
    return emptyQueueState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyQueueState(_EmptyQueueState value),
    TResult haveStatusState(_HaveStatusState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyQueueState != null) {
      return emptyQueueState(this);
    }
    return orElse();
  }
}

abstract class _EmptyQueueState implements BackgroundLoadingBlocState {
  const factory _EmptyQueueState() = _$_EmptyQueueState;
}

/// @nodoc
abstract class _$HaveStatusStateCopyWith<$Res> {
  factory _$HaveStatusStateCopyWith(
          _HaveStatusState value, $Res Function(_HaveStatusState) then) =
      __$HaveStatusStateCopyWithImpl<$Res>;
  $Res call({String status});
}

/// @nodoc
class __$HaveStatusStateCopyWithImpl<$Res>
    extends _$BackgroundLoadingBlocStateCopyWithImpl<$Res>
    implements _$HaveStatusStateCopyWith<$Res> {
  __$HaveStatusStateCopyWithImpl(
      _HaveStatusState _value, $Res Function(_HaveStatusState) _then)
      : super(_value, (v) => _then(v as _HaveStatusState));

  @override
  _HaveStatusState get _value => super._value as _HaveStatusState;

  @override
  $Res call({
    Object status = freezed,
  }) {
    return _then(_HaveStatusState(
      status == freezed ? _value.status : status as String,
    ));
  }
}

/// @nodoc
class _$_HaveStatusState implements _HaveStatusState {
  const _$_HaveStatusState(this.status) : assert(status != null);

  @override
  final String status;

  @override
  String toString() {
    return 'BackgroundLoadingBlocState.haveStatusState(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HaveStatusState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$HaveStatusStateCopyWith<_HaveStatusState> get copyWith =>
      __$HaveStatusStateCopyWithImpl<_HaveStatusState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyQueueState(),
    @required TResult haveStatusState(String status),
  }) {
    assert(emptyQueueState != null);
    assert(haveStatusState != null);
    return haveStatusState(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyQueueState(),
    TResult haveStatusState(String status),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (haveStatusState != null) {
      return haveStatusState(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyQueueState(_EmptyQueueState value),
    @required TResult haveStatusState(_HaveStatusState value),
  }) {
    assert(emptyQueueState != null);
    assert(haveStatusState != null);
    return haveStatusState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyQueueState(_EmptyQueueState value),
    TResult haveStatusState(_HaveStatusState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (haveStatusState != null) {
      return haveStatusState(this);
    }
    return orElse();
  }
}

abstract class _HaveStatusState implements BackgroundLoadingBlocState {
  const factory _HaveStatusState(String status) = _$_HaveStatusState;

  String get status;
  @JsonKey(ignore: true)
  _$HaveStatusStateCopyWith<_HaveStatusState> get copyWith;
}
