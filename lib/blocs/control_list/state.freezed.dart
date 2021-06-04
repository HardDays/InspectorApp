// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlListBlocStateTearOff {
  const _$ControlListBlocStateTearOff();

// ignore: unused_element
  CantWorkInThisModeState cantWorkInThisModeState(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap}) {
    return CantWorkInThisModeState(
      listState: listState,
      filtersState: filtersState,
      sortState: sortState,
      mapState: mapState,
      showMap: showMap,
    );
  }

// ignore: unused_element
  _ControlListBlocState call(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap}) {
    return _ControlListBlocState(
      listState: listState,
      filtersState: filtersState,
      sortState: sortState,
      mapState: mapState,
      showMap: showMap,
    );
  }

// ignore: unused_element
  _ControlListApiExceptionBlocState apiExceptionState(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap,
      ApiException exception}) {
    return _ControlListApiExceptionBlocState(
      listState: listState,
      filtersState: filtersState,
      sortState: sortState,
      mapState: mapState,
      showMap: showMap,
      exception: exception,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlListBlocState = _$ControlListBlocStateTearOff();

/// @nodoc
mixin _$ControlListBlocState {
  ControlObjectsListState get listState;
  ControlFiltersBlocState get filtersState;
  String get sortState;
  ControlObjectsMapState get mapState;
  bool get showMap;

  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    @required
        TResult cantWorkInThisModeState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap),
    @required
        TResult apiExceptionState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap,
            ApiException exception),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    TResult cantWorkInThisModeState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap),
    TResult apiExceptionState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap,
        ApiException exception),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    @required TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    @required
        TResult apiExceptionState(_ControlListApiExceptionBlocState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    TResult apiExceptionState(_ControlListApiExceptionBlocState value),
    @required TResult orElse(),
  });

  @JsonKey(ignore: true)
  $ControlListBlocStateCopyWith<ControlListBlocState> get copyWith;
}

/// @nodoc
abstract class $ControlListBlocStateCopyWith<$Res> {
  factory $ControlListBlocStateCopyWith(ControlListBlocState value,
          $Res Function(ControlListBlocState) then) =
      _$ControlListBlocStateCopyWithImpl<$Res>;
  $Res call(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap});

  $ControlObjectsListStateCopyWith<$Res> get listState;
  $ControlFiltersBlocStateCopyWith<$Res> get filtersState;
  $ControlObjectsMapStateCopyWith<$Res> get mapState;
}

/// @nodoc
class _$ControlListBlocStateCopyWithImpl<$Res>
    implements $ControlListBlocStateCopyWith<$Res> {
  _$ControlListBlocStateCopyWithImpl(this._value, this._then);

  final ControlListBlocState _value;
  // ignore: unused_field
  final $Res Function(ControlListBlocState) _then;

  @override
  $Res call({
    Object listState = freezed,
    Object filtersState = freezed,
    Object sortState = freezed,
    Object mapState = freezed,
    Object showMap = freezed,
  }) {
    return _then(_value.copyWith(
      listState: listState == freezed
          ? _value.listState
          : listState as ControlObjectsListState,
      filtersState: filtersState == freezed
          ? _value.filtersState
          : filtersState as ControlFiltersBlocState,
      sortState: sortState == freezed ? _value.sortState : sortState as String,
      mapState: mapState == freezed
          ? _value.mapState
          : mapState as ControlObjectsMapState,
      showMap: showMap == freezed ? _value.showMap : showMap as bool,
    ));
  }

  @override
  $ControlObjectsListStateCopyWith<$Res> get listState {
    if (_value.listState == null) {
      return null;
    }
    return $ControlObjectsListStateCopyWith<$Res>(_value.listState, (value) {
      return _then(_value.copyWith(listState: value));
    });
  }

  @override
  $ControlFiltersBlocStateCopyWith<$Res> get filtersState {
    if (_value.filtersState == null) {
      return null;
    }
    return $ControlFiltersBlocStateCopyWith<$Res>(_value.filtersState, (value) {
      return _then(_value.copyWith(filtersState: value));
    });
  }

  @override
  $ControlObjectsMapStateCopyWith<$Res> get mapState {
    if (_value.mapState == null) {
      return null;
    }
    return $ControlObjectsMapStateCopyWith<$Res>(_value.mapState, (value) {
      return _then(_value.copyWith(mapState: value));
    });
  }
}

