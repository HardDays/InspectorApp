// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlViolationPageBlocEventTearOff {
  const _$ControlViolationPageBlocEventTearOff();

// ignore: unused_element
  RefreshEvent refresh() {
    return const RefreshEvent();
  }

// ignore: unused_element
  ExtendPeriodEvent extendPeriod({ViolationExtensionPeriod extensionPeriod}) {
    return ExtendPeriodEvent(
      extensionPeriod: extensionPeriod,
    );
  }

// ignore: unused_element
  EditPerformControlEvent editPerformControl(
      {PerformControlSearchResult performControl}) {
    return EditPerformControlEvent(
      performControl: performControl,
    );
  }

// ignore: unused_element
  RemovePerformControlEvent removePerformControl(
      {PerformControlSearchResult performControl}) {
    return RemovePerformControlEvent(
      performControl: performControl,
    );
  }

// ignore: unused_element
  CreatePerformControlEvent createPerformControl(
      {PerformControl performControl}) {
    return CreatePerformControlEvent(
      performControl: performControl,
    );
  }

// ignore: unused_element
  SaveChangesEvent saveChanges() {
    return const SaveChangesEvent();
  }

// ignore: unused_element
  DiscardChangesEvent discardChanges() {
    return const DiscardChangesEvent();
  }
}

/// @nodoc
// ignore: unused_element
const $ControlViolationPageBlocEvent = _$ControlViolationPageBlocEventTearOff();

/// @nodoc
mixin _$ControlViolationPageBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlViolationPageBlocEventCopyWith<$Res> {
  factory $ControlViolationPageBlocEventCopyWith(
          ControlViolationPageBlocEvent value,
          $Res Function(ControlViolationPageBlocEvent) then) =
      _$ControlViolationPageBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $ControlViolationPageBlocEventCopyWith<$Res> {
  _$ControlViolationPageBlocEventCopyWithImpl(this._value, this._then);

  final ControlViolationPageBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ControlViolationPageBlocEvent) _then;
}

/// @nodoc
abstract class $RefreshEventCopyWith<$Res> {
  factory $RefreshEventCopyWith(
          RefreshEvent value, $Res Function(RefreshEvent) then) =
      _$RefreshEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RefreshEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $RefreshEventCopyWith<$Res> {
  _$RefreshEventCopyWithImpl(
      RefreshEvent _value, $Res Function(RefreshEvent) _then)
      : super(_value, (v) => _then(v as RefreshEvent));

  @override
  RefreshEvent get _value => super._value as RefreshEvent;
}

/// @nodoc
class _$RefreshEvent implements RefreshEvent {
  const _$RefreshEvent();

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RefreshEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class RefreshEvent implements ControlViolationPageBlocEvent {
  const factory RefreshEvent() = _$RefreshEvent;
}

/// @nodoc
abstract class $ExtendPeriodEventCopyWith<$Res> {
  factory $ExtendPeriodEventCopyWith(
          ExtendPeriodEvent value, $Res Function(ExtendPeriodEvent) then) =
      _$ExtendPeriodEventCopyWithImpl<$Res>;
  $Res call({ViolationExtensionPeriod extensionPeriod});

  $ViolationExtensionPeriodCopyWith<$Res> get extensionPeriod;
}

/// @nodoc
class _$ExtendPeriodEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $ExtendPeriodEventCopyWith<$Res> {
  _$ExtendPeriodEventCopyWithImpl(
      ExtendPeriodEvent _value, $Res Function(ExtendPeriodEvent) _then)
      : super(_value, (v) => _then(v as ExtendPeriodEvent));

  @override
  ExtendPeriodEvent get _value => super._value as ExtendPeriodEvent;

  @override
  $Res call({
    Object extensionPeriod = freezed,
  }) {
    return _then(ExtendPeriodEvent(
      extensionPeriod: extensionPeriod == freezed
          ? _value.extensionPeriod
          : extensionPeriod as ViolationExtensionPeriod,
    ));
  }

  @override
  $ViolationExtensionPeriodCopyWith<$Res> get extensionPeriod {
    if (_value.extensionPeriod == null) {
      return null;
    }
    return $ViolationExtensionPeriodCopyWith<$Res>(_value.extensionPeriod,
        (value) {
      return _then(_value.copyWith(extensionPeriod: value));
    });
  }
}

/// @nodoc
class _$ExtendPeriodEvent implements ExtendPeriodEvent {
  const _$ExtendPeriodEvent({this.extensionPeriod});

