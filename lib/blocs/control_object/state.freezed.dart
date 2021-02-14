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
  LoadingState loadingState({ControlObject object}) {
    return LoadingState(
      object: object,
    );
  }

// ignore: unused_element
  LoadedWithListState loadedWithListState(
      {ControlObject object,
      List<ControlResultSearchResult> controlSearchResults}) {
    return LoadedWithListState(
      object: object,
      controlSearchResults: controlSearchResults,
    );
  }

// ignore: unused_element
  LoadedState loadedState({ControlObject object}) {
    return LoadedState(
      object: object,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlObjectBlocState = _$ControlObjectBlocStateTearOff();

/// @nodoc
mixin _$ControlObjectBlocState {
  ControlObject get object;

  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(ControlObject object),
    @required
        TResult loadedWithListState(ControlObject object,
            List<ControlResultSearchResult> controlSearchResults),
    @required TResult loadedState(ControlObject object),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object),
    TResult loadedWithListState(ControlObject object,
        List<ControlResultSearchResult> controlSearchResults),
    TResult loadedState(ControlObject object),
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
  $Res call({ControlObject object});

  $ControlObjectCopyWith<$Res> get object;
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
  }) {
    return _then(_value.copyWith(
      object: object == freezed ? _value.object : object as ControlObject,
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
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res>
    implements $ControlObjectBlocStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
  @override
  $Res call({ControlObject object});

  @override
  $ControlObjectCopyWith<$Res> get object;
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
  }) {
    return _then(LoadingState(
      object: object == freezed ? _value.object : object as ControlObject,
    ));
  }
}

/// @nodoc
class _$LoadingState implements LoadingState {
  const _$LoadingState({this.object});

  @override
  final ControlObject object;

  @override
  String toString() {
    return 'ControlObjectBlocState.loadingState(object: $object)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadingState &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(object);

  @JsonKey(ignore: true)
  @override
  $LoadingStateCopyWith<LoadingState> get copyWith =>
      _$LoadingStateCopyWithImpl<LoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(ControlObject object),
    @required
        TResult loadedWithListState(ControlObject object,
            List<ControlResultSearchResult> controlSearchResults),
    @required TResult loadedState(ControlObject object),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadingState(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object),
    TResult loadedWithListState(ControlObject object,
        List<ControlResultSearchResult> controlSearchResults),
    TResult loadedState(ControlObject object),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadingState != null) {
      return loadingState(object);
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
  const factory LoadingState({ControlObject object}) = _$LoadingState;

  @override
  ControlObject get object;
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
      List<ControlResultSearchResult> controlSearchResults});

  @override
  $ControlObjectCopyWith<$Res> get object;
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
  }) {
    return _then(LoadedWithListState(
      object: object == freezed ? _value.object : object as ControlObject,
      controlSearchResults: controlSearchResults == freezed
          ? _value.controlSearchResults
          : controlSearchResults as List<ControlResultSearchResult>,
    ));
  }
}

/// @nodoc
class _$LoadedWithListState implements LoadedWithListState {
  const _$LoadedWithListState({this.object, this.controlSearchResults});

  @override
  final ControlObject object;
  @override
  final List<ControlResultSearchResult> controlSearchResults;

  @override
  String toString() {
    return 'ControlObjectBlocState.loadedWithListState(object: $object, controlSearchResults: $controlSearchResults)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedWithListState &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlSearchResults, controlSearchResults) ||
                const DeepCollectionEquality()
                    .equals(other.controlSearchResults, controlSearchResults)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlSearchResults);

  @JsonKey(ignore: true)
  @override
  $LoadedWithListStateCopyWith<LoadedWithListState> get copyWith =>
      _$LoadedWithListStateCopyWithImpl<LoadedWithListState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(ControlObject object),
    @required
        TResult loadedWithListState(ControlObject object,
            List<ControlResultSearchResult> controlSearchResults),
    @required TResult loadedState(ControlObject object),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadedWithListState(object, controlSearchResults);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object),
    TResult loadedWithListState(ControlObject object,
        List<ControlResultSearchResult> controlSearchResults),
    TResult loadedState(ControlObject object),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedWithListState != null) {
      return loadedWithListState(object, controlSearchResults);
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
          List<ControlResultSearchResult> controlSearchResults}) =
      _$LoadedWithListState;

  @override
  ControlObject get object;
  List<ControlResultSearchResult> get controlSearchResults;
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
  $Res call({ControlObject object});

  @override
  $ControlObjectCopyWith<$Res> get object;
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
  }) {
    return _then(LoadedState(
      object: object == freezed ? _value.object : object as ControlObject,
    ));
  }
}

/// @nodoc
class _$LoadedState implements LoadedState {
  const _$LoadedState({this.object});

  @override
  final ControlObject object;

  @override
  String toString() {
    return 'ControlObjectBlocState.loadedState(object: $object)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedState &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(object);

  @JsonKey(ignore: true)
  @override
  $LoadedStateCopyWith<LoadedState> get copyWith =>
      _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadingState(ControlObject object),
    @required
        TResult loadedWithListState(ControlObject object,
            List<ControlResultSearchResult> controlSearchResults),
    @required TResult loadedState(ControlObject object),
  }) {
    assert(loadingState != null);
    assert(loadedWithListState != null);
    assert(loadedState != null);
    return loadedState(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadingState(ControlObject object),
    TResult loadedWithListState(ControlObject object,
        List<ControlResultSearchResult> controlSearchResults),
    TResult loadedState(ControlObject object),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadedState != null) {
      return loadedState(object);
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
  const factory LoadedState({ControlObject object}) = _$LoadedState;

  @override
  ControlObject get object;
  @override
  @JsonKey(ignore: true)
  $LoadedStateCopyWith<LoadedState> get copyWith;
}
