// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlViolationPageBlocStateTearOff {
  const _$ControlViolationPageBlocStateTearOff();

// ignore: unused_element
  InitialControlViolationPageBlocState initialState(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh = false}) {
    return InitialControlViolationPageBlocState(
      controlObject: controlObject,
      searchResult: searchResult,
      refresh: refresh,
    );
  }

// ignore: unused_element
  LoadedControlViolationPageBlocState loadedState(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh = false,
      bool hasUnsavedChanges = false,
      bool editable = false}) {
    return LoadedControlViolationPageBlocState(
      controlObject: controlObject,
      searchResult: searchResult,
      refresh: refresh,
      hasUnsavedChanges: hasUnsavedChanges,
      editable: editable,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlViolationPageBlocState = _$ControlViolationPageBlocStateTearOff();

/// @nodoc
mixin _$ControlViolationPageBlocState {
  ControlObject get controlObject;
  ControlResultSearchResult get searchResult;
  bool get refresh;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initialState(ControlObject controlObject,
            ControlResultSearchResult searchResult, bool refresh),
    @required
        TResult loadedState(
            ControlObject controlObject,
            ControlResultSearchResult searchResult,
            bool refresh,
            bool hasUnsavedChanges,
            bool editable),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(ControlObject controlObject,
        ControlResultSearchResult searchResult, bool refresh),
    TResult loadedState(
        ControlObject controlObject,
        ControlResultSearchResult searchResult,
        bool refresh,
        bool hasUnsavedChanges,
        bool editable),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialControlViolationPageBlocState value),
    @required TResult loadedState(LoadedControlViolationPageBlocState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialControlViolationPageBlocState value),
    TResult loadedState(LoadedControlViolationPageBlocState value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ControlViolationPageBlocStateCopyWith<ControlViolationPageBlocState>
      get copyWith;
}

/// @nodoc
abstract class $ControlViolationPageBlocStateCopyWith<$Res> {
  factory $ControlViolationPageBlocStateCopyWith(
          ControlViolationPageBlocState value,
          $Res Function(ControlViolationPageBlocState) then) =
      _$ControlViolationPageBlocStateCopyWithImpl<$Res>;
  $Res call(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh});

  $ControlObjectCopyWith<$Res> get controlObject;
  $ControlResultSearchResultCopyWith<$Res> get searchResult;
}

/// @nodoc
class _$ControlViolationPageBlocStateCopyWithImpl<$Res>
    implements $ControlViolationPageBlocStateCopyWith<$Res> {
  _$ControlViolationPageBlocStateCopyWithImpl(this._value, this._then);

  final ControlViolationPageBlocState _value;
  // ignore: unused_field
  final $Res Function(ControlViolationPageBlocState) _then;

  @override
  $Res call({
    Object controlObject = freezed,
    Object searchResult = freezed,
    Object refresh = freezed,
  }) {
    return _then(_value.copyWith(
      controlObject: controlObject == freezed
          ? _value.controlObject
          : controlObject as ControlObject,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult as ControlResultSearchResult,
      refresh: refresh == freezed ? _value.refresh : refresh as bool,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get controlObject {
    if (_value.controlObject == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.controlObject, (value) {
      return _then(_value.copyWith(controlObject: value));
    });
  }

  @override
  $ControlResultSearchResultCopyWith<$Res> get searchResult {
    if (_value.searchResult == null) {
      return null;
    }
    return $ControlResultSearchResultCopyWith<$Res>(_value.searchResult,
        (value) {
      return _then(_value.copyWith(searchResult: value));
    });
  }
}

/// @nodoc
abstract class $InitialControlViolationPageBlocStateCopyWith<$Res>
    implements $ControlViolationPageBlocStateCopyWith<$Res> {
  factory $InitialControlViolationPageBlocStateCopyWith(
          InitialControlViolationPageBlocState value,
          $Res Function(InitialControlViolationPageBlocState) then) =
      _$InitialControlViolationPageBlocStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh});

  @override
  $ControlObjectCopyWith<$Res> get controlObject;
  @override
  $ControlResultSearchResultCopyWith<$Res> get searchResult;
}

/// @nodoc
class _$InitialControlViolationPageBlocStateCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocStateCopyWithImpl<$Res>
    implements $InitialControlViolationPageBlocStateCopyWith<$Res> {
  _$InitialControlViolationPageBlocStateCopyWithImpl(
      InitialControlViolationPageBlocState _value,
      $Res Function(InitialControlViolationPageBlocState) _then)
      : super(_value, (v) => _then(v as InitialControlViolationPageBlocState));

  @override
  InitialControlViolationPageBlocState get _value =>
      super._value as InitialControlViolationPageBlocState;

  @override
  $Res call({
    Object controlObject = freezed,
    Object searchResult = freezed,
    Object refresh = freezed,
  }) {
    return _then(InitialControlViolationPageBlocState(
      controlObject: controlObject == freezed
          ? _value.controlObject
          : controlObject as ControlObject,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult as ControlResultSearchResult,
      refresh: refresh == freezed ? _value.refresh : refresh as bool,
    ));
  }
}

/// @nodoc
class _$InitialControlViolationPageBlocState
    implements InitialControlViolationPageBlocState {
  const _$InitialControlViolationPageBlocState(
      {this.controlObject, this.searchResult, this.refresh = false})
      : assert(refresh != null);

  @override
  final ControlObject controlObject;
  @override
  final ControlResultSearchResult searchResult;
  @JsonKey(defaultValue: false)
  @override
  final bool refresh;

  @override
  String toString() {
    return 'ControlViolationPageBlocState.initialState(controlObject: $controlObject, searchResult: $searchResult, refresh: $refresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InitialControlViolationPageBlocState &&
            (identical(other.controlObject, controlObject) ||
                const DeepCollectionEquality()
                    .equals(other.controlObject, controlObject)) &&
            (identical(other.searchResult, searchResult) ||
                const DeepCollectionEquality()
                    .equals(other.searchResult, searchResult)) &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality().equals(other.refresh, refresh)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(controlObject) ^
      const DeepCollectionEquality().hash(searchResult) ^
      const DeepCollectionEquality().hash(refresh);

  @JsonKey(ignore: true)
  @override
  $InitialControlViolationPageBlocStateCopyWith<
          InitialControlViolationPageBlocState>
      get copyWith => _$InitialControlViolationPageBlocStateCopyWithImpl<
          InitialControlViolationPageBlocState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initialState(ControlObject controlObject,
            ControlResultSearchResult searchResult, bool refresh),
    @required
        TResult loadedState(
            ControlObject controlObject,
            ControlResultSearchResult searchResult,
            bool refresh,
            bool hasUnsavedChanges,
            bool editable),
  }) {
    assert(initialState != null);
    assert(loadedState != null);
    return initialState(controlObject, searchResult, refresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(ControlObject controlObject,
        ControlResultSearchResult searchResult, bool refresh),
    TResult loadedState(
        ControlObject controlObject,
        ControlResultSearchResult searchResult,
        bool refresh,
        bool hasUnsavedChanges,
        bool editable),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(controlObject, searchResult, refresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialControlViolationPageBlocState value),
    @required TResult loadedState(LoadedControlViolationPageBlocState value),
  }) {
    assert(initialState != null);
    assert(loadedState != null);
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialControlViolationPageBlocState value),
    TResult loadedState(LoadedControlViolationPageBlocState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialControlViolationPageBlocState
    implements ControlViolationPageBlocState {
  const factory InitialControlViolationPageBlocState(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh}) = _$InitialControlViolationPageBlocState;

  @override
  ControlObject get controlObject;
  @override
  ControlResultSearchResult get searchResult;
  @override
  bool get refresh;
  @override
  @JsonKey(ignore: true)
  $InitialControlViolationPageBlocStateCopyWith<
      InitialControlViolationPageBlocState> get copyWith;
}

/// @nodoc
abstract class $LoadedControlViolationPageBlocStateCopyWith<$Res>
    implements $ControlViolationPageBlocStateCopyWith<$Res> {
  factory $LoadedControlViolationPageBlocStateCopyWith(
          LoadedControlViolationPageBlocState value,
          $Res Function(LoadedControlViolationPageBlocState) then) =
      _$LoadedControlViolationPageBlocStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh,
      bool hasUnsavedChanges,
      bool editable});

  @override
  $ControlObjectCopyWith<$Res> get controlObject;
  @override
  $ControlResultSearchResultCopyWith<$Res> get searchResult;
}

