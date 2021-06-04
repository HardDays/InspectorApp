// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlObjectBlocStateTearOff {
  const _$ControlObjectBlocStateTearOff();

// ignore: unused_element
  LoadingState loadingState(
      {ControlObject object, ControlObjectFilters filters}) {
    return LoadingState(
      object: object,
      filters: filters,
    );
  }

// ignore: unused_element
  LoadedWithListState loadedWithListState(
      {ControlObject object,
      List<ControlResultSearchResult> controlSearchResults,
      ControlObjectFilters filters}) {
    return LoadedWithListState(
      object: object,
      controlSearchResults: controlSearchResults,
      filters: filters,
    );
  }

// ignore: unused_element
  LoadedState loadedState(
      {ControlObject object, bool needRefresh, ControlObjectFilters filters}) {
    return LoadedState(
      object: object,
      needRefresh: needRefresh,
      filters: filters,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectBlocState = _$ControlObjectBlocStateTearOff();

/// @nodoc
mixin _$ControlObjectBlocState {
  ControlObject get object;
  ControlObjectFilters get filters;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult loadingState(
            ControlObject object, ControlObjectFilters filters),
    @required
        TResult loadedWithListState(
            ControlObject object,
            List<ControlResultSearchResult> controlSearchResults,
            ControlObjectFilters filters),
    @required
        TResult loadedState(ControlObject object, bool needRefresh,
            ControlObjectFilters filters),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object, ControlObjectFilters filters),
    TResult loadedWithListState(
        ControlObject object,
        List<ControlResultSearchResult> controlSearchResults,
        ControlObjectFilters filters),
    TResult loadedState(
        ControlObject object, bool needRefresh, ControlObjectFilters filters),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(LoadingState value),
    @required TResult loadedWithListState(LoadedWithListState value),
    @required TResult loadedState(LoadedState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(LoadingState value),
    TResult loadedWithListState(LoadedWithListState value),
    TResult loadedState(LoadedState value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ControlObjectBlocStateCopyWith<ControlObjectBlocState> get copyWith;
}

/// @nodoc
abstract class $ControlObjectBlocStateCopyWith<$Res> {
  factory $ControlObjectBlocStateCopyWith(ControlObjectBlocState value,
          $Res Function(ControlObjectBlocState) then) =
      _$ControlObjectBlocStateCopyWithImpl<$Res>;
  $Res call({ControlObject object, ControlObjectFilters filters});

  $ControlObjectCopyWith<$Res> get object;
  $ControlObjectFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$ControlObjectBlocStateCopyWithImpl<$Res>
    implements $ControlObjectBlocStateCopyWith<$Res> {
  _$ControlObjectBlocStateCopyWithImpl(this._value, this._then);

  final ControlObjectBlocState _value;
  // ignore: unused_field
  final $Res Function(ControlObjectBlocState) _then;

  @override
  $Res call({
    Object object = freezed,
    Object filters = freezed,
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
      filters:
          filters == freezed ? _value.filters : filters as ControlObjectFilters,
    ));
  }

  @override
  $ControlObjectCopyWith<$Res> get object {
    if (_value.object == null) {
      return null;
    }
    return $ControlObjectCopyWith<$Res>(_value.object, (value) {
      return _then(_value.copyWith(object: value));
    });
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
abstract class $LoadingStateCopyWith<$Res>
    implements $ControlObjectBlocStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
  @override
  $Res call({ControlObject object, ControlObjectFilters filters});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $ControlObjectFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res>
    extends _$ControlObjectBlocStateCopyWithImpl<$Res>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(
      LoadingState _value, $Res Function(LoadingState) _then)
      : super(_value, (v) => _then(v as LoadingState));

  @override
  LoadingState get _value => super._value as LoadingState;

  @override
  $Res call({
    Object object = freezed,
    Object filters = freezed,
  }) {
    return _then(LoadingState(
      object: object == freezed ? _value.object : object as ControlObject,
      filters:
          filters == freezed ? _value.filters : filters as ControlObjectFilters,
    ));
  }
}

/// @nodoc
class _$LoadingState implements LoadingState {
  const _$LoadingState({this.object, this.filters});

  @override
  final ControlObject object;
  @override
  final ControlObjectFilters filters;

  @override
  String toString() {
    return 'ControlObjectBlocState.loadingState(object: $object, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadingState &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(filters);

  @JsonKey(ignore: true)
  @override
  $LoadingStateCopyWith<LoadingState> get copyWith =>
      _$LoadingStateCopyWithImpl<LoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult loadingState(
            ControlObject object, ControlObjectFilters filters),
    @required
        TResult loadedWithListState(
            ControlObject object,
            List<ControlResultSearchResult> controlSearchResults,
            ControlObjectFilters filters),
    @required
        TResult loadedState(ControlObject object, bool needRefresh,
            ControlObjectFilters filters),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadingState(object, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object, ControlObjectFilters filters),
    TResult loadedWithListState(
        ControlObject object,
        List<ControlResultSearchResult> controlSearchResults,
        ControlObjectFilters filters),
    TResult loadedState(
        ControlObject object, bool needRefresh, ControlObjectFilters filters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState(object, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(LoadingState value),
    @required TResult loadedWithListState(LoadedWithListState value),
    @required TResult loadedState(LoadedState value),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(LoadingState value),
    TResult loadedWithListState(LoadedWithListState value),
    TResult loadedState(LoadedState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements ControlObjectBlocState {
  const factory LoadingState(
      {ControlObject object, ControlObjectFilters filters}) = _$LoadingState;

  @override
  ControlObject get object;
  @override
  ControlObjectFilters get filters;
  @override
  @JsonKey(ignore: true)
  $LoadingStateCopyWith<LoadingState> get copyWith;
}

/// @nodoc
abstract class $LoadedWithListStateCopyWith<$Res>
    implements $ControlObjectBlocStateCopyWith<$Res> {
  factory $LoadedWithListStateCopyWith(
          LoadedWithListState value, $Res Function(LoadedWithListState) then) =
      _$LoadedWithListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object,
      List<ControlResultSearchResult> controlSearchResults,
      ControlObjectFilters filters});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $ControlObjectFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$LoadedWithListStateCopyWithImpl<$Res>
    extends _$ControlObjectBlocStateCopyWithImpl<$Res>
    implements $LoadedWithListStateCopyWith<$Res> {
  _$LoadedWithListStateCopyWithImpl(
      LoadedWithListState _value, $Res Function(LoadedWithListState) _then)
      : super(_value, (v) => _then(v as LoadedWithListState));

  @override
  LoadedWithListState get _value => super._value as LoadedWithListState;

  @override
  $Res call({
    Object object = freezed,
    Object controlSearchResults = freezed,
    Object filters = freezed,
  }) {
    return _then(LoadedWithListState(
      object: object == freezed ? _value.object : object as ControlObject,
      controlSearchResults: controlSearchResults == freezed
          ? _value.controlSearchResults
          : controlSearchResults as List<ControlResultSearchResult>,
      filters:
          filters == freezed ? _value.filters : filters as ControlObjectFilters,
    ));
  }
}

/// @nodoc
class _$LoadedWithListState implements LoadedWithListState {
  const _$LoadedWithListState(
      {this.object, this.controlSearchResults, this.filters});

  @override
  final ControlObject object;
  @override
  final List<ControlResultSearchResult> controlSearchResults;
  @override
  final ControlObjectFilters filters;

  @override
  String toString() {
    return 'ControlObjectBlocState.loadedWithListState(object: $object, controlSearchResults: $controlSearchResults, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedWithListState &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlSearchResults, controlSearchResults) ||
                const DeepCollectionEquality().equals(
                    other.controlSearchResults, controlSearchResults)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlSearchResults) ^
      const DeepCollectionEquality().hash(filters);

  @JsonKey(ignore: true)
  @override
  $LoadedWithListStateCopyWith<LoadedWithListState> get copyWith =>
      _$LoadedWithListStateCopyWithImpl<LoadedWithListState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult loadingState(
            ControlObject object, ControlObjectFilters filters),
    @required
        TResult loadedWithListState(
            ControlObject object,
            List<ControlResultSearchResult> controlSearchResults,
            ControlObjectFilters filters),
    @required
        TResult loadedState(ControlObject object, bool needRefresh,
            ControlObjectFilters filters),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadedWithListState(object, controlSearchResults, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object, ControlObjectFilters filters),
    TResult loadedWithListState(
        ControlObject object,
        List<ControlResultSearchResult> controlSearchResults,
        ControlObjectFilters filters),
    TResult loadedState(
        ControlObject object, bool needRefresh, ControlObjectFilters filters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedWithListState != null) {
      return loadedWithListState(object, controlSearchResults, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(LoadingState value),
    @required TResult loadedWithListState(LoadedWithListState value),
    @required TResult loadedState(LoadedState value),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadedWithListState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(LoadingState value),
    TResult loadedWithListState(LoadedWithListState value),
    TResult loadedState(LoadedState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedWithListState != null) {
      return loadedWithListState(this);
    }
    return orElse();
  }
}

abstract class LoadedWithListState implements ControlObjectBlocState {
  const factory LoadedWithListState(
      {ControlObject object,
      List<ControlResultSearchResult> controlSearchResults,
      ControlObjectFilters filters}) = _$LoadedWithListState;

  @override
  ControlObject get object;
  List<ControlResultSearchResult> get controlSearchResults;
  @override
  ControlObjectFilters get filters;
  @override
  @JsonKey(ignore: true)
  $LoadedWithListStateCopyWith<LoadedWithListState> get copyWith;
}

/// @nodoc
abstract class $LoadedStateCopyWith<$Res>
    implements $ControlObjectBlocStateCopyWith<$Res> {
  factory $LoadedStateCopyWith(
          LoadedState value, $Res Function(LoadedState) then) =
      _$LoadedStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObject object, bool needRefresh, ControlObjectFilters filters});

  @override
  $ControlObjectCopyWith<$Res> get object;
  @override
  $ControlObjectFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$LoadedStateCopyWithImpl<$Res>
    extends _$ControlObjectBlocStateCopyWithImpl<$Res>
    implements $LoadedStateCopyWith<$Res> {
  _$LoadedStateCopyWithImpl(
      LoadedState _value, $Res Function(LoadedState) _then)
      : super(_value, (v) => _then(v as LoadedState));

  @override
  LoadedState get _value => super._value as LoadedState;

  @override
  $Res call({
    Object object = freezed,
    Object needRefresh = freezed,
    Object filters = freezed,
  }) {
    return _then(LoadedState(
      object: object == freezed ? _value.object : object as ControlObject,
      needRefresh:
          needRefresh == freezed ? _value.needRefresh : needRefresh as bool,
      filters:
          filters == freezed ? _value.filters : filters as ControlObjectFilters,
    ));
  }
}

/// @nodoc
class _$LoadedState implements LoadedState {
  const _$LoadedState({this.object, this.needRefresh, this.filters});

  @override
  final ControlObject object;
  @override
  final bool needRefresh;
  @override
  final ControlObjectFilters filters;

  @override
  String toString() {
    return 'ControlObjectBlocState.loadedState(object: $object, needRefresh: $needRefresh, filters: $filters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedState &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.needRefresh, needRefresh) ||
                const DeepCollectionEquality()
                    .equals(other.needRefresh, needRefresh)) &&
            (identical(other.filters, filters) ||
                const DeepCollectionEquality().equals(other.filters, filters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(needRefresh) ^
      const DeepCollectionEquality().hash(filters);

  @JsonKey(ignore: true)
  @override
  $LoadedStateCopyWith<LoadedState> get copyWith =>
      _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult loadingState(
            ControlObject object, ControlObjectFilters filters),
    @required
        TResult loadedWithListState(
            ControlObject object,
            List<ControlResultSearchResult> controlSearchResults,
            ControlObjectFilters filters),
    @required
        TResult loadedState(ControlObject object, bool needRefresh,
            ControlObjectFilters filters),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadedState(object, needRefresh, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object, ControlObjectFilters filters),
    TResult loadedWithListState(
        ControlObject object,
        List<ControlResultSearchResult> controlSearchResults,
        ControlObjectFilters filters),
    TResult loadedState(
        ControlObject object, bool needRefresh, ControlObjectFilters filters),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(object, needRefresh, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadingState(LoadingState value),
    @required TResult loadedWithListState(LoadedWithListState value),
    @required TResult loadedState(LoadedState value),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadingState(LoadingState value),
    TResult loadedWithListState(LoadedWithListState value),
    TResult loadedState(LoadedState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements ControlObjectBlocState {
  const factory LoadedState(
      {ControlObject object,
      bool needRefresh,
      ControlObjectFilters filters}) = _$LoadedState;

  @override
  ControlObject get object;
  bool get needRefresh;
  @override
  ControlObjectFilters get filters;
  @override
  @JsonKey(ignore: true)
  $LoadedStateCopyWith<LoadedState> get copyWith;
}