/// @nodoc
abstract class $CantWorkInThisModeStateCopyWith<$Res>
    implements $ControlListBlocStateCopyWith<$Res> {
  factory $CantWorkInThisModeStateCopyWith(CantWorkInThisModeState value,
          $Res Function(CantWorkInThisModeState) then) =
      _$CantWorkInThisModeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap});

  @override
  $ControlObjectsListStateCopyWith<$Res> get listState;
  @override
  $ControlFiltersBlocStateCopyWith<$Res> get filtersState;
  @override
  $ControlObjectsMapStateCopyWith<$Res> get mapState;
}

/// @nodoc
class _$CantWorkInThisModeStateCopyWithImpl<$Res>
    extends _$ControlListBlocStateCopyWithImpl<$Res>
    implements $CantWorkInThisModeStateCopyWith<$Res> {
  _$CantWorkInThisModeStateCopyWithImpl(CantWorkInThisModeState _value,
      $Res Function(CantWorkInThisModeState) _then)
      : super(_value, (v) => _then(v as CantWorkInThisModeState));

  @override
  CantWorkInThisModeState get _value => super._value as CantWorkInThisModeState;

  @override
  $Res call({
    Object listState = freezed,
    Object filtersState = freezed,
    Object sortState = freezed,
    Object mapState = freezed,
    Object showMap = freezed,
  }) {
    return _then(CantWorkInThisModeState(
      listState: listState == freezed
          ? _value.listState
          : listState as ControlObjectsListState,
      filtersState: filtersState == freezed
          ? _value.filtersState
          : filtersState as ControlFiltersBlocState,
      sortState: sortState == freezed ? _value.sortState : sortState as String,
      mapState: mapState == freezed
          ? _value.mapState
          : mapState as ControlObjectsMapState,
      showMap: showMap == freezed ? _value.showMap : showMap as bool,
    ));
  }
}

/// @nodoc
class _$CantWorkInThisModeState implements CantWorkInThisModeState {
  const _$CantWorkInThisModeState(
      {this.listState,
      this.filtersState,
      this.sortState,
      this.mapState,
      this.showMap});

  @override
  final ControlObjectsListState listState;
  @override
  final ControlFiltersBlocState filtersState;
  @override
  final String sortState;
  @override
  final ControlObjectsMapState mapState;
  @override
  final bool showMap;

  @override
  String toString() {
    return 'ControlListBlocState.cantWorkInThisModeState(listState: $listState, filtersState: $filtersState, sortState: $sortState, mapState: $mapState, showMap: $showMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CantWorkInThisModeState &&
            (identical(other.listState, listState) ||
                const DeepCollectionEquality()
                    .equals(other.listState, listState)) &&
            (identical(other.filtersState, filtersState) ||
                const DeepCollectionEquality()
                    .equals(other.filtersState, filtersState)) &&
            (identical(other.sortState, sortState) ||
                const DeepCollectionEquality()
                    .equals(other.sortState, sortState)) &&
            (identical(other.mapState, mapState) ||
                const DeepCollectionEquality()
                    .equals(other.mapState, mapState)) &&
            (identical(other.showMap, showMap) ||
                const DeepCollectionEquality().equals(other.showMap, showMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listState) ^
      const DeepCollectionEquality().hash(filtersState) ^
      const DeepCollectionEquality().hash(sortState) ^
      const DeepCollectionEquality().hash(mapState) ^
      const DeepCollectionEquality().hash(showMap);

  @JsonKey(ignore: true)
  @override
  $CantWorkInThisModeStateCopyWith<CantWorkInThisModeState> get copyWith =>
      _$CantWorkInThisModeStateCopyWithImpl<CantWorkInThisModeState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    @required
        TResult cantWorkInThisModeState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap),
    @required
        TResult apiExceptionState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap,
            ApiException exception),
  }) {
    assert(cantWorkInThisModeState != null);
    assert($default != null);
    assert(apiExceptionState != null);
    return cantWorkInThisModeState(
        listState, filtersState, sortState, mapState, showMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    TResult cantWorkInThisModeState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap),
    TResult apiExceptionState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap,
        ApiException exception),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cantWorkInThisModeState != null) {
      return cantWorkInThisModeState(
          listState, filtersState, sortState, mapState, showMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    @required TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    @required
        TResult apiExceptionState(_ControlListApiExceptionBlocState value),
  }) {
    assert(cantWorkInThisModeState != null);
    assert($default != null);
    assert(apiExceptionState != null);
    return cantWorkInThisModeState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    TResult apiExceptionState(_ControlListApiExceptionBlocState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cantWorkInThisModeState != null) {
      return cantWorkInThisModeState(this);
    }
    return orElse();
  }
}

