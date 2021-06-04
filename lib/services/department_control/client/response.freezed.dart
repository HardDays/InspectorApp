// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlResultsResponseTearOff {
  const _$ControlResultsResponseTearOff();

// ignore: unused_element
  _ControlResultsList controlResultsListResponse(
      List<ControlResultSearchResult> results) {
    return _ControlResultsList(
      results,
    );
  }

// ignore: unused_element
  _EmptyControlResultsList emptyResultsListResponse() {
    return const _EmptyControlResultsList();
  }

// ignore: unused_element
  _ExceptionResponse exceptionResponse(ApiException e) {
    return _ExceptionResponse(
      e,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlResultsResponse = _$ControlResultsResponseTearOff();

/// @nodoc
mixin _$ControlResultsResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult controlResultsListResponse(
            List<ControlResultSearchResult> results),
    @required TResult emptyResultsListResponse(),
    @required TResult exceptionResponse(ApiException e),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult controlResultsListResponse(List<ControlResultSearchResult> results),
    TResult emptyResultsListResponse(),
    TResult exceptionResponse(ApiException e),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult controlResultsListResponse(_ControlResultsList value),
    @required TResult emptyResultsListResponse(_EmptyControlResultsList value),
    @required TResult exceptionResponse(_ExceptionResponse value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult controlResultsListResponse(_ControlResultsList value),
    TResult emptyResultsListResponse(_EmptyControlResultsList value),
    TResult exceptionResponse(_ExceptionResponse value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlResultsResponseCopyWith<$Res> {
  factory $ControlResultsResponseCopyWith(ControlResultsResponse value,
          $Res Function(ControlResultsResponse) then) =
      _$ControlResultsResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlResultsResponseCopyWithImpl<$Res>
    implements $ControlResultsResponseCopyWith<$Res> {
  _$ControlResultsResponseCopyWithImpl(this._value, this._then);

  final ControlResultsResponse _value;
  // ignore: unused_field
  final $Res Function(ControlResultsResponse) _then;
}

/// @nodoc
abstract class _$ControlResultsListCopyWith<$Res> {
  factory _$ControlResultsListCopyWith(
          _ControlResultsList value, $Res Function(_ControlResultsList) then) =
      __$ControlResultsListCopyWithImpl<$Res>;
  $Res call({List<ControlResultSearchResult> results});
}

/// @nodoc
class __$ControlResultsListCopyWithImpl<$Res>
    extends _$ControlResultsResponseCopyWithImpl<$Res>
    implements _$ControlResultsListCopyWith<$Res> {
  __$ControlResultsListCopyWithImpl(
      _ControlResultsList _value, $Res Function(_ControlResultsList) _then)
      : super(_value, (v) => _then(v as _ControlResultsList));

  @override
  _ControlResultsList get _value => super._value as _ControlResultsList;

  @override
  $Res call({
    Object results = freezed,
  }) {
    return _then(_ControlResultsList(
      results == freezed
          ? _value.results
          : results as List<ControlResultSearchResult>,
    ));
  }
}

/// @nodoc
class _$_ControlResultsList implements _ControlResultsList {
  const _$_ControlResultsList(this.results) : assert(results != null);

  @override
  final List<ControlResultSearchResult> results;

  @override
  String toString() {
    return 'ControlResultsResponse.controlResultsListResponse(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ControlResultsList &&
            (identical(other.results, results) ||
                const DeepCollectionEquality().equals(other.results, results)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(results);

  @JsonKey(ignore: true)
  @override
  _$ControlResultsListCopyWith<_ControlResultsList> get copyWith =>
      __$ControlResultsListCopyWithImpl<_ControlResultsList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult controlResultsListResponse(
            List<ControlResultSearchResult> results),
    @required TResult emptyResultsListResponse(),
    @required TResult exceptionResponse(ApiException e),
  }) {
    assert(controlResultsListResponse != null);
    assert(emptyResultsListResponse != null);
    assert(exceptionResponse != null);
    return controlResultsListResponse(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult controlResultsListResponse(List<ControlResultSearchResult> results),
    TResult emptyResultsListResponse(),
    TResult exceptionResponse(ApiException e),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (controlResultsListResponse != null) {
      return controlResultsListResponse(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult controlResultsListResponse(_ControlResultsList value),
    @required TResult emptyResultsListResponse(_EmptyControlResultsList value),
    @required TResult exceptionResponse(_ExceptionResponse value),
  }) {
    assert(controlResultsListResponse != null);
    assert(emptyResultsListResponse != null);
    assert(exceptionResponse != null);
    return controlResultsListResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult controlResultsListResponse(_ControlResultsList value),
    TResult emptyResultsListResponse(_EmptyControlResultsList value),
    TResult exceptionResponse(_ExceptionResponse value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (controlResultsListResponse != null) {
      return controlResultsListResponse(this);
    }
    return orElse();
  }
}

abstract class _ControlResultsList implements ControlResultsResponse {
  const factory _ControlResultsList(List<ControlResultSearchResult> results) =
      _$_ControlResultsList;

  List<ControlResultSearchResult> get results;
  @JsonKey(ignore: true)
  _$ControlResultsListCopyWith<_ControlResultsList> get copyWith;
}

/// @nodoc
abstract class _$EmptyControlResultsListCopyWith<$Res> {
  factory _$EmptyControlResultsListCopyWith(_EmptyControlResultsList value,
          $Res Function(_EmptyControlResultsList) then) =
      __$EmptyControlResultsListCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmptyControlResultsListCopyWithImpl<$Res>
    extends _$ControlResultsResponseCopyWithImpl<$Res>
    implements _$EmptyControlResultsListCopyWith<$Res> {
  __$EmptyControlResultsListCopyWithImpl(_EmptyControlResultsList _value,
      $Res Function(_EmptyControlResultsList) _then)
      : super(_value, (v) => _then(v as _EmptyControlResultsList));

  @override
  _EmptyControlResultsList get _value =>
      super._value as _EmptyControlResultsList;
}

/// @nodoc
class _$_EmptyControlResultsList implements _EmptyControlResultsList {
  const _$_EmptyControlResultsList();

  @override
  String toString() {
    return 'ControlResultsResponse.emptyResultsListResponse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmptyControlResultsList);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult controlResultsListResponse(
            List<ControlResultSearchResult> results),
    @required TResult emptyResultsListResponse(),
    @required TResult exceptionResponse(ApiException e),
  }) {
    assert(controlResultsListResponse != null);
    assert(emptyResultsListResponse != null);
    assert(exceptionResponse != null);
    return emptyResultsListResponse();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult controlResultsListResponse(List<ControlResultSearchResult> results),
    TResult emptyResultsListResponse(),
    TResult exceptionResponse(ApiException e),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyResultsListResponse != null) {
      return emptyResultsListResponse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult controlResultsListResponse(_ControlResultsList value),
    @required TResult emptyResultsListResponse(_EmptyControlResultsList value),
    @required TResult exceptionResponse(_ExceptionResponse value),
  }) {
    assert(controlResultsListResponse != null);
    assert(emptyResultsListResponse != null);
    assert(exceptionResponse != null);
    return emptyResultsListResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult controlResultsListResponse(_ControlResultsList value),
    TResult emptyResultsListResponse(_EmptyControlResultsList value),
    TResult exceptionResponse(_ExceptionResponse value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (emptyResultsListResponse != null) {
      return emptyResultsListResponse(this);
    }
    return orElse();
  }
}

abstract class _EmptyControlResultsList implements ControlResultsResponse {
  const factory _EmptyControlResultsList() = _$_EmptyControlResultsList;
}

/// @nodoc
abstract class _$ExceptionResponseCopyWith<$Res> {
  factory _$ExceptionResponseCopyWith(
          _ExceptionResponse value, $Res Function(_ExceptionResponse) then) =
      __$ExceptionResponseCopyWithImpl<$Res>;
  $Res call({ApiException e});
}

/// @nodoc
class __$ExceptionResponseCopyWithImpl<$Res>
    extends _$ControlResultsResponseCopyWithImpl<$Res>
    implements _$ExceptionResponseCopyWith<$Res> {
  __$ExceptionResponseCopyWithImpl(
      _ExceptionResponse _value, $Res Function(_ExceptionResponse) _then)
      : super(_value, (v) => _then(v as _ExceptionResponse));

  @override
  _ExceptionResponse get _value => super._value as _ExceptionResponse;

  @override
  $Res call({
    Object e = freezed,
  }) {
    return _then(_ExceptionResponse(
      e == freezed ? _value.e : e as ApiException,
    ));
  }
}

/// @nodoc
class _$_ExceptionResponse implements _ExceptionResponse {
  const _$_ExceptionResponse(this.e) : assert(e != null);

  @override
  final ApiException e;

  @override
  String toString() {
    return 'ControlResultsResponse.exceptionResponse(e: $e)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ExceptionResponse &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(e);

  @JsonKey(ignore: true)
  @override
  _$ExceptionResponseCopyWith<_ExceptionResponse> get copyWith =>
      __$ExceptionResponseCopyWithImpl<_ExceptionResponse>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required
        TResult controlResultsListResponse(
            List<ControlResultSearchResult> results),
    @required TResult emptyResultsListResponse(),
    @required TResult exceptionResponse(ApiException e),
  }) {
    assert(controlResultsListResponse != null);
    assert(emptyResultsListResponse != null);
    assert(exceptionResponse != null);
    return exceptionResponse(e);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult controlResultsListResponse(List<ControlResultSearchResult> results),
    TResult emptyResultsListResponse(),
    TResult exceptionResponse(ApiException e),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exceptionResponse != null) {
      return exceptionResponse(e);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult controlResultsListResponse(_ControlResultsList value),
    @required TResult emptyResultsListResponse(_EmptyControlResultsList value),
    @required TResult exceptionResponse(_ExceptionResponse value),
  }) {
    assert(controlResultsListResponse != null);
    assert(emptyResultsListResponse != null);
    assert(exceptionResponse != null);
    return exceptionResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult controlResultsListResponse(_ControlResultsList value),
    TResult emptyResultsListResponse(_EmptyControlResultsList value),
    TResult exceptionResponse(_ExceptionResponse value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (exceptionResponse != null) {
      return exceptionResponse(this);
    }
    return orElse();
  }
}

abstract class _ExceptionResponse implements ControlResultsResponse {
  const factory _ExceptionResponse(ApiException e) = _$_ExceptionResponse;

  ApiException get e;
  @JsonKey(ignore: true)
  _$ExceptionResponseCopyWith<_ExceptionResponse> get copyWith;
}