/// @nodoc
class _$LoadedControlViolationPageBlocStateCopyWithImpl<$Res>
    extends _$ControlViolationPageBlocStateCopyWithImpl<$Res>
    implements $LoadedControlViolationPageBlocStateCopyWith<$Res> {
  _$LoadedControlViolationPageBlocStateCopyWithImpl(
      LoadedControlViolationPageBlocState _value,
      $Res Function(LoadedControlViolationPageBlocState) _then)
      : super(_value, (v) => _then(v as LoadedControlViolationPageBlocState));

  @override
  LoadedControlViolationPageBlocState get _value =>
      super._value as LoadedControlViolationPageBlocState;

  @override
  $Res call({
    Object controlObject = freezed,
    Object searchResult = freezed,
    Object refresh = freezed,
    Object hasUnsavedChanges = freezed,
    Object editable = freezed,
  }) {
    return _then(LoadedControlViolationPageBlocState(
      controlObject: controlObject == freezed
          ? _value.controlObject
          : controlObject as ControlObject,
      searchResult: searchResult == freezed
          ? _value.searchResult
          : searchResult as ControlResultSearchResult,
      refresh: refresh == freezed ? _value.refresh : refresh as bool,
      hasUnsavedChanges: hasUnsavedChanges == freezed
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges as bool,
      editable: editable == freezed ? _value.editable : editable as bool,
    ));
  }
}