abstract class CantWorkInThisModeState implements ControlListBlocState {
  const factory CantWorkInThisModeState(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap}) = _$CantWorkInThisModeState;

  @override
  ControlObjectsListState get listState;
  @override
  ControlFiltersBlocState get filtersState;
  @override
  String get sortState;
  @override
  ControlObjectsMapState get mapState;
  @override
  bool get showMap;
  @override
  @JsonKey(ignore: true)
  $CantWorkInThisModeStateCopyWith<CantWorkInThisModeState> get copyWith;
}

/// @nodoc
abstract class _$ControlListBlocStateCopyWith<$Res>
    implements $ControlListBlocStateCopyWith<$Res> {
  factory _$ControlListBlocStateCopyWith(_ControlListBlocState value,
          $Res Function(_ControlListBlocState) then) =
      __$ControlListBlocStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap});

  @override
  $ControlObjectsListStateCopyWith<$Res> get listState;
  @override
  $ControlFiltersBlocStateCopyWith<$Res> get filtersState;
  @override
  $ControlObjectsMapStateCopyWith<$Res> get mapState;
}

/// @nodoc
class __$ControlListBlocStateCopyWithImpl<$Res>
    extends _$ControlListBlocStateCopyWithImpl<$Res>
    implements _$ControlListBlocStateCopyWith<$Res> {
  __$ControlListBlocStateCopyWithImpl(
      _ControlListBlocState _value, $Res Function(_ControlListBlocState) _then)
      : super(_value, (v) => _then(v as _ControlListBlocState));

  @override
  _ControlListBlocState get _value => super._value as _ControlListBlocState;

  @override
  $Res call({
    Object listState = freezed,
    Object filtersState = freezed,
    Object sortState = freezed,
    Object mapState = freezed,
    Object showMap = freezed,
  }) {
    return _then(_ControlListBlocState(
      listState: listState == freezed
          ? _value.listState
          : listState as ControlObjectsListState,
      filtersState: filtersState == freezed
          ? _value.filtersState
          : filtersState as ControlFiltersBlocState,
      sortState: sortState == freezed ? _value.sortState : sortState as String,
      mapState: mapState == freezed
          ? _value.mapState
          : mapState as ControlObjectsMapState,
      showMap: showMap == freezed ? _value.showMap : showMap as bool,
    ));
  }
}

/// @nodoc
class _$_ControlListBlocState implements _ControlListBlocState {
  const _$_ControlListBlocState(
      {this.listState,
      this.filtersState,
      this.sortState,
      this.mapState,
      this.showMap});

  @override
  final ControlObjectsListState listState;
  @override
  final ControlFiltersBlocState filtersState;
  @override
  final String sortState;
  @override
  final ControlObjectsMapState mapState;
  @override
  final bool showMap;

