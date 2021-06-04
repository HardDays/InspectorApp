// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$BackgroundLoadingBlocEventTearOff {
  const _$BackgroundLoadingBlocEventTearOff();

// ignore: unused_element
  AddOperationToQueueEvent addOperationToQueueEvent(
      CancelableOperation<dynamic> operation) {
    return AddOperationToQueueEvent(
      operation,
    );
  }

// ignore: unused_element
  UpdateStatusTextEvent updateStatusTextEvent(String text) {
    return UpdateStatusTextEvent(
      text,
    );
  }

// ignore: unused_element
  CancelEvent cancelEvent() {
    return const CancelEvent();
  }

// ignore: unused_element
  FinishEvent finishEvent() {
    return const FinishEvent();
  }
}

/// @nodoc
// ignore: unused_element
const $BackgroundLoadingBlocEvent = _$BackgroundLoadingBlocEventTearOff();

/// @nodoc
mixin _$BackgroundLoadingBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult addOperationToQueueEvent(
            CancelableOperation<dynamic> operation),
    @required TResult updateStatusTextEvent(String text),
    @required TResult cancelEvent(),
    @required TResult finishEvent(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult addOperationToQueueEvent(CancelableOperation<dynamic> operation),
    TResult updateStatusTextEvent(String text),
    TResult cancelEvent(),
    TResult finishEvent(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    @required TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    @required TResult cancelEvent(CancelEvent value),
    @required TResult finishEvent(FinishEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    TResult cancelEvent(CancelEvent value),
    TResult finishEvent(FinishEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $BackgroundLoadingBlocEventCopyWith<$Res> {
  factory $BackgroundLoadingBlocEventCopyWith(BackgroundLoadingBlocEvent value,
          $Res Function(BackgroundLoadingBlocEvent) then) =
      _$BackgroundLoadingBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BackgroundLoadingBlocEventCopyWithImpl<$Res>
    implements $BackgroundLoadingBlocEventCopyWith<$Res> {
  _$BackgroundLoadingBlocEventCopyWithImpl(this._value, this._then);

  final BackgroundLoadingBlocEvent _value;
  // ignore: unused_field
  final $Res Function(BackgroundLoadingBlocEvent) _then;
}

/// @nodoc
abstract class $AddOperationToQueueEventCopyWith<$Res> {
  factory $AddOperationToQueueEventCopyWith(AddOperationToQueueEvent value,
          $Res Function(AddOperationToQueueEvent) then) =
      _$AddOperationToQueueEventCopyWithImpl<$Res>;
  $Res call({CancelableOperation<dynamic> operation});
}

/// @nodoc
class _$AddOperationToQueueEventCopyWithImpl<$Res>
    extends _$BackgroundLoadingBlocEventCopyWithImpl<$Res>
    implements $AddOperationToQueueEventCopyWith<$Res> {
  _$AddOperationToQueueEventCopyWithImpl(AddOperationToQueueEvent _value,
      $Res Function(AddOperationToQueueEvent) _then)
      : super(_value, (v) => _then(v as AddOperationToQueueEvent));

  @override
  AddOperationToQueueEvent get _value =>
      super._value as AddOperationToQueueEvent;

  @override
  $Res call({
    Object operation = freezed,
  }) {
    return _then(AddOperationToQueueEvent(
      operation == freezed
          ? _value.operation
          : operation as CancelableOperation<dynamic>,
    ));
  }
}

/// @nodoc
class _$AddOperationToQueueEvent implements AddOperationToQueueEvent {
  const _$AddOperationToQueueEvent(this.operation) : assert(operation != null);

  @override
  final CancelableOperation<dynamic> operation;

  @override
  String toString() {
    return 'BackgroundLoadingBlocEvent.addOperationToQueueEvent(operation: $operation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddOperationToQueueEvent &&
            (identical(other.operation, operation) ||
                const DeepCollectionEquality()
                    .equals(other.operation, operation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(operation);

  @JsonKey(ignore: true)
  @override
  $AddOperationToQueueEventCopyWith<AddOperationToQueueEvent> get copyWith =>
      _$AddOperationToQueueEventCopyWithImpl<AddOperationToQueueEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult addOperationToQueueEvent(
            CancelableOperation<dynamic> operation),
    @required TResult updateStatusTextEvent(String text),
    @required TResult cancelEvent(),
    @required TResult finishEvent(),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return addOperationToQueueEvent(operation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult addOperationToQueueEvent(CancelableOperation<dynamic> operation),
    TResult updateStatusTextEvent(String text),
    TResult cancelEvent(),
    TResult finishEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addOperationToQueueEvent != null) {
      return addOperationToQueueEvent(operation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    @required TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    @required TResult cancelEvent(CancelEvent value),
    @required TResult finishEvent(FinishEvent value),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return addOperationToQueueEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    TResult cancelEvent(CancelEvent value),
    TResult finishEvent(FinishEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (addOperationToQueueEvent != null) {
      return addOperationToQueueEvent(this);
    }
    return orElse();
  }
}

abstract class AddOperationToQueueEvent implements BackgroundLoadingBlocEvent {
  const factory AddOperationToQueueEvent(
      CancelableOperation<dynamic> operation) = _$AddOperationToQueueEvent;

  CancelableOperation<dynamic> get operation;
  @JsonKey(ignore: true)
  $AddOperationToQueueEventCopyWith<AddOperationToQueueEvent> get copyWith;
}

/// @nodoc
abstract class $UpdateStatusTextEventCopyWith<$Res> {
  factory $UpdateStatusTextEventCopyWith(UpdateStatusTextEvent value,
          $Res Function(UpdateStatusTextEvent) then) =
      _$UpdateStatusTextEventCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$UpdateStatusTextEventCopyWithImpl<$Res>
    extends _$BackgroundLoadingBlocEventCopyWithImpl<$Res>
    implements $UpdateStatusTextEventCopyWith<$Res> {
  _$UpdateStatusTextEventCopyWithImpl(
      UpdateStatusTextEvent _value, $Res Function(UpdateStatusTextEvent) _then)
      : super(_value, (v) => _then(v as UpdateStatusTextEvent));

  @override
  UpdateStatusTextEvent get _value => super._value as UpdateStatusTextEvent;

  @override
  $Res call({
    Object text = freezed,
  }) {
    return _then(UpdateStatusTextEvent(
      text == freezed ? _value.text : text as String,
    ));
  }
}

/// @nodoc
class _$UpdateStatusTextEvent implements UpdateStatusTextEvent {
  const _$UpdateStatusTextEvent(this.text) : assert(text != null);

  @override
  final String text;

  @override
  String toString() {
    return 'BackgroundLoadingBlocEvent.updateStatusTextEvent(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateStatusTextEvent &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @JsonKey(ignore: true)
  @override
  $UpdateStatusTextEventCopyWith<UpdateStatusTextEvent> get copyWith =>
      _$UpdateStatusTextEventCopyWithImpl<UpdateStatusTextEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult addOperationToQueueEvent(
            CancelableOperation<dynamic> operation),
    @required TResult updateStatusTextEvent(String text),
    @required TResult cancelEvent(),
    @required TResult finishEvent(),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return updateStatusTextEvent(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult addOperationToQueueEvent(CancelableOperation<dynamic> operation),
    TResult updateStatusTextEvent(String text),
    TResult cancelEvent(),
    TResult finishEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateStatusTextEvent != null) {
      return updateStatusTextEvent(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    @required TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    @required TResult cancelEvent(CancelEvent value),
    @required TResult finishEvent(FinishEvent value),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return updateStatusTextEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    TResult cancelEvent(CancelEvent value),
    TResult finishEvent(FinishEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateStatusTextEvent != null) {
      return updateStatusTextEvent(this);
    }
    return orElse();
  }
}

abstract class UpdateStatusTextEvent implements BackgroundLoadingBlocEvent {
  const factory UpdateStatusTextEvent(String text) = _$UpdateStatusTextEvent;

  String get text;
  @JsonKey(ignore: true)
  $UpdateStatusTextEventCopyWith<UpdateStatusTextEvent> get copyWith;
}

/// @nodoc
abstract class $CancelEventCopyWith<$Res> {
  factory $CancelEventCopyWith(
          CancelEvent value, $Res Function(CancelEvent) then) =
      _$CancelEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelEventCopyWithImpl<$Res>
    extends _$BackgroundLoadingBlocEventCopyWithImpl<$Res>
    implements $CancelEventCopyWith<$Res> {
  _$CancelEventCopyWithImpl(
      CancelEvent _value, $Res Function(CancelEvent) _then)
      : super(_value, (v) => _then(v as CancelEvent));

  @override
  CancelEvent get _value => super._value as CancelEvent;
}

/// @nodoc
class _$CancelEvent implements CancelEvent {
  const _$CancelEvent();

  @override
  String toString() {
    return 'BackgroundLoadingBlocEvent.cancelEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CancelEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult addOperationToQueueEvent(
            CancelableOperation<dynamic> operation),
    @required TResult updateStatusTextEvent(String text),
    @required TResult cancelEvent(),
    @required TResult finishEvent(),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return cancelEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult addOperationToQueueEvent(CancelableOperation<dynamic> operation),
    TResult updateStatusTextEvent(String text),
    TResult cancelEvent(),
    TResult finishEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cancelEvent != null) {
      return cancelEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    @required TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    @required TResult cancelEvent(CancelEvent value),
    @required TResult finishEvent(FinishEvent value),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return cancelEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    TResult cancelEvent(CancelEvent value),
    TResult finishEvent(FinishEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cancelEvent != null) {
      return cancelEvent(this);
    }
    return orElse();
  }
}

abstract class CancelEvent implements BackgroundLoadingBlocEvent {
  const factory CancelEvent() = _$CancelEvent;
}

/// @nodoc
abstract class $FinishEventCopyWith<$Res> {
  factory $FinishEventCopyWith(
          FinishEvent value, $Res Function(FinishEvent) then) =
      _$FinishEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FinishEventCopyWithImpl<$Res>
    extends _$BackgroundLoadingBlocEventCopyWithImpl<$Res>
    implements $FinishEventCopyWith<$Res> {
  _$FinishEventCopyWithImpl(
      FinishEvent _value, $Res Function(FinishEvent) _then)
      : super(_value, (v) => _then(v as FinishEvent));

  @override
  FinishEvent get _value => super._value as FinishEvent;
}

/// @nodoc
class _$FinishEvent implements FinishEvent {
  const _$FinishEvent();

  @override
  String toString() {
    return 'BackgroundLoadingBlocEvent.finishEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FinishEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult addOperationToQueueEvent(
            CancelableOperation<dynamic> operation),
    @required TResult updateStatusTextEvent(String text),
    @required TResult cancelEvent(),
    @required TResult finishEvent(),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return finishEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult addOperationToQueueEvent(CancelableOperation<dynamic> operation),
    TResult updateStatusTextEvent(String text),
    TResult cancelEvent(),
    TResult finishEvent(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (finishEvent != null) {
      return finishEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    @required TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    @required TResult cancelEvent(CancelEvent value),
    @required TResult finishEvent(FinishEvent value),
  }) {
    assert(addOperationToQueueEvent != null);
    assert(updateStatusTextEvent != null);
    assert(cancelEvent != null);
    assert(finishEvent != null);
    return finishEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult addOperationToQueueEvent(AddOperationToQueueEvent value),
    TResult updateStatusTextEvent(UpdateStatusTextEvent value),
    TResult cancelEvent(CancelEvent value),
    TResult finishEvent(FinishEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (finishEvent != null) {
      return finishEvent(this);
    }
    return orElse();
  }
}

abstract class FinishEvent implements BackgroundLoadingBlocEvent {
  const factory FinishEvent() = _$FinishEvent;
}
