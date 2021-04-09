// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlObjectFiltersBlocEventTearOff {
  const _$ControlObjectFiltersBlocEventTearOff();

// ignore: unused_element
  ChangeDatesEvent changeDatesEvent({DateTime startDate, DateTime finishDate}) {
    return ChangeDatesEvent(
      startDate: startDate,
      finishDate: finishDate,
    );
  }

// ignore: unused_element
  ChangeViolationExistsEvent changeViolationExistsEvent({bool result}) {
    return ChangeViolationExistsEvent(
      result: result,
    );
  }

// ignore: unused_element
  ChangeViolationStatusEvent changeViolationStatusEvent(
      ViolationStatus violationStatus) {
    return ChangeViolationStatusEvent(
      violationStatus,
    );
  }

// ignore: unused_element
  ChangeViolationNumEvent changeViolationNumEvent(String value) {
    return ChangeViolationNumEvent(
      value,
    );
  }

// ignore: unused_element
  ChangeViolationTypeEvent changeViolationTypeEvent(DCViolationType type) {
    return ChangeViolationTypeEvent(
      type,
    );
  }

// ignore: unused_element
  ChangeViolationKindEvent changeViolationKindEvent(DCViolationKind kind) {
    return ChangeViolationKindEvent(
      kind,
    );
  }

