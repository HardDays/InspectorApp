// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$NotificationBlocEventTearOff {
  const _$NotificationBlocEventTearOff();

// ignore: unused_element
  SnackBarNotificationEvent snackBarNotificationEvent(String message) {
    return SnackBarNotificationEvent(
      message,
    );
  }

// ignore: unused_element
  OkDialogNotificationEvent okDialogNotificationEvent(String message) {
    return OkDialogNotificationEvent(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $NotificationBlocEvent = _$NotificationBlocEventTearOff();

/// @nodoc
mixin _$NotificationBlocEvent {
  String get message;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult snackBarNotificationEvent(String message),
    @required TResult okDialogNotificationEvent(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult snackBarNotificationEvent(String message),
    TResult okDialogNotificationEvent(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult snackBarNotificationEvent(SnackBarNotificationEvent value),
    @required
        TResult okDialogNotificationEvent(OkDialogNotificationEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult snackBarNotificationEvent(SnackBarNotificationEvent value),
    TResult okDialogNotificationEvent(OkDialogNotificationEvent value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $NotificationBlocEventCopyWith<NotificationBlocEvent> get copyWith;
}

/// @nodoc
abstract class $NotificationBlocEventCopyWith<$Res> {
  factory $NotificationBlocEventCopyWith(NotificationBlocEvent value,
          $Res Function(NotificationBlocEvent) then) =
      _$NotificationBlocEventCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$NotificationBlocEventCopyWithImpl<$Res>
    implements $NotificationBlocEventCopyWith<$Res> {
  _$NotificationBlocEventCopyWithImpl(this._value, this._then);

  final NotificationBlocEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationBlocEvent) _then;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
abstract class $SnackBarNotificationEventCopyWith<$Res>
    implements $NotificationBlocEventCopyWith<$Res> {
  factory $SnackBarNotificationEventCopyWith(SnackBarNotificationEvent value,
          $Res Function(SnackBarNotificationEvent) then) =
      _$SnackBarNotificationEventCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$SnackBarNotificationEventCopyWithImpl<$Res>
    extends _$NotificationBlocEventCopyWithImpl<$Res>
    implements $SnackBarNotificationEventCopyWith<$Res> {
  _$SnackBarNotificationEventCopyWithImpl(SnackBarNotificationEvent _value,
      $Res Function(SnackBarNotificationEvent) _then)
      : super(_value, (v) => _then(v as SnackBarNotificationEvent));

  @override
  SnackBarNotificationEvent get _value =>
      super._value as SnackBarNotificationEvent;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(SnackBarNotificationEvent(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$SnackBarNotificationEvent implements SnackBarNotificationEvent {
  const _$SnackBarNotificationEvent(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationBlocEvent.snackBarNotificationEvent(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SnackBarNotificationEvent &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $SnackBarNotificationEventCopyWith<SnackBarNotificationEvent> get copyWith =>
      _$SnackBarNotificationEventCopyWithImpl<SnackBarNotificationEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult snackBarNotificationEvent(String message),
    @required TResult okDialogNotificationEvent(String message),
  }) {
    assert(snackBarNotificationEvent != null);
    assert(okDialogNotificationEvent != null);
    return snackBarNotificationEvent(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult snackBarNotificationEvent(String message),
    TResult okDialogNotificationEvent(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (snackBarNotificationEvent != null) {
      return snackBarNotificationEvent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult snackBarNotificationEvent(SnackBarNotificationEvent value),
    @required
        TResult okDialogNotificationEvent(OkDialogNotificationEvent value),
  }) {
    assert(snackBarNotificationEvent != null);
    assert(okDialogNotificationEvent != null);
    return snackBarNotificationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult snackBarNotificationEvent(SnackBarNotificationEvent value),
    TResult okDialogNotificationEvent(OkDialogNotificationEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (snackBarNotificationEvent != null) {
      return snackBarNotificationEvent(this);
    }
    return orElse();
  }
}

abstract class SnackBarNotificationEvent implements NotificationBlocEvent {
  const factory SnackBarNotificationEvent(String message) =
      _$SnackBarNotificationEvent;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $SnackBarNotificationEventCopyWith<SnackBarNotificationEvent> get copyWith;
}

/// @nodoc
abstract class $OkDialogNotificationEventCopyWith<$Res>
    implements $NotificationBlocEventCopyWith<$Res> {
  factory $OkDialogNotificationEventCopyWith(OkDialogNotificationEvent value,
          $Res Function(OkDialogNotificationEvent) then) =
      _$OkDialogNotificationEventCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class _$OkDialogNotificationEventCopyWithImpl<$Res>
    extends _$NotificationBlocEventCopyWithImpl<$Res>
    implements $OkDialogNotificationEventCopyWith<$Res> {
  _$OkDialogNotificationEventCopyWithImpl(OkDialogNotificationEvent _value,
      $Res Function(OkDialogNotificationEvent) _then)
      : super(_value, (v) => _then(v as OkDialogNotificationEvent));

  @override
  OkDialogNotificationEvent get _value =>
      super._value as OkDialogNotificationEvent;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(OkDialogNotificationEvent(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$OkDialogNotificationEvent implements OkDialogNotificationEvent {
  const _$OkDialogNotificationEvent(this.message) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'NotificationBlocEvent.okDialogNotificationEvent(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OkDialogNotificationEvent &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $OkDialogNotificationEventCopyWith<OkDialogNotificationEvent> get copyWith =>
      _$OkDialogNotificationEventCopyWithImpl<OkDialogNotificationEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult snackBarNotificationEvent(String message),
    @required TResult okDialogNotificationEvent(String message),
  }) {
    assert(snackBarNotificationEvent != null);
    assert(okDialogNotificationEvent != null);
    return okDialogNotificationEvent(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult snackBarNotificationEvent(String message),
    TResult okDialogNotificationEvent(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (okDialogNotificationEvent != null) {
      return okDialogNotificationEvent(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required
        TResult snackBarNotificationEvent(SnackBarNotificationEvent value),
    @required
        TResult okDialogNotificationEvent(OkDialogNotificationEvent value),
  }) {
    assert(snackBarNotificationEvent != null);
    assert(okDialogNotificationEvent != null);
    return okDialogNotificationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult snackBarNotificationEvent(SnackBarNotificationEvent value),
    TResult okDialogNotificationEvent(OkDialogNotificationEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (okDialogNotificationEvent != null) {
      return okDialogNotificationEvent(this);
    }
    return orElse();
  }
}

abstract class OkDialogNotificationEvent implements NotificationBlocEvent {
  const factory OkDialogNotificationEvent(String message) =
      _$OkDialogNotificationEvent;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  $OkDialogNotificationEventCopyWith<OkDialogNotificationEvent> get copyWith;
}