  @override
  final ViolationExtensionPeriod extensionPeriod;

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.extendPeriod(extensionPeriod: $extensionPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ExtendPeriodEvent &&
            (identical(other.extensionPeriod, extensionPeriod) ||
                const DeepCollectionEquality()
                    .equals(other.extensionPeriod, extensionPeriod)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(extensionPeriod);

  @JsonKey(ignore: true)
  @override
  $ExtendPeriodEventCopyWith<ExtendPeriodEvent> get copyWith =>
      _$ExtendPeriodEventCopyWithImpl<ExtendPeriodEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return extendPeriod(extensionPeriod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (extendPeriod != null) {
      return extendPeriod(extensionPeriod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return extendPeriod(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (extendPeriod != null) {
      return extendPeriod(this);
    }
    return orElse();
  }
}

abstract class ExtendPeriodEvent implements ControlViolationPageBlocEvent {
  const factory ExtendPeriodEvent({ViolationExtensionPeriod extensionPeriod}) =
      _$ExtendPeriodEvent;

  ViolationExtensionPeriod get extensionPeriod;
  @JsonKey(ignore: true)
  $ExtendPeriodEventCopyWith<ExtendPeriodEvent> get copyWith;
}

/// @nodoc
abstract class $EditPerformControlEventCopyWith<$Res> {
  factory $EditPerformControlEventCopyWith(EditPerformControlEvent value,
          $Res Function(EditPerformControlEvent) then) =
      _$EditPerformControlEventCopyWithImpl<$Res>;
  $Res call({PerformControlSearchResult performControl});

  $PerformControlSearchResultCopyWith<$Res> get performControl;
}

/// @nodoc
class _$EditPerformControlEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $EditPerformControlEventCopyWith<$Res> {
  _$EditPerformControlEventCopyWithImpl(EditPerformControlEvent _value,
      $Res Function(EditPerformControlEvent) _then)
      : super(_value, (v) => _then(v as EditPerformControlEvent));

  @override
  EditPerformControlEvent get _value => super._value as EditPerformControlEvent;

  @override
  $Res call({
    Object performControl = freezed,
  }) {
    return _then(EditPerformControlEvent(
      performControl: performControl == freezed
          ? _value.performControl
          : performControl as PerformControlSearchResult,
    ));
  }

  @override
  $PerformControlSearchResultCopyWith<$Res> get performControl {
    if (_value.performControl == null) {
      return null;
    }
    return $PerformControlSearchResultCopyWith<$Res>(_value.performControl,
        (value) {
      return _then(_value.copyWith(performControl: value));
    });
  }
}

/// @nodoc
class _$EditPerformControlEvent implements EditPerformControlEvent {
  const _$EditPerformControlEvent({this.performControl});

  @override
  final PerformControlSearchResult performControl;

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.editPerformControl(performControl: $performControl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EditPerformControlEvent &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(performControl);

  @JsonKey(ignore: true)
  @override
  $EditPerformControlEventCopyWith<EditPerformControlEvent> get copyWith =>
      _$EditPerformControlEventCopyWithImpl<EditPerformControlEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return editPerformControl(performControl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editPerformControl != null) {
      return editPerformControl(performControl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return editPerformControl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (editPerformControl != null) {
      return editPerformControl(this);
    }
    return orElse();
  }
}

abstract class EditPerformControlEvent
    implements ControlViolationPageBlocEvent {
  const factory EditPerformControlEvent(
      {PerformControlSearchResult performControl}) = _$EditPerformControlEvent;

  PerformControlSearchResult get performControl;
  @JsonKey(ignore: true)
  $EditPerformControlEventCopyWith<EditPerformControlEvent> get copyWith;
}

/// @nodoc
abstract class $RemovePerformControlEventCopyWith<$Res> {
  factory $RemovePerformControlEventCopyWith(RemovePerformControlEvent value,
          $Res Function(RemovePerformControlEvent) then) =
      _$RemovePerformControlEventCopyWithImpl<$Res>;
  $Res call({PerformControlSearchResult performControl});

  $PerformControlSearchResultCopyWith<$Res> get performControl;
}

/// @nodoc
class _$RemovePerformControlEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $RemovePerformControlEventCopyWith<$Res> {
  _$RemovePerformControlEventCopyWithImpl(RemovePerformControlEvent _value,
      $Res Function(RemovePerformControlEvent) _then)
      : super(_value, (v) => _then(v as RemovePerformControlEvent));

  @override
  RemovePerformControlEvent get _value =>
      super._value as RemovePerformControlEvent;

  @override
  $Res call({
    Object performControl = freezed,
  }) {
    return _then(RemovePerformControlEvent(
      performControl: performControl == freezed
          ? _value.performControl
          : performControl as PerformControlSearchResult,
    ));
  }

  @override
  $PerformControlSearchResultCopyWith<$Res> get performControl {
    if (_value.performControl == null) {
      return null;
    }
    return $PerformControlSearchResultCopyWith<$Res>(_value.performControl,
        (value) {
      return _then(_value.copyWith(performControl: value));
    });
  }
}

/// @nodoc
class _$RemovePerformControlEvent implements RemovePerformControlEvent {
  const _$RemovePerformControlEvent({this.performControl});

  @override
  final PerformControlSearchResult performControl;

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.removePerformControl(performControl: $performControl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RemovePerformControlEvent &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(performControl);

  @JsonKey(ignore: true)
  @override
  $RemovePerformControlEventCopyWith<RemovePerformControlEvent> get copyWith =>
      _$RemovePerformControlEventCopyWithImpl<RemovePerformControlEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return removePerformControl(performControl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removePerformControl != null) {
      return removePerformControl(performControl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return removePerformControl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removePerformControl != null) {
      return removePerformControl(this);
    }
    return orElse();
  }
}

abstract class RemovePerformControlEvent
    implements ControlViolationPageBlocEvent {
  const factory RemovePerformControlEvent(
          {PerformControlSearchResult performControl}) =
      _$RemovePerformControlEvent;

  PerformControlSearchResult get performControl;
  @JsonKey(ignore: true)
  $RemovePerformControlEventCopyWith<RemovePerformControlEvent> get copyWith;
}

/// @nodoc
abstract class $CreatePerformControlEventCopyWith<$Res> {
  factory $CreatePerformControlEventCopyWith(CreatePerformControlEvent value,
          $Res Function(CreatePerformControlEvent) then) =
      _$CreatePerformControlEventCopyWithImpl<$Res>;
  $Res call({PerformControl performControl});

  $PerformControlCopyWith<$Res> get performControl;
}

/// @nodoc
class _$CreatePerformControlEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $CreatePerformControlEventCopyWith<$Res> {
  _$CreatePerformControlEventCopyWithImpl(CreatePerformControlEvent _value,
      $Res Function(CreatePerformControlEvent) _then)
      : super(_value, (v) => _then(v as CreatePerformControlEvent));

  @override
  CreatePerformControlEvent get _value =>
      super._value as CreatePerformControlEvent;

  @override
  $Res call({
    Object performControl = freezed,
  }) {
    return _then(CreatePerformControlEvent(
      performControl: performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
    ));
  }

  @override
  $PerformControlCopyWith<$Res> get performControl {
    if (_value.performControl == null) {
      return null;
    }
    return $PerformControlCopyWith<$Res>(_value.performControl, (value) {
      return _then(_value.copyWith(performControl: value));
    });
  }
}

/// @nodoc
class _$CreatePerformControlEvent implements CreatePerformControlEvent {
  const _$CreatePerformControlEvent({this.performControl});

  @override
  final PerformControl performControl;

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.createPerformControl(performControl: $performControl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CreatePerformControlEvent &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(performControl);

  @JsonKey(ignore: true)
  @override
  $CreatePerformControlEventCopyWith<CreatePerformControlEvent> get copyWith =>
      _$CreatePerformControlEventCopyWithImpl<CreatePerformControlEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return createPerformControl(performControl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (createPerformControl != null) {
      return createPerformControl(performControl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return createPerformControl(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (createPerformControl != null) {
      return createPerformControl(this);
    }
    return orElse();
  }
}

abstract class CreatePerformControlEvent
    implements ControlViolationPageBlocEvent {
  const factory CreatePerformControlEvent({PerformControl performControl}) =
      _$CreatePerformControlEvent;

  PerformControl get performControl;
  @JsonKey(ignore: true)
  $CreatePerformControlEventCopyWith<CreatePerformControlEvent> get copyWith;
}

/// @nodoc
abstract class $SaveChangesEventCopyWith<$Res> {
  factory $SaveChangesEventCopyWith(
          SaveChangesEvent value, $Res Function(SaveChangesEvent) then) =
      _$SaveChangesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveChangesEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $SaveChangesEventCopyWith<$Res> {
  _$SaveChangesEventCopyWithImpl(
      SaveChangesEvent _value, $Res Function(SaveChangesEvent) _then)
      : super(_value, (v) => _then(v as SaveChangesEvent));

  @override
  SaveChangesEvent get _value => super._value as SaveChangesEvent;
}

/// @nodoc
class _$SaveChangesEvent implements SaveChangesEvent {
  const _$SaveChangesEvent();

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.saveChanges()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SaveChangesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return saveChanges();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saveChanges != null) {
      return saveChanges();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return saveChanges(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (saveChanges != null) {
      return saveChanges(this);
    }
    return orElse();
  }
}

abstract class SaveChangesEvent implements ControlViolationPageBlocEvent {
  const factory SaveChangesEvent() = _$SaveChangesEvent;
}

/// @nodoc
abstract class $DiscardChangesEventCopyWith<$Res> {
  factory $DiscardChangesEventCopyWith(
          DiscardChangesEvent value, $Res Function(DiscardChangesEvent) then) =
      _$DiscardChangesEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DiscardChangesEventCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocEventCopyWithImpl<$Res>
    implements $DiscardChangesEventCopyWith<$Res> {
  _$DiscardChangesEventCopyWithImpl(
      DiscardChangesEvent _value, $Res Function(DiscardChangesEvent) _then)
      : super(_value, (v) => _then(v as DiscardChangesEvent));

  @override
  DiscardChangesEvent get _value => super._value as DiscardChangesEvent;
}

/// @nodoc
class _$DiscardChangesEvent implements DiscardChangesEvent {
  const _$DiscardChangesEvent();

  @override
  String toString() {
    return 'ControlViolationPageBlocEvent.discardChanges()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DiscardChangesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult refresh(),
    @required TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    @required
        TResult editPerformControl(PerformControlSearchResult performControl),
    @required
        TResult removePerformControl(PerformControlSearchResult performControl),
    @required TResult createPerformControl(PerformControl performControl),
    @required TResult saveChanges(),
    @required TResult discardChanges(),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return discardChanges();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult refresh(),
    TResult extendPeriod(ViolationExtensionPeriod extensionPeriod),
    TResult editPerformControl(PerformControlSearchResult performControl),
    TResult removePerformControl(PerformControlSearchResult performControl),
    TResult createPerformControl(PerformControl performControl),
    TResult saveChanges(),
    TResult discardChanges(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (discardChanges != null) {
      return discardChanges();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult refresh(RefreshEvent value),
    @required TResult extendPeriod(ExtendPeriodEvent value),
    @required TResult editPerformControl(EditPerformControlEvent value),
    @required TResult removePerformControl(RemovePerformControlEvent value),
    @required TResult createPerformControl(CreatePerformControlEvent value),
    @required TResult saveChanges(SaveChangesEvent value),
    @required TResult discardChanges(DiscardChangesEvent value),
  }) {
    assert(refresh != null);
    assert(extendPeriod != null);
    assert(editPerformControl != null);
    assert(removePerformControl != null);
    assert(createPerformControl != null);
    assert(saveChanges != null);
    assert(discardChanges != null);
    return discardChanges(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult refresh(RefreshEvent value),
    TResult extendPeriod(ExtendPeriodEvent value),
    TResult editPerformControl(EditPerformControlEvent value),
    TResult removePerformControl(RemovePerformControlEvent value),
    TResult createPerformControl(CreatePerformControlEvent value),
    TResult saveChanges(SaveChangesEvent value),
    TResult discardChanges(DiscardChangesEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (discardChanges != null) {
      return discardChanges(this);
    }
    return orElse();
  }
}

abstract class DiscardChangesEvent implements ControlViolationPageBlocEvent {
  const factory DiscardChangesEvent() = _$DiscardChangesEvent;
}