// ignore: unused_element
  ChangeSourceEvent changeSourceEvent(Source source) {
    return ChangeSourceEvent(
      source,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectFiltersBlocEvent = _$ControlObjectFiltersBlocEventTearOff();

/// @nodoc
mixin _$ControlObjectFiltersBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlObjectFiltersBlocEventCopyWith<$Res> {
  factory $ControlObjectFiltersBlocEventCopyWith(
          ControlObjectFiltersBlocEvent value,
          $Res Function(ControlObjectFiltersBlocEvent) then) =
      _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ControlObjectFiltersBlocEventCopyWith<$Res> {
  _$ControlObjectFiltersBlocEventCopyWithImpl(this._value, this._then);

  final ControlObjectFiltersBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ControlObjectFiltersBlocEvent) _then;
}

/// @nodoc
abstract class $ChangeDatesEventCopyWith<$Res> {
  factory $ChangeDatesEventCopyWith(
          ChangeDatesEvent value, $Res Function(ChangeDatesEvent) then) =
      _$ChangeDatesEventCopyWithImpl<$Res>;
  $Res call({DateTime startDate, DateTime finishDate});
}

/// @nodoc
class _$ChangeDatesEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeDatesEventCopyWith<$Res> {
  _$ChangeDatesEventCopyWithImpl(
      ChangeDatesEvent _value, $Res Function(ChangeDatesEvent) _then)
      : super(_value, (v) => _then(v as ChangeDatesEvent));

  @override
  ChangeDatesEvent get _value => super._value as ChangeDatesEvent;

  @override
  $Res call({
    Object startDate = freezed,
    Object finishDate = freezed,
  }) {
    return _then(ChangeDatesEvent(
      startDate:
          startDate == freezed ? _value.startDate : startDate as DateTime,
      finishDate:
          finishDate == freezed ? _value.finishDate : finishDate as DateTime,
    ));
  }
}

/// @nodoc
class _$ChangeDatesEvent implements ChangeDatesEvent {
  const _$ChangeDatesEvent({this.startDate, this.finishDate});

  @override
  final DateTime startDate;
  @override
  final DateTime finishDate;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeDatesEvent(startDate: $startDate, finishDate: $finishDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeDatesEvent &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.finishDate, finishDate) ||
                const DeepCollectionEquality()
                    .equals(other.finishDate, finishDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(finishDate);

  @JsonKey(ignore: true)
  @override
  $ChangeDatesEventCopyWith<ChangeDatesEvent> get copyWith =>
      _$ChangeDatesEventCopyWithImpl<ChangeDatesEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeDatesEvent(startDate, finishDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeDatesEvent != null) {
      return changeDatesEvent(startDate, finishDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeDatesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeDatesEvent != null) {
      return changeDatesEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeDatesEvent implements ControlObjectFiltersBlocEvent {
  const factory ChangeDatesEvent({DateTime startDate, DateTime finishDate}) =
      _$ChangeDatesEvent;

  DateTime get startDate;
  DateTime get finishDate;
  @JsonKey(ignore: true)
  $ChangeDatesEventCopyWith<ChangeDatesEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeViolationExistsEventCopyWith<$Res> {
  factory $ChangeViolationExistsEventCopyWith(ChangeViolationExistsEvent value,
          $Res Function(ChangeViolationExistsEvent) then) =
      _$ChangeViolationExistsEventCopyWithImpl<$Res>;
  $Res call({bool result});
}

/// @nodoc
class _$ChangeViolationExistsEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeViolationExistsEventCopyWith<$Res> {
  _$ChangeViolationExistsEventCopyWithImpl(ChangeViolationExistsEvent _value,
      $Res Function(ChangeViolationExistsEvent) _then)
      : super(_value, (v) => _then(v as ChangeViolationExistsEvent));

  @override
  ChangeViolationExistsEvent get _value =>
      super._value as ChangeViolationExistsEvent;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(ChangeViolationExistsEvent(
      result: result == freezed ? _value.result : result as bool,
    ));
  }
}

/// @nodoc
class _$ChangeViolationExistsEvent implements ChangeViolationExistsEvent {
  const _$ChangeViolationExistsEvent({this.result});

  @override
  final bool result;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeViolationExistsEvent(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeViolationExistsEvent &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @JsonKey(ignore: true)
  @override
  $ChangeViolationExistsEventCopyWith<ChangeViolationExistsEvent>
      get copyWith =>
          _$ChangeViolationExistsEventCopyWithImpl<ChangeViolationExistsEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationExistsEvent(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationExistsEvent != null) {
      return changeViolationExistsEvent(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationExistsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationExistsEvent != null) {
      return changeViolationExistsEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeViolationExistsEvent
    implements ControlObjectFiltersBlocEvent {
  const factory ChangeViolationExistsEvent({bool result}) =
      _$ChangeViolationExistsEvent;

  bool get result;
  @JsonKey(ignore: true)
  $ChangeViolationExistsEventCopyWith<ChangeViolationExistsEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeViolationStatusEventCopyWith<$Res> {
  factory $ChangeViolationStatusEventCopyWith(ChangeViolationStatusEvent value,
          $Res Function(ChangeViolationStatusEvent) then) =
      _$ChangeViolationStatusEventCopyWithImpl<$Res>;
  $Res call({ViolationStatus violationStatus});

  $ViolationStatusCopyWith<$Res> get violationStatus;
}

/// @nodoc
class _$ChangeViolationStatusEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeViolationStatusEventCopyWith<$Res> {
  _$ChangeViolationStatusEventCopyWithImpl(ChangeViolationStatusEvent _value,
      $Res Function(ChangeViolationStatusEvent) _then)
      : super(_value, (v) => _then(v as ChangeViolationStatusEvent));

  @override
  ChangeViolationStatusEvent get _value =>
      super._value as ChangeViolationStatusEvent;

  @override
  $Res call({
    Object violationStatus = freezed,
  }) {
    return _then(ChangeViolationStatusEvent(
      violationStatus == freezed
          ? _value.violationStatus
          : violationStatus as ViolationStatus,
    ));
  }

  @override
  $ViolationStatusCopyWith<$Res> get violationStatus {
    if (_value.violationStatus == null) {
      return null;
    }
    return $ViolationStatusCopyWith<$Res>(_value.violationStatus, (value) {
      return _then(_value.copyWith(violationStatus: value));
    });
  }
}

/// @nodoc
class _$ChangeViolationStatusEvent implements ChangeViolationStatusEvent {
  const _$ChangeViolationStatusEvent(this.violationStatus)
      : assert(violationStatus != null);

  @override
  final ViolationStatus violationStatus;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeViolationStatusEvent(violationStatus: $violationStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeViolationStatusEvent &&
            (identical(other.violationStatus, violationStatus) ||
                const DeepCollectionEquality()
                    .equals(other.violationStatus, violationStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(violationStatus);

  @JsonKey(ignore: true)
  @override
  $ChangeViolationStatusEventCopyWith<ChangeViolationStatusEvent>
      get copyWith =>
          _$ChangeViolationStatusEventCopyWithImpl<ChangeViolationStatusEvent>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationStatusEvent(violationStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationStatusEvent != null) {
      return changeViolationStatusEvent(violationStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationStatusEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationStatusEvent != null) {
      return changeViolationStatusEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeViolationStatusEvent
    implements ControlObjectFiltersBlocEvent {
  const factory ChangeViolationStatusEvent(ViolationStatus violationStatus) =
      _$ChangeViolationStatusEvent;

  ViolationStatus get violationStatus;
  @JsonKey(ignore: true)
  $ChangeViolationStatusEventCopyWith<ChangeViolationStatusEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeViolationNumEventCopyWith<$Res> {
  factory $ChangeViolationNumEventCopyWith(ChangeViolationNumEvent value,
          $Res Function(ChangeViolationNumEvent) then) =
      _$ChangeViolationNumEventCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$ChangeViolationNumEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeViolationNumEventCopyWith<$Res> {
  _$ChangeViolationNumEventCopyWithImpl(ChangeViolationNumEvent _value,
      $Res Function(ChangeViolationNumEvent) _then)
      : super(_value, (v) => _then(v as ChangeViolationNumEvent));

  @override
  ChangeViolationNumEvent get _value => super._value as ChangeViolationNumEvent;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(ChangeViolationNumEvent(
      value == freezed ? _value.value : value as String,
    ));
  }
}

/// @nodoc
class _$ChangeViolationNumEvent implements ChangeViolationNumEvent {
  const _$ChangeViolationNumEvent(this.value) : assert(value != null);

  @override
  final String value;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeViolationNumEvent(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeViolationNumEvent &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $ChangeViolationNumEventCopyWith<ChangeViolationNumEvent> get copyWith =>
      _$ChangeViolationNumEventCopyWithImpl<ChangeViolationNumEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationNumEvent(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationNumEvent != null) {
      return changeViolationNumEvent(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationNumEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationNumEvent != null) {
      return changeViolationNumEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeViolationNumEvent
    implements ControlObjectFiltersBlocEvent {
  const factory ChangeViolationNumEvent(String value) =
      _$ChangeViolationNumEvent;

  String get value;
  @JsonKey(ignore: true)
  $ChangeViolationNumEventCopyWith<ChangeViolationNumEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeViolationTypeEventCopyWith<$Res> {
  factory $ChangeViolationTypeEventCopyWith(ChangeViolationTypeEvent value,
          $Res Function(ChangeViolationTypeEvent) then) =
      _$ChangeViolationTypeEventCopyWithImpl<$Res>;
  $Res call({DCViolationType type});

  $DCViolationTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$ChangeViolationTypeEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeViolationTypeEventCopyWith<$Res> {
  _$ChangeViolationTypeEventCopyWithImpl(ChangeViolationTypeEvent _value,
      $Res Function(ChangeViolationTypeEvent) _then)
      : super(_value, (v) => _then(v as ChangeViolationTypeEvent));

  @override
  ChangeViolationTypeEvent get _value =>
      super._value as ChangeViolationTypeEvent;

  @override
  $Res call({
    Object type = freezed,
  }) {
    return _then(ChangeViolationTypeEvent(
      type == freezed ? _value.type : type as DCViolationType,
    ));
  }

  @override
  $DCViolationTypeCopyWith<$Res> get type {
    if (_value.type == null) {
      return null;
    }
    return $DCViolationTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc
class _$ChangeViolationTypeEvent implements ChangeViolationTypeEvent {
  const _$ChangeViolationTypeEvent(this.type) : assert(type != null);

  @override
  final DCViolationType type;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeViolationTypeEvent(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeViolationTypeEvent &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  $ChangeViolationTypeEventCopyWith<ChangeViolationTypeEvent> get copyWith =>
      _$ChangeViolationTypeEventCopyWithImpl<ChangeViolationTypeEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationTypeEvent(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationTypeEvent != null) {
      return changeViolationTypeEvent(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationTypeEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationTypeEvent != null) {
      return changeViolationTypeEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeViolationTypeEvent
    implements ControlObjectFiltersBlocEvent {
  const factory ChangeViolationTypeEvent(DCViolationType type) =
      _$ChangeViolationTypeEvent;

  DCViolationType get type;
  @JsonKey(ignore: true)
  $ChangeViolationTypeEventCopyWith<ChangeViolationTypeEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeViolationKindEventCopyWith<$Res> {
  factory $ChangeViolationKindEventCopyWith(ChangeViolationKindEvent value,
          $Res Function(ChangeViolationKindEvent) then) =
      _$ChangeViolationKindEventCopyWithImpl<$Res>;
  $Res call({DCViolationKind kind});

  $DCViolationKindCopyWith<$Res> get kind;
}

/// @nodoc
class _$ChangeViolationKindEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeViolationKindEventCopyWith<$Res> {
  _$ChangeViolationKindEventCopyWithImpl(ChangeViolationKindEvent _value,
      $Res Function(ChangeViolationKindEvent) _then)
      : super(_value, (v) => _then(v as ChangeViolationKindEvent));

  @override
  ChangeViolationKindEvent get _value =>
      super._value as ChangeViolationKindEvent;

  @override
  $Res call({
    Object kind = freezed,
  }) {
    return _then(ChangeViolationKindEvent(
      kind == freezed ? _value.kind : kind as DCViolationKind,
    ));
  }

  @override
  $DCViolationKindCopyWith<$Res> get kind {
    if (_value.kind == null) {
      return null;
    }
    return $DCViolationKindCopyWith<$Res>(_value.kind, (value) {
      return _then(_value.copyWith(kind: value));
    });
  }
}

/// @nodoc
class _$ChangeViolationKindEvent implements ChangeViolationKindEvent {
  const _$ChangeViolationKindEvent(this.kind) : assert(kind != null);

  @override
  final DCViolationKind kind;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeViolationKindEvent(kind: $kind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeViolationKindEvent &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(kind);

  @JsonKey(ignore: true)
  @override
  $ChangeViolationKindEventCopyWith<ChangeViolationKindEvent> get copyWith =>
      _$ChangeViolationKindEventCopyWithImpl<ChangeViolationKindEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationKindEvent(kind);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationKindEvent != null) {
      return changeViolationKindEvent(kind);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeViolationKindEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeViolationKindEvent != null) {
      return changeViolationKindEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeViolationKindEvent
    implements ControlObjectFiltersBlocEvent {
  const factory ChangeViolationKindEvent(DCViolationKind kind) =
      _$ChangeViolationKindEvent;

  DCViolationKind get kind;
  @JsonKey(ignore: true)
  $ChangeViolationKindEventCopyWith<ChangeViolationKindEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeSourceEventCopyWith<$Res> {
  factory $ChangeSourceEventCopyWith(
          ChangeSourceEvent value, $Res Function(ChangeSourceEvent) then) =
      _$ChangeSourceEventCopyWithImpl<$Res>;
  $Res call({Source source});

  $SourceCopyWith<$Res> get source;
}

/// @nodoc
class _$ChangeSourceEventCopyWithImpl<$Res>
    extends _$ControlObjectFiltersBlocEventCopyWithImpl<$Res>
    implements $ChangeSourceEventCopyWith<$Res> {
  _$ChangeSourceEventCopyWithImpl(
      ChangeSourceEvent _value, $Res Function(ChangeSourceEvent) _then)
      : super(_value, (v) => _then(v as ChangeSourceEvent));

  @override
  ChangeSourceEvent get _value => super._value as ChangeSourceEvent;

  @override
  $Res call({
    Object source = freezed,
  }) {
    return _then(ChangeSourceEvent(
      source == freezed ? _value.source : source as Source,
    ));
  }

  @override
  $SourceCopyWith<$Res> get source {
    if (_value.source == null) {
      return null;
    }
    return $SourceCopyWith<$Res>(_value.source, (value) {
      return _then(_value.copyWith(source: value));
    });
  }
}

/// @nodoc
class _$ChangeSourceEvent implements ChangeSourceEvent {
  const _$ChangeSourceEvent(this.source) : assert(source != null);

  @override
  final Source source;

  @override
  String toString() {
    return 'ControlObjectFiltersBlocEvent.changeSourceEvent(source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeSourceEvent &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(source);

  @JsonKey(ignore: true)
  @override
  $ChangeSourceEventCopyWith<ChangeSourceEvent> get copyWith =>
      _$ChangeSourceEventCopyWithImpl<ChangeSourceEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    @required TResult changeViolationExistsEvent(bool result),
    @required
        TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    @required TResult changeViolationNumEvent(String value),
    @required TResult changeViolationTypeEvent(DCViolationType type),
    @required TResult changeViolationKindEvent(DCViolationKind kind),
    @required TResult changeSourceEvent(Source source),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeSourceEvent(source);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult changeDatesEvent(DateTime startDate, DateTime finishDate),
    TResult changeViolationExistsEvent(bool result),
    TResult changeViolationStatusEvent(ViolationStatus violationStatus),
    TResult changeViolationNumEvent(String value),
    TResult changeViolationTypeEvent(DCViolationType type),
    TResult changeViolationKindEvent(DCViolationKind kind),
    TResult changeSourceEvent(Source source),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeSourceEvent != null) {
      return changeSourceEvent(source);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult changeDatesEvent(ChangeDatesEvent value),
    @required
        TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    @required
        TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    @required TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    @required TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    @required TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    @required TResult changeSourceEvent(ChangeSourceEvent value),
  }) {
    assert(changeDatesEvent != null);
    assert(changeViolationExistsEvent != null);
    assert(changeViolationStatusEvent != null);
    assert(changeViolationNumEvent != null);
    assert(changeViolationTypeEvent != null);
    assert(changeViolationKindEvent != null);
    assert(changeSourceEvent != null);
    return changeSourceEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult changeDatesEvent(ChangeDatesEvent value),
    TResult changeViolationExistsEvent(ChangeViolationExistsEvent value),
    TResult changeViolationStatusEvent(ChangeViolationStatusEvent value),
    TResult changeViolationNumEvent(ChangeViolationNumEvent value),
    TResult changeViolationTypeEvent(ChangeViolationTypeEvent value),
    TResult changeViolationKindEvent(ChangeViolationKindEvent value),
    TResult changeSourceEvent(ChangeSourceEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeSourceEvent != null) {
      return changeSourceEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeSourceEvent implements ControlObjectFiltersBlocEvent {
  const factory ChangeSourceEvent(Source source) = _$ChangeSourceEvent;

  Source get source;
  @JsonKey(ignore: true)
  $ChangeSourceEventCopyWith<ChangeSourceEvent> get copyWith;
}