  @override
  String toString() {
    return 'ControlListBlocState(listState: $listState, filtersState: $filtersState, sortState: $sortState, mapState: $mapState, showMap: $showMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlListBlocState &&
            (identical(other.listState, listState) ||
                const DeepCollectionEquality()
                    .equals(other.listState, listState)) &&
            (identical(other.filtersState, filtersState) ||
                const DeepCollectionEquality()
                    .equals(other.filtersState, filtersState)) &&
            (identical(other.sortState, sortState) ||
                const DeepCollectionEquality()
                    .equals(other.sortState, sortState)) &&
            (identical(other.mapState, mapState) ||
                const DeepCollectionEquality()
                    .equals(other.mapState, mapState)) &&
            (identical(other.showMap, showMap) ||
                const DeepCollectionEquality().equals(other.showMap, showMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listState) ^
      const DeepCollectionEquality().hash(filtersState) ^
      const DeepCollectionEquality().hash(sortState) ^
      const DeepCollectionEquality().hash(mapState) ^
      const DeepCollectionEquality().hash(showMap);

  @JsonKey(ignore: true)
  @override
  _$ControlListBlocStateCopyWith<_ControlListBlocState> get copyWith =>
      __$ControlListBlocStateCopyWithImpl<_ControlListBlocState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    @required
        TResult cantWorkInThisModeState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap),
    @required
        TResult apiExceptionState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap,
            ApiException exception),
  }) {
    assert(cantWorkInThisModeState != null);
    assert($default != null);
    assert(apiExceptionState != null);
    return $default(listState, filtersState, sortState, mapState, showMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    TResult cantWorkInThisModeState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap),
    TResult apiExceptionState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap,
        ApiException exception),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(listState, filtersState, sortState, mapState, showMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    @required TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    @required
        TResult apiExceptionState(_ControlListApiExceptionBlocState value),
  }) {
    assert(cantWorkInThisModeState != null);
    assert($default != null);
    assert(apiExceptionState != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    TResult apiExceptionState(_ControlListApiExceptionBlocState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ControlListBlocState implements ControlListBlocState {
  const factory _ControlListBlocState(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap}) = _$_ControlListBlocState;

  @override
  ControlObjectsListState get listState;
  @override
  ControlFiltersBlocState get filtersState;
  @override
  String get sortState;
  @override
  ControlObjectsMapState get mapState;
  @override
  bool get showMap;
  @override
  @JsonKey(ignore: true)
  _$ControlListBlocStateCopyWith<_ControlListBlocState> get copyWith;
}

/// @nodoc
abstract class _$ControlListApiExceptionBlocStateCopyWith<$Res>
    implements $ControlListBlocStateCopyWith<$Res> {
  factory _$ControlListApiExceptionBlocStateCopyWith(
          _ControlListApiExceptionBlocState value,
          $Res Function(_ControlListApiExceptionBlocState) then) =
      __$ControlListApiExceptionBlocStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap,
      ApiException exception});

  @override
  $ControlObjectsListStateCopyWith<$Res> get listState;
  @override
  $ControlFiltersBlocStateCopyWith<$Res> get filtersState;
  @override
  $ControlObjectsMapStateCopyWith<$Res> get mapState;
}

/// @nodoc
class __$ControlListApiExceptionBlocStateCopyWithImpl<$Res>
    extends _$ControlListBlocStateCopyWithImpl<$Res>
    implements _$ControlListApiExceptionBlocStateCopyWith<$Res> {
  __$ControlListApiExceptionBlocStateCopyWithImpl(
      _ControlListApiExceptionBlocState _value,
      $Res Function(_ControlListApiExceptionBlocState) _then)
      : super(_value, (v) => _then(v as _ControlListApiExceptionBlocState));

  @override
  _ControlListApiExceptionBlocState get _value =>
      super._value as _ControlListApiExceptionBlocState;

  @override
  $Res call({
    Object listState = freezed,
    Object filtersState = freezed,
    Object sortState = freezed,
    Object mapState = freezed,
    Object showMap = freezed,
    Object exception = freezed,
  }) {
    return _then(_ControlListApiExceptionBlocState(
      listState: listState == freezed
          ? _value.listState
          : listState as ControlObjectsListState,
      filtersState: filtersState == freezed
          ? _value.filtersState
          : filtersState as ControlFiltersBlocState,
      sortState: sortState == freezed ? _value.sortState : sortState as String,
      mapState: mapState == freezed
          ? _value.mapState
          : mapState as ControlObjectsMapState,
      showMap: showMap == freezed ? _value.showMap : showMap as bool,
      exception:
          exception == freezed ? _value.exception : exception as ApiException,
    ));
  }
}

