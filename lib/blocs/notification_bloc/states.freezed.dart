// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationBlocStateTearOff {
  const _$NotificationBlocStateTearOff();

// ignore: unused_element
  EmptyNotificationState emptyNotificationState() {
    return const EmptyNotificationState();
  }

// ignore: unused_element
  SnackBarNotificationState snackBarNotificationState(String message) {
    return SnackBarNotificationState(
      message,
    );
  }

// ignore: unused_element
  OkDialogNotificationState okDialogNotificationState(String message) {
    return OkDialogNotificationState(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationBlocState = _$NotificationBlocStateTearOff();

/// @nodoc
mixin _$NotificationBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyNotificationState(),
    @required TResult snackBarNotificationState(String message),
    @required TResult okDialogNotificationState(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyNotificationState(),
    TResult snackBarNotificationState(String message),
    TResult okDialogNotificationState(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyNotificationState(EmptyNotificationState value),
    @required
        TResult snackBarNotificationState(SnackBarNotificationState value),
    @required
        TResult okDialogNotificationState(OkDialogNotificationState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyNotificationState(EmptyNotificationState value),
    TResult snackBarNotificationState(SnackBarNotificationState value),
    TResult okDialogNotificationState(OkDialogNotificationState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $NotificationBlocStateCopyWith<$Res> {
  factory $NotificationBlocStateCopyWith(NotificationBlocState value,
          $Res Function(NotificationBlocState) then) =
      _$NotificationBlocStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationBlocStateCopyWithImpl<$Res>
    implements $NotificationBlocStateCopyWith<$Res> {
  _$NotificationBlocStateCopyWithImpl(this._value, this._then);

  final NotificationBlocState _value;
  // ignore: unused_field
  final $Res Function(NotificationBlocState) _then;
}

/// @nodoc
abstract class $EmptyNotificationStateCopyWith<$Res> {
  factory $EmptyNotificationStateCopyWith(EmptyNotificationState value,
          $Res Function(EmptyNotificationState) then) =
      _$EmptyNotificationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyNotificationStateCopyWithImpl<$Res>
    extends _$NotificationBlocStateCopyWithImpl<$Res>
    implements $EmptyNotificationStateCopyWith<$Res> {
  _$EmptyNotificationStateCopyWithImpl(EmptyNotificationState _value,
      $Res Function(EmptyNotificationState) _then)
      : super(_value, (v) => _then(v as EmptyNotificationState));

  @override
  EmptyNotificationState get _value => super._value as EmptyNotificationState;
}

/// @nodoc
class _$EmptyNotificationState implements EmptyNotificationState {
  const _$EmptyNotificationState();

  @override
  String toString() {
    return 'NotificationBlocState.emptyNotificationState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmptyNotificationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyNotificationState(),
    @required TResult snackBarNotificationState(String message),
    @required TResult okDialogNotificationState(String message),
  }) {
    assert(emptyNotificationState != null);
    assert(snackBarNotificationState != null);
    assert(okDialogNotificationState != null);
    return emptyNotificationState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyNotificationState(),
    TResult snackBarNotificationState(String message),
    TResult okDialogNotificationState(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyNotificationState != null) {
      return emptyNotificationState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyNotificationState(EmptyNotificationState value),
    @required
        TResult snackBarNotificationState(SnackBarNotificationState value),
    @required
        TResult okDialogNotificationState(OkDialogNotificationState value),
  }) {
    assert(emptyNotificationState != null);
    assert(snackBarNotificationState != null);
    assert(okDialogNotificationState != null);
    return emptyNotificationState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyNotificationState(EmptyNotificationState value),
    TResult snackBarNotificationState(SnackBarNotificationState value),
    TResult okDialogNotificationState(OkDialogNotificationState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyNotificationState != null) {
      return emptyNotificationState(this);
    }
    return orElse();
  }
}

abstract class EmptyNotificationState implements NotificationBlocState {
  const factory EmptyNotificationState() = _$EmptyNotificationState;
}

/// @nodoc
abstract class $SnackBarNotificationStateCopyWith<$Res> {
  factory $SnackBarNotificationStateCopyWith(SnackBarNotificationState value,
          $Res Function(SnackBarNotificationState) then) =
      _$SnackBarNotificationStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$SnackBarNotificationStateCopyWithImpl<$Res>
    extends _$NotificationBlocStateCopyWithImpl<$Res>
    implements $SnackBarNotificationStateCopyWith<$Res> {
  _$SnackBarNotificationStateCopyWithImpl(SnackBarNotificationState _value,
      $Res Function(SnackBarNotificationState) _then)
      : super(_value, (v) => _then(v as SnackBarNotificationState));

  @override
  SnackBarNotificationState get _value =>
      super._value as SnackBarNotificationState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(SnackBarNotificationState(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$SnackBarNotificationState implements SnackBarNotificationState {
  const _$SnackBarNotificationState(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationBlocState.snackBarNotificationState(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SnackBarNotificationState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $SnackBarNotificationStateCopyWith<SnackBarNotificationState> get copyWith =>
      _$SnackBarNotificationStateCopyWithImpl<SnackBarNotificationState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyNotificationState(),
    @required TResult snackBarNotificationState(String message),
    @required TResult okDialogNotificationState(String message),
  }) {
    assert(emptyNotificationState != null);
    assert(snackBarNotificationState != null);
    assert(okDialogNotificationState != null);
    return snackBarNotificationState(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyNotificationState(),
    TResult snackBarNotificationState(String message),
    TResult okDialogNotificationState(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (snackBarNotificationState != null) {
      return snackBarNotificationState(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyNotificationState(EmptyNotificationState value),
    @required
        TResult snackBarNotificationState(SnackBarNotificationState value),
    @required
        TResult okDialogNotificationState(OkDialogNotificationState value),
  }) {
    assert(emptyNotificationState != null);
    assert(snackBarNotificationState != null);
    assert(okDialogNotificationState != null);
    return snackBarNotificationState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyNotificationState(EmptyNotificationState value),
    TResult snackBarNotificationState(SnackBarNotificationState value),
    TResult okDialogNotificationState(OkDialogNotificationState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (snackBarNotificationState != null) {
      return snackBarNotificationState(this);
    }
    return orElse();
  }
}

abstract class SnackBarNotificationState implements NotificationBlocState {
  const factory SnackBarNotificationState(String message) =
      _$SnackBarNotificationState;

  String get message;
  @JsonKey(ignore: true)
  $SnackBarNotificationStateCopyWith<SnackBarNotificationState> get copyWith;
}

/// @nodoc
abstract class $OkDialogNotificationStateCopyWith<$Res> {
  factory $OkDialogNotificationStateCopyWith(OkDialogNotificationState value,
          $Res Function(OkDialogNotificationState) then) =
      _$OkDialogNotificationStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$OkDialogNotificationStateCopyWithImpl<$Res>
    extends _$NotificationBlocStateCopyWithImpl<$Res>
    implements $OkDialogNotificationStateCopyWith<$Res> {
  _$OkDialogNotificationStateCopyWithImpl(OkDialogNotificationState _value,
      $Res Function(OkDialogNotificationState) _then)
      : super(_value, (v) => _then(v as OkDialogNotificationState));

  @override
  OkDialogNotificationState get _value =>
      super._value as OkDialogNotificationState;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(OkDialogNotificationState(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$OkDialogNotificationState implements OkDialogNotificationState {
  const _$OkDialogNotificationState(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationBlocState.okDialogNotificationState(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OkDialogNotificationState &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $OkDialogNotificationStateCopyWith<OkDialogNotificationState> get copyWith =>
      _$OkDialogNotificationStateCopyWithImpl<OkDialogNotificationState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyNotificationState(),
    @required TResult snackBarNotificationState(String message),
    @required TResult okDialogNotificationState(String message),
  }) {
    assert(emptyNotificationState != null);
    assert(snackBarNotificationState != null);
    assert(okDialogNotificationState != null);
    return okDialogNotificationState(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyNotificationState(),
    TResult snackBarNotificationState(String message),
    TResult okDialogNotificationState(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (okDialogNotificationState != null) {
      return okDialogNotificationState(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyNotificationState(EmptyNotificationState value),
    @required
        TResult snackBarNotificationState(SnackBarNotificationState value),
    @required
        TResult okDialogNotificationState(OkDialogNotificationState value),
  }) {
    assert(emptyNotificationState != null);
    assert(snackBarNotificationState != null);
    assert(okDialogNotificationState != null);
    return okDialogNotificationState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyNotificationState(EmptyNotificationState value),
    TResult snackBarNotificationState(SnackBarNotificationState value),
    TResult okDialogNotificationState(OkDialogNotificationState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (okDialogNotificationState != null) {
      return okDialogNotificationState(this);
    }
    return orElse();
  }
}

abstract class OkDialogNotificationState implements NotificationBlocState {
  const factory OkDialogNotificationState(String message) =
      _$OkDialogNotificationState;

  String get message;
  @JsonKey(ignore: true)
  $OkDialogNotificationStateCopyWith<OkDialogNotificationState> get copyWith;
}