/// @nodoc
class _$LoadedControlViolationPageBlocState
    implements LoadedControlViolationPageBlocState {
  const _$LoadedControlViolationPageBlocState(
      {this.controlObject,
      this.searchResult,
      this.refresh = false,
      this.hasUnsavedChanges = false,
      this.editable = false})
      : assert(refresh != null),
        assert(hasUnsavedChanges != null),
        assert(editable != null);

  @override
  final ControlObject controlObject;
  @override
  final ControlResultSearchResult searchResult;
  @JsonKey(defaultValue: false)
  @override
  final bool refresh;
  @JsonKey(defaultValue: false)
  @override
  final bool hasUnsavedChanges;
  @JsonKey(defaultValue: false)
  @override
  final bool editable;

  @override
  String toString() {
    return 'ControlViolationPageBlocState.loadedState(controlObject: $controlObject, searchResult: $searchResult, refresh: $refresh, hasUnsavedChanges: $hasUnsavedChanges, editable: $editable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedControlViolationPageBlocState &&
            (identical(other.controlObject, controlObject) ||
                const DeepCollectionEquality()
                    .equals(other.controlObject, controlObject)) &&
            (identical(other.searchResult, searchResult) ||
                const DeepCollectionEquality()
                    .equals(other.searchResult, searchResult)) &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality()
                    .equals(other.refresh, refresh)) &&
            (identical(other.hasUnsavedChanges, hasUnsavedChanges) ||
                const DeepCollectionEquality()
                    .equals(other.hasUnsavedChanges, hasUnsavedChanges)) &&
            (identical(other.editable, editable) ||
                const DeepCollectionEquality()
                    .equals(other.editable, editable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(controlObject) ^
      const DeepCollectionEquality().hash(searchResult) ^
      const DeepCollectionEquality().hash(refresh) ^
      const DeepCollectionEquality().hash(hasUnsavedChanges) ^
      const DeepCollectionEquality().hash(editable);

  @JsonKey(ignore: true)
  @override
  $LoadedControlViolationPageBlocStateCopyWith<
          LoadedControlViolationPageBlocState>
      get copyWith => _$LoadedControlViolationPageBlocStateCopyWithImpl<
          LoadedControlViolationPageBlocState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult initialState(ControlObject controlObject,
            ControlResultSearchResult searchResult, bool refresh),
    @required
        TResult loadedState(
            ControlObject controlObject,
            ControlResultSearchResult searchResult,
            bool refresh,
            bool hasUnsavedChanges,
            bool editable),
  }) {
    assert(initialState != null);
    assert(loadedState != null);
    return loadedState(
        controlObject, searchResult, refresh, hasUnsavedChanges, editable);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initialState(ControlObject controlObject,
        ControlResultSearchResult searchResult, bool refresh),
    TResult loadedState(
        ControlObject controlObject,
        ControlResultSearchResult searchResult,
        bool refresh,
        bool hasUnsavedChanges,
        bool editable),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(
          controlObject, searchResult, refresh, hasUnsavedChanges, editable);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initialState(InitialControlViolationPageBlocState value),
    @required TResult loadedState(LoadedControlViolationPageBlocState value),
  }) {
    assert(initialState != null);
    assert(loadedState != null);
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initialState(InitialControlViolationPageBlocState value),
    TResult loadedState(LoadedControlViolationPageBlocState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class LoadedControlViolationPageBlocState
    implements ControlViolationPageBlocState {
  const factory LoadedControlViolationPageBlocState(
      {ControlObject controlObject,
      ControlResultSearchResult searchResult,
      bool refresh,
      bool hasUnsavedChanges,
      bool editable}) = _$LoadedControlViolationPageBlocState;

  @override
  ControlObject get controlObject;
  @override
  ControlResultSearchResult get searchResult;
  @override
  bool get refresh;
  bool get hasUnsavedChanges;
  bool get editable;
  @override
  @JsonKey(ignore: true)
  $LoadedControlViolationPageBlocStateCopyWith<
      LoadedControlViolationPageBlocState> get copyWith;
}