/// @nodoc
class _$_ControlListApiExceptionBlocState
    implements _ControlListApiExceptionBlocState {
  const _$_ControlListApiExceptionBlocState(
      {this.listState,
      this.filtersState,
      this.sortState,
      this.mapState,
      this.showMap,
      this.exception});

  @override
  final ControlObjectsListState listState;
  @override
  final ControlFiltersBlocState filtersState;
  @override
  final String sortState;
  @override
  final ControlObjectsMapState mapState;
  @override
  final bool showMap;
  @override
  final ApiException exception;

  @override
  String toString() {
    return 'ControlListBlocState.apiExceptionState(listState: $listState, filtersState: $filtersState, sortState: $sortState, mapState: $mapState, showMap: $showMap, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlListApiExceptionBlocState &&
            (identical(other.listState, listState) ||
                const DeepCollectionEquality()
                    .equals(other.listState, listState)) &&
            (identical(other.filtersState, filtersState) ||
                const DeepCollectionEquality()
                    .equals(other.filtersState, filtersState)) &&
            (identical(other.sortState, sortState) ||
                const DeepCollectionEquality()
                    .equals(other.sortState, sortState)) &&
            (identical(other.mapState, mapState) ||
                const DeepCollectionEquality()
                    .equals(other.mapState, mapState)) &&
            (identical(other.showMap, showMap) ||
                const DeepCollectionEquality()
                    .equals(other.showMap, showMap)) &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(listState) ^
      const DeepCollectionEquality().hash(filtersState) ^
      const DeepCollectionEquality().hash(sortState) ^
      const DeepCollectionEquality().hash(mapState) ^
      const DeepCollectionEquality().hash(showMap) ^
      const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  _$ControlListApiExceptionBlocStateCopyWith<_ControlListApiExceptionBlocState>
      get copyWith => __$ControlListApiExceptionBlocStateCopyWithImpl<
          _ControlListApiExceptionBlocState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    @required
        TResult cantWorkInThisModeState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap),
    @required
        TResult apiExceptionState(
            ControlObjectsListState listState,
            ControlFiltersBlocState filtersState,
            String sortState,
            ControlObjectsMapState mapState,
            bool showMap,
            ApiException exception),
  }) {
    assert(cantWorkInThisModeState != null);
    assert($default != null);
    assert(apiExceptionState != null);
    return apiExceptionState(
        listState, filtersState, sortState, mapState, showMap, exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap), {
    TResult cantWorkInThisModeState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap),
    TResult apiExceptionState(
        ControlObjectsListState listState,
        ControlFiltersBlocState filtersState,
        String sortState,
        ControlObjectsMapState mapState,
        bool showMap,
        ApiException exception),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (apiExceptionState != null) {
      return apiExceptionState(
          listState, filtersState, sortState, mapState, showMap, exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    @required TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    @required
        TResult apiExceptionState(_ControlListApiExceptionBlocState value),
  }) {
    assert(cantWorkInThisModeState != null);
    assert($default != null);
    assert(apiExceptionState != null);
    return apiExceptionState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(_ControlListBlocState value), {
    TResult cantWorkInThisModeState(CantWorkInThisModeState value),
    TResult apiExceptionState(_ControlListApiExceptionBlocState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (apiExceptionState != null) {
      return apiExceptionState(this);
    }
    return orElse();
  }
}

abstract class _ControlListApiExceptionBlocState
    implements ControlListBlocState {
  const factory _ControlListApiExceptionBlocState(
      {ControlObjectsListState listState,
      ControlFiltersBlocState filtersState,
      String sortState,
      ControlObjectsMapState mapState,
      bool showMap,
      ApiException exception}) = _$_ControlListApiExceptionBlocState;

  @override
  ControlObjectsListState get listState;
  @override
  ControlFiltersBlocState get filtersState;
  @override
  String get sortState;
  @override
  ControlObjectsMapState get mapState;
  @override
  bool get showMap;
  ApiException get exception;
  @override
  @JsonKey(ignore: true)
  _$ControlListApiExceptionBlocStateCopyWith<_ControlListApiExceptionBlocState>
      get copyWith;
}

/// @nodoc
class _$ControlObjectsListStateTearOff {
  const _$ControlObjectsListStateTearOff();

// ignore: unused_element
  EmptyListLoadedState emptyListLoadedState({bool refresh}) {
    return EmptyListLoadedState(
      refresh: refresh,
    );
  }

// ignore: unused_element
  LoadingListState loadingListState() {
    return const LoadingListState();
  }

// ignore: unused_element
  LoadedListState loadedListState({List<ControlObject> objects, bool refresh}) {
    return LoadedListState(
      objects: objects,
      refresh: refresh,
    );
  }

// ignore: unused_element
  LoadedAllListState loadedAllListState(
      {List<ControlObject> objects, bool refresh}) {
    return LoadedAllListState(
      objects: objects,
      refresh: refresh,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectsListState = _$ControlObjectsListStateTearOff();

/// @nodoc
mixin _$ControlObjectsListState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyListLoadedState(bool refresh),
    @required TResult loadingListState(),
    @required
        TResult loadedListState(List<ControlObject> objects, bool refresh),
    @required
        TResult loadedAllListState(List<ControlObject> objects, bool refresh),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyListLoadedState(bool refresh),
    TResult loadingListState(),
    TResult loadedListState(List<ControlObject> objects, bool refresh),
    TResult loadedAllListState(List<ControlObject> objects, bool refresh),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyListLoadedState(EmptyListLoadedState value),
    @required TResult loadingListState(LoadingListState value),
    @required TResult loadedListState(LoadedListState value),
    @required TResult loadedAllListState(LoadedAllListState value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyListLoadedState(EmptyListLoadedState value),
    TResult loadingListState(LoadingListState value),
    TResult loadedListState(LoadedListState value),
    TResult loadedAllListState(LoadedAllListState value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlObjectsListStateCopyWith<$Res> {
  factory $ControlObjectsListStateCopyWith(ControlObjectsListState value,
          $Res Function(ControlObjectsListState) then) =
      _$ControlObjectsListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlObjectsListStateCopyWithImpl<$Res>
    implements $ControlObjectsListStateCopyWith<$Res> {
  _$ControlObjectsListStateCopyWithImpl(this._value, this._then);

  final ControlObjectsListState _value;
  // ignore: unused_field
  final $Res Function(ControlObjectsListState) _then;
}

/// @nodoc
abstract class $EmptyListLoadedStateCopyWith<$Res> {
  factory $EmptyListLoadedStateCopyWith(EmptyListLoadedState value,
          $Res Function(EmptyListLoadedState) then) =
      _$EmptyListLoadedStateCopyWithImpl<$Res>;
  $Res call({bool refresh});
}

/// @nodoc
class _$EmptyListLoadedStateCopyWithImpl<$Res>
    extends _$ControlObjectsListStateCopyWithImpl<$Res>
    implements $EmptyListLoadedStateCopyWith<$Res> {
  _$EmptyListLoadedStateCopyWithImpl(
      EmptyListLoadedState _value, $Res Function(EmptyListLoadedState) _then)
      : super(_value, (v) => _then(v as EmptyListLoadedState));

  @override
  EmptyListLoadedState get _value => super._value as EmptyListLoadedState;

  @override
  $Res call({
    Object refresh = freezed,
  }) {
    return _then(EmptyListLoadedState(
      refresh: refresh == freezed ? _value.refresh : refresh as bool,
    ));
  }
}

/// @nodoc
class _$EmptyListLoadedState extends EmptyListLoadedState {
  const _$EmptyListLoadedState({this.refresh}) : super._();

  @override
  final bool refresh;

  @override
  String toString() {
    return 'ControlObjectsListState.emptyListLoadedState(refresh: $refresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmptyListLoadedState &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality().equals(other.refresh, refresh)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(refresh);

  @JsonKey(ignore: true)
  @override
  $EmptyListLoadedStateCopyWith<EmptyListLoadedState> get copyWith =>
      _$EmptyListLoadedStateCopyWithImpl<EmptyListLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyListLoadedState(bool refresh),
    @required TResult loadingListState(),
    @required
        TResult loadedListState(List<ControlObject> objects, bool refresh),
    @required
        TResult loadedAllListState(List<ControlObject> objects, bool refresh),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return emptyListLoadedState(refresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyListLoadedState(bool refresh),
    TResult loadingListState(),
    TResult loadedListState(List<ControlObject> objects, bool refresh),
    TResult loadedAllListState(List<ControlObject> objects, bool refresh),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyListLoadedState != null) {
      return emptyListLoadedState(refresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyListLoadedState(EmptyListLoadedState value),
    @required TResult loadingListState(LoadingListState value),
    @required TResult loadedListState(LoadedListState value),
    @required TResult loadedAllListState(LoadedAllListState value),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return emptyListLoadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyListLoadedState(EmptyListLoadedState value),
    TResult loadingListState(LoadingListState value),
    TResult loadedListState(LoadedListState value),
    TResult loadedAllListState(LoadedAllListState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyListLoadedState != null) {
      return emptyListLoadedState(this);
    }
    return orElse();
  }
}

abstract class EmptyListLoadedState extends ControlObjectsListState {
  const EmptyListLoadedState._() : super._();
  const factory EmptyListLoadedState({bool refresh}) = _$EmptyListLoadedState;

  bool get refresh;
  @JsonKey(ignore: true)
  $EmptyListLoadedStateCopyWith<EmptyListLoadedState> get copyWith;
}

/// @nodoc
abstract class $LoadingListStateCopyWith<$Res> {
  factory $LoadingListStateCopyWith(
          LoadingListState value, $Res Function(LoadingListState) then) =
      _$LoadingListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingListStateCopyWithImpl<$Res>
    extends _$ControlObjectsListStateCopyWithImpl<$Res>
    implements $LoadingListStateCopyWith<$Res> {
  _$LoadingListStateCopyWithImpl(
      LoadingListState _value, $Res Function(LoadingListState) _then)
      : super(_value, (v) => _then(v as LoadingListState));

  @override
  LoadingListState get _value => super._value as LoadingListState;
}

/// @nodoc
class _$LoadingListState extends LoadingListState {
  const _$LoadingListState() : super._();

  @override
  String toString() {
    return 'ControlObjectsListState.loadingListState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadingListState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyListLoadedState(bool refresh),
    @required TResult loadingListState(),
    @required
        TResult loadedListState(List<ControlObject> objects, bool refresh),
    @required
        TResult loadedAllListState(List<ControlObject> objects, bool refresh),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return loadingListState();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyListLoadedState(bool refresh),
    TResult loadingListState(),
    TResult loadedListState(List<ControlObject> objects, bool refresh),
    TResult loadedAllListState(List<ControlObject> objects, bool refresh),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingListState != null) {
      return loadingListState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyListLoadedState(EmptyListLoadedState value),
    @required TResult loadingListState(LoadingListState value),
    @required TResult loadedListState(LoadedListState value),
    @required TResult loadedAllListState(LoadedAllListState value),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return loadingListState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyListLoadedState(EmptyListLoadedState value),
    TResult loadingListState(LoadingListState value),
    TResult loadedListState(LoadedListState value),
    TResult loadedAllListState(LoadedAllListState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingListState != null) {
      return loadingListState(this);
    }
    return orElse();
  }
}

abstract class LoadingListState extends ControlObjectsListState {
  const LoadingListState._() : super._();
  const factory LoadingListState() = _$LoadingListState;
}

/// @nodoc
abstract class $LoadedListStateCopyWith<$Res> {
  factory $LoadedListStateCopyWith(
          LoadedListState value, $Res Function(LoadedListState) then) =
      _$LoadedListStateCopyWithImpl<$Res>;
  $Res call({List<ControlObject> objects, bool refresh});
}

/// @nodoc
class _$LoadedListStateCopyWithImpl<$Res>
    extends _$ControlObjectsListStateCopyWithImpl<$Res>
    implements $LoadedListStateCopyWith<$Res> {
  _$LoadedListStateCopyWithImpl(
      LoadedListState _value, $Res Function(LoadedListState) _then)
      : super(_value, (v) => _then(v as LoadedListState));

  @override
  LoadedListState get _value => super._value as LoadedListState;

  @override
  $Res call({
    Object objects = freezed,
    Object refresh = freezed,
  }) {
    return _then(LoadedListState(
      objects:
          objects == freezed ? _value.objects : objects as List<ControlObject>,
      refresh: refresh == freezed ? _value.refresh : refresh as bool,
    ));
  }
}

/// @nodoc
class _$LoadedListState extends LoadedListState {
  const _$LoadedListState({this.objects, this.refresh}) : super._();

  @override
  final List<ControlObject> objects;
  @override
  final bool refresh;

  @override
  String toString() {
    return 'ControlObjectsListState.loadedListState(objects: $objects, refresh: $refresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedListState &&
            (identical(other.objects, objects) ||
                const DeepCollectionEquality()
                    .equals(other.objects, objects)) &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality().equals(other.refresh, refresh)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(objects) ^
      const DeepCollectionEquality().hash(refresh);

  @JsonKey(ignore: true)
  @override
  $LoadedListStateCopyWith<LoadedListState> get copyWith =>
      _$LoadedListStateCopyWithImpl<LoadedListState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyListLoadedState(bool refresh),
    @required TResult loadingListState(),
    @required
        TResult loadedListState(List<ControlObject> objects, bool refresh),
    @required
        TResult loadedAllListState(List<ControlObject> objects, bool refresh),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return loadedListState(objects, refresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyListLoadedState(bool refresh),
    TResult loadingListState(),
    TResult loadedListState(List<ControlObject> objects, bool refresh),
    TResult loadedAllListState(List<ControlObject> objects, bool refresh),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedListState != null) {
      return loadedListState(objects, refresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyListLoadedState(EmptyListLoadedState value),
    @required TResult loadingListState(LoadingListState value),
    @required TResult loadedListState(LoadedListState value),
    @required TResult loadedAllListState(LoadedAllListState value),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return loadedListState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyListLoadedState(EmptyListLoadedState value),
    TResult loadingListState(LoadingListState value),
    TResult loadedListState(LoadedListState value),
    TResult loadedAllListState(LoadedAllListState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedListState != null) {
      return loadedListState(this);
    }
    return orElse();
  }
}

abstract class LoadedListState extends ControlObjectsListState {
  const LoadedListState._() : super._();
  const factory LoadedListState({List<ControlObject> objects, bool refresh}) =
      _$LoadedListState;

  List<ControlObject> get objects;
  bool get refresh;
  @JsonKey(ignore: true)
  $LoadedListStateCopyWith<LoadedListState> get copyWith;
}

/// @nodoc
abstract class $LoadedAllListStateCopyWith<$Res> {
  factory $LoadedAllListStateCopyWith(
          LoadedAllListState value, $Res Function(LoadedAllListState) then) =
      _$LoadedAllListStateCopyWithImpl<$Res>;
  $Res call({List<ControlObject> objects, bool refresh});
}

/// @nodoc
class _$LoadedAllListStateCopyWithImpl<$Res>
    extends _$ControlObjectsListStateCopyWithImpl<$Res>
    implements $LoadedAllListStateCopyWith<$Res> {
  _$LoadedAllListStateCopyWithImpl(
      LoadedAllListState _value, $Res Function(LoadedAllListState) _then)
      : super(_value, (v) => _then(v as LoadedAllListState));

  @override
  LoadedAllListState get _value => super._value as LoadedAllListState;

  @override
  $Res call({
    Object objects = freezed,
    Object refresh = freezed,
  }) {
    return _then(LoadedAllListState(
      objects:
          objects == freezed ? _value.objects : objects as List<ControlObject>,
      refresh: refresh == freezed ? _value.refresh : refresh as bool,
    ));
  }
}

/// @nodoc
class _$LoadedAllListState extends LoadedAllListState {
  const _$LoadedAllListState({this.objects, this.refresh}) : super._();

  @override
  final List<ControlObject> objects;
  @override
  final bool refresh;

  @override
  String toString() {
    return 'ControlObjectsListState.loadedAllListState(objects: $objects, refresh: $refresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedAllListState &&
            (identical(other.objects, objects) ||
                const DeepCollectionEquality()
                    .equals(other.objects, objects)) &&
            (identical(other.refresh, refresh) ||
                const DeepCollectionEquality().equals(other.refresh, refresh)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(objects) ^
      const DeepCollectionEquality().hash(refresh);

  @JsonKey(ignore: true)
  @override
  $LoadedAllListStateCopyWith<LoadedAllListState> get copyWith =>
      _$LoadedAllListStateCopyWithImpl<LoadedAllListState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult emptyListLoadedState(bool refresh),
    @required TResult loadingListState(),
    @required
        TResult loadedListState(List<ControlObject> objects, bool refresh),
    @required
        TResult loadedAllListState(List<ControlObject> objects, bool refresh),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return loadedAllListState(objects, refresh);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult emptyListLoadedState(bool refresh),
    TResult loadingListState(),
    TResult loadedListState(List<ControlObject> objects, bool refresh),
    TResult loadedAllListState(List<ControlObject> objects, bool refresh),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedAllListState != null) {
      return loadedAllListState(objects, refresh);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult emptyListLoadedState(EmptyListLoadedState value),
    @required TResult loadingListState(LoadingListState value),
    @required TResult loadedListState(LoadedListState value),
    @required TResult loadedAllListState(LoadedAllListState value),
  }) {
    assert(emptyListLoadedState != null);
    assert(loadingListState != null);
    assert(loadedListState != null);
    assert(loadedAllListState != null);
    return loadedAllListState(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult emptyListLoadedState(EmptyListLoadedState value),
    TResult loadingListState(LoadingListState value),
    TResult loadedListState(LoadedListState value),
    TResult loadedAllListState(LoadedAllListState value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedAllListState != null) {
      return loadedAllListState(this);
    }
    return orElse();
  }
}

abstract class LoadedAllListState extends ControlObjectsListState {
  const LoadedAllListState._() : super._();
  const factory LoadedAllListState(
      {List<ControlObject> objects, bool refresh}) = _$LoadedAllListState;

  List<ControlObject> get objects;
  bool get refresh;
  @JsonKey(ignore: true)
  $LoadedAllListStateCopyWith<LoadedAllListState> get copyWith;
}
