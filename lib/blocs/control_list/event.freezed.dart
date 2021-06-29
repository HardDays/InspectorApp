// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ControlListBlocEventTearOff {
  const _$ControlListBlocEventTearOff();

// ignore: unused_element
  LoadControlListEvent loadControlListEvent() {
    return const LoadControlListEvent();
  }

// ignore: unused_element
  CantWorkInThisModeEvent cantWorkInThisModeEvent() {
    return const CantWorkInThisModeEvent();
  }

// ignore: unused_element
  RefreshControlListEvent refreshControlListEvent() {
    return const RefreshControlListEvent();
  }

// ignore: unused_element
  LoadNextPageControlListEvent loadNextPageControlListEvent() {
    return const LoadNextPageControlListEvent();
  }

// ignore: unused_element
  ChangeFiltersEvent changeFilters(ControlFiltersBlocState state) {
    return ChangeFiltersEvent(
      state,
    );
  }

// ignore: unused_element
  ChangeSortEvent changeSort(String state) {
    return ChangeSortEvent(
      state,
    );
  }

// ignore: unused_element
  OpenInMapEvent openInMapEvent(ControlObject object) {
    return OpenInMapEvent(
      object,
    );
  }

// ignore: unused_element
  SelectControlObjectEvent selectControlObject(ControlObject object) {
    return SelectControlObjectEvent(
      object,
    );
  }

// ignore: unused_element
  RegisterSearchResultEvent registerSearchResultEvent(ControlObject object,
      {DCViolation violation}) {
    return RegisterSearchResultEvent(
      object,
      violation: violation,
    );
  }

// ignore: unused_element
  RemoveViolationEvent removeViolationEvent(
      ControlObject object, int violationId) {
    return RemoveViolationEvent(
      object,
      violationId,
    );
  }

// ignore: unused_element
  RegisterPerformControlEvent registerPerformControlEvent(
      PerformControl performControl,
      ControlObject object,
      int controlResultId) {
    return RegisterPerformControlEvent(
      performControl,
      object,
      controlResultId,
    );
  }

// ignore: unused_element
  RemovePerformControlEvent removePerformControlEvent(
      PerformControl performControl,
      ControlObject object,
      int controlResultId) {
    return RemovePerformControlEvent(
      performControl,
      object,
      controlResultId,
    );
  }

// ignore: unused_element
  UpdatePerformControlEvent updatePerformControlEvent(
      PerformControl performControl,
      ControlObject object,
      int controlResultId) {
    return UpdatePerformControlEvent(
      performControl,
      object,
      controlResultId,
    );
  }

// ignore: unused_element
  UpdateResolveDateEvent updateResolveDateEvent(
      ControlObject object,
      int controlResultId,
      DateTime resolveDate,
      ViolationExtensionReason reason,
      String comments) {
    return UpdateResolveDateEvent(
      object,
      controlResultId,
      resolveDate,
      reason,
      comments,
    );
  }

// ignore: unused_element
  ChangeShowMapEvent changeShowMapEvent(bool showMap) {
    return ChangeShowMapEvent(
      showMap,
    );
  }

// ignore: unused_element
  UpdateControlResultEvent updateControlResultEvent(
      ControlObject object,
      int controlResultId,
      DCViolation violation,
      ControlObjectBloc controlObjectBloc,
      bool sentToCafap) {
    return UpdateControlResultEvent(
      object,
      controlResultId,
      violation,
      controlObjectBloc,
      sentToCafap,
    );
  }

// ignore: unused_element
  ChangeNetworkStatusEvent changeNetworkStatusEvent(
      NetworkStatus networkStatus) {
    return ChangeNetworkStatusEvent(
      networkStatus,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ControlListBlocEvent = _$ControlListBlocEventTearOff();

/// @nodoc
mixin _$ControlListBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ControlListBlocEventCopyWith<$Res> {
  factory $ControlListBlocEventCopyWith(ControlListBlocEvent value,
          $Res Function(ControlListBlocEvent) then) =
      _$ControlListBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControlListBlocEventCopyWithImpl<$Res>
    implements $ControlListBlocEventCopyWith<$Res> {
  _$ControlListBlocEventCopyWithImpl(this._value, this._then);

  final ControlListBlocEvent _value;
  // ignore: unused_field
  final $Res Function(ControlListBlocEvent) _then;
}

/// @nodoc
abstract class $LoadControlListEventCopyWith<$Res> {
  factory $LoadControlListEventCopyWith(LoadControlListEvent value,
          $Res Function(LoadControlListEvent) then) =
      _$LoadControlListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadControlListEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $LoadControlListEventCopyWith<$Res> {
  _$LoadControlListEventCopyWithImpl(
      LoadControlListEvent _value, $Res Function(LoadControlListEvent) _then)
      : super(_value, (v) => _then(v as LoadControlListEvent));

  @override
  LoadControlListEvent get _value => super._value as LoadControlListEvent;
}

/// @nodoc
class _$LoadControlListEvent implements LoadControlListEvent {
  const _$LoadControlListEvent();

  @override
  String toString() {
    return 'ControlListBlocEvent.loadControlListEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadControlListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return loadControlListEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadControlListEvent != null) {
      return loadControlListEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return loadControlListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadControlListEvent != null) {
      return loadControlListEvent(this);
    }
    return orElse();
  }
}

abstract class LoadControlListEvent implements ControlListBlocEvent {
  const factory LoadControlListEvent() = _$LoadControlListEvent;
}

/// @nodoc
abstract class $CantWorkInThisModeEventCopyWith<$Res> {
  factory $CantWorkInThisModeEventCopyWith(CantWorkInThisModeEvent value,
          $Res Function(CantWorkInThisModeEvent) then) =
      _$CantWorkInThisModeEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CantWorkInThisModeEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $CantWorkInThisModeEventCopyWith<$Res> {
  _$CantWorkInThisModeEventCopyWithImpl(CantWorkInThisModeEvent _value,
      $Res Function(CantWorkInThisModeEvent) _then)
      : super(_value, (v) => _then(v as CantWorkInThisModeEvent));

  @override
  CantWorkInThisModeEvent get _value => super._value as CantWorkInThisModeEvent;
}

/// @nodoc
class _$CantWorkInThisModeEvent implements CantWorkInThisModeEvent {
  const _$CantWorkInThisModeEvent();

  @override
  String toString() {
    return 'ControlListBlocEvent.cantWorkInThisModeEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CantWorkInThisModeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return cantWorkInThisModeEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cantWorkInThisModeEvent != null) {
      return cantWorkInThisModeEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return cantWorkInThisModeEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (cantWorkInThisModeEvent != null) {
      return cantWorkInThisModeEvent(this);
    }
    return orElse();
  }
}

abstract class CantWorkInThisModeEvent implements ControlListBlocEvent {
  const factory CantWorkInThisModeEvent() = _$CantWorkInThisModeEvent;
}

/// @nodoc
abstract class $RefreshControlListEventCopyWith<$Res> {
  factory $RefreshControlListEventCopyWith(RefreshControlListEvent value,
          $Res Function(RefreshControlListEvent) then) =
      _$RefreshControlListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RefreshControlListEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $RefreshControlListEventCopyWith<$Res> {
  _$RefreshControlListEventCopyWithImpl(RefreshControlListEvent _value,
      $Res Function(RefreshControlListEvent) _then)
      : super(_value, (v) => _then(v as RefreshControlListEvent));

  @override
  RefreshControlListEvent get _value => super._value as RefreshControlListEvent;
}

/// @nodoc
class _$RefreshControlListEvent implements RefreshControlListEvent {
  const _$RefreshControlListEvent();

  @override
  String toString() {
    return 'ControlListBlocEvent.refreshControlListEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RefreshControlListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return refreshControlListEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (refreshControlListEvent != null) {
      return refreshControlListEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return refreshControlListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (refreshControlListEvent != null) {
      return refreshControlListEvent(this);
    }
    return orElse();
  }
}

abstract class RefreshControlListEvent implements ControlListBlocEvent {
  const factory RefreshControlListEvent() = _$RefreshControlListEvent;
}

/// @nodoc
abstract class $LoadNextPageControlListEventCopyWith<$Res> {
  factory $LoadNextPageControlListEventCopyWith(
          LoadNextPageControlListEvent value,
          $Res Function(LoadNextPageControlListEvent) then) =
      _$LoadNextPageControlListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadNextPageControlListEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $LoadNextPageControlListEventCopyWith<$Res> {
  _$LoadNextPageControlListEventCopyWithImpl(
      LoadNextPageControlListEvent _value,
      $Res Function(LoadNextPageControlListEvent) _then)
      : super(_value, (v) => _then(v as LoadNextPageControlListEvent));

  @override
  LoadNextPageControlListEvent get _value =>
      super._value as LoadNextPageControlListEvent;
}

/// @nodoc
class _$LoadNextPageControlListEvent implements LoadNextPageControlListEvent {
  const _$LoadNextPageControlListEvent();

  @override
  String toString() {
    return 'ControlListBlocEvent.loadNextPageControlListEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadNextPageControlListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return loadNextPageControlListEvent();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadNextPageControlListEvent != null) {
      return loadNextPageControlListEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return loadNextPageControlListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loadNextPageControlListEvent != null) {
      return loadNextPageControlListEvent(this);
    }
    return orElse();
  }
}

abstract class LoadNextPageControlListEvent implements ControlListBlocEvent {
  const factory LoadNextPageControlListEvent() = _$LoadNextPageControlListEvent;
}

/// @nodoc
abstract class $ChangeFiltersEventCopyWith<$Res> {
  factory $ChangeFiltersEventCopyWith(
          ChangeFiltersEvent value, $Res Function(ChangeFiltersEvent) then) =
      _$ChangeFiltersEventCopyWithImpl<$Res>;
  $Res call({ControlFiltersBlocState state});

  $ControlFiltersBlocStateCopyWith<$Res> get state;
}

/// @nodoc
class _$ChangeFiltersEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $ChangeFiltersEventCopyWith<$Res> {
  _$ChangeFiltersEventCopyWithImpl(
      ChangeFiltersEvent _value, $Res Function(ChangeFiltersEvent) _then)
      : super(_value, (v) => _then(v as ChangeFiltersEvent));

  @override
  ChangeFiltersEvent get _value => super._value as ChangeFiltersEvent;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(ChangeFiltersEvent(
      state == freezed ? _value.state : state as ControlFiltersBlocState,
    ));
  }

  @override
  $ControlFiltersBlocStateCopyWith<$Res> get state {
    if (_value.state == null) {
      return null;
    }
    return $ControlFiltersBlocStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
class _$ChangeFiltersEvent implements ChangeFiltersEvent {
  const _$ChangeFiltersEvent(this.state) : assert(state != null);

  @override
  final ControlFiltersBlocState state;

  @override
  String toString() {
    return 'ControlListBlocEvent.changeFilters(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeFiltersEvent &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  $ChangeFiltersEventCopyWith<ChangeFiltersEvent> get copyWith =>
      _$ChangeFiltersEventCopyWithImpl<ChangeFiltersEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeFilters(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeFilters != null) {
      return changeFilters(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeFilters != null) {
      return changeFilters(this);
    }
    return orElse();
  }
}

abstract class ChangeFiltersEvent implements ControlListBlocEvent {
  const factory ChangeFiltersEvent(ControlFiltersBlocState state) =
      _$ChangeFiltersEvent;

  ControlFiltersBlocState get state;
  @JsonKey(ignore: true)
  $ChangeFiltersEventCopyWith<ChangeFiltersEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeSortEventCopyWith<$Res> {
  factory $ChangeSortEventCopyWith(
          ChangeSortEvent value, $Res Function(ChangeSortEvent) then) =
      _$ChangeSortEventCopyWithImpl<$Res>;
  $Res call({String state});
}

/// @nodoc
class _$ChangeSortEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $ChangeSortEventCopyWith<$Res> {
  _$ChangeSortEventCopyWithImpl(
      ChangeSortEvent _value, $Res Function(ChangeSortEvent) _then)
      : super(_value, (v) => _then(v as ChangeSortEvent));

  @override
  ChangeSortEvent get _value => super._value as ChangeSortEvent;

  @override
  $Res call({
    Object state = freezed,
  }) {
    return _then(ChangeSortEvent(
      state == freezed ? _value.state : state as String,
    ));
  }
}

/// @nodoc
class _$ChangeSortEvent implements ChangeSortEvent {
  const _$ChangeSortEvent(this.state) : assert(state != null);

  @override
  final String state;

  @override
  String toString() {
    return 'ControlListBlocEvent.changeSort(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeSortEvent &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  $ChangeSortEventCopyWith<ChangeSortEvent> get copyWith =>
      _$ChangeSortEventCopyWithImpl<ChangeSortEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeSort(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeSort != null) {
      return changeSort(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeSort(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeSort != null) {
      return changeSort(this);
    }
    return orElse();
  }
}

abstract class ChangeSortEvent implements ControlListBlocEvent {
  const factory ChangeSortEvent(String state) = _$ChangeSortEvent;

  String get state;
  @JsonKey(ignore: true)
  $ChangeSortEventCopyWith<ChangeSortEvent> get copyWith;
}

/// @nodoc
abstract class $OpenInMapEventCopyWith<$Res> {
  factory $OpenInMapEventCopyWith(
          OpenInMapEvent value, $Res Function(OpenInMapEvent) then) =
      _$OpenInMapEventCopyWithImpl<$Res>;
  $Res call({ControlObject object});

  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$OpenInMapEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $OpenInMapEventCopyWith<$Res> {
  _$OpenInMapEventCopyWithImpl(
      OpenInMapEvent _value, $Res Function(OpenInMapEvent) _then)
      : super(_value, (v) => _then(v as OpenInMapEvent));

  @override
  OpenInMapEvent get _value => super._value as OpenInMapEvent;

  @override
  $Res call({
    Object object = freezed,
  }) {
    return _then(OpenInMapEvent(
      object == freezed ? _value.object : object as ControlObject,
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
class _$OpenInMapEvent implements OpenInMapEvent {
  const _$OpenInMapEvent(this.object) : assert(object != null);

  @override
  final ControlObject object;

  @override
  String toString() {
    return 'ControlListBlocEvent.openInMapEvent(object: $object)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OpenInMapEvent &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(object);

  @JsonKey(ignore: true)
  @override
  $OpenInMapEventCopyWith<OpenInMapEvent> get copyWith =>
      _$OpenInMapEventCopyWithImpl<OpenInMapEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return openInMapEvent(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (openInMapEvent != null) {
      return openInMapEvent(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return openInMapEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (openInMapEvent != null) {
      return openInMapEvent(this);
    }
    return orElse();
  }
}

abstract class OpenInMapEvent implements ControlListBlocEvent {
  const factory OpenInMapEvent(ControlObject object) = _$OpenInMapEvent;

  ControlObject get object;
  @JsonKey(ignore: true)
  $OpenInMapEventCopyWith<OpenInMapEvent> get copyWith;
}

/// @nodoc
abstract class $SelectControlObjectEventCopyWith<$Res> {
  factory $SelectControlObjectEventCopyWith(SelectControlObjectEvent value,
          $Res Function(SelectControlObjectEvent) then) =
      _$SelectControlObjectEventCopyWithImpl<$Res>;
  $Res call({ControlObject object});

  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$SelectControlObjectEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $SelectControlObjectEventCopyWith<$Res> {
  _$SelectControlObjectEventCopyWithImpl(SelectControlObjectEvent _value,
      $Res Function(SelectControlObjectEvent) _then)
      : super(_value, (v) => _then(v as SelectControlObjectEvent));

  @override
  SelectControlObjectEvent get _value =>
      super._value as SelectControlObjectEvent;

  @override
  $Res call({
    Object object = freezed,
  }) {
    return _then(SelectControlObjectEvent(
      object == freezed ? _value.object : object as ControlObject,
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
class _$SelectControlObjectEvent implements SelectControlObjectEvent {
  const _$SelectControlObjectEvent(this.object) : assert(object != null);

  @override
  final ControlObject object;

  @override
  String toString() {
    return 'ControlListBlocEvent.selectControlObject(object: $object)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectControlObjectEvent &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(object);

  @JsonKey(ignore: true)
  @override
  $SelectControlObjectEventCopyWith<SelectControlObjectEvent> get copyWith =>
      _$SelectControlObjectEventCopyWithImpl<SelectControlObjectEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return selectControlObject(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectControlObject != null) {
      return selectControlObject(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return selectControlObject(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (selectControlObject != null) {
      return selectControlObject(this);
    }
    return orElse();
  }
}

abstract class SelectControlObjectEvent implements ControlListBlocEvent {
  const factory SelectControlObjectEvent(ControlObject object) =
      _$SelectControlObjectEvent;

  ControlObject get object;
  @JsonKey(ignore: true)
  $SelectControlObjectEventCopyWith<SelectControlObjectEvent> get copyWith;
}

/// @nodoc
abstract class $RegisterSearchResultEventCopyWith<$Res> {
  factory $RegisterSearchResultEventCopyWith(RegisterSearchResultEvent value,
          $Res Function(RegisterSearchResultEvent) then) =
      _$RegisterSearchResultEventCopyWithImpl<$Res>;
  $Res call({ControlObject object, DCViolation violation});

  $ControlObjectCopyWith<$Res> get object;
  $DCViolationCopyWith<$Res> get violation;
}

/// @nodoc
class _$RegisterSearchResultEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $RegisterSearchResultEventCopyWith<$Res> {
  _$RegisterSearchResultEventCopyWithImpl(RegisterSearchResultEvent _value,
      $Res Function(RegisterSearchResultEvent) _then)
      : super(_value, (v) => _then(v as RegisterSearchResultEvent));

  @override
  RegisterSearchResultEvent get _value =>
      super._value as RegisterSearchResultEvent;

  @override
  $Res call({
    Object object = freezed,
    Object violation = freezed,
  }) {
    return _then(RegisterSearchResultEvent(
      object == freezed ? _value.object : object as ControlObject,
      violation:
          violation == freezed ? _value.violation : violation as DCViolation,
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
  $DCViolationCopyWith<$Res> get violation {
    if (_value.violation == null) {
      return null;
    }
    return $DCViolationCopyWith<$Res>(_value.violation, (value) {
      return _then(_value.copyWith(violation: value));
    });
  }
}

/// @nodoc
class _$RegisterSearchResultEvent implements RegisterSearchResultEvent {
  const _$RegisterSearchResultEvent(this.object, {this.violation})
      : assert(object != null);

  @override
  final ControlObject object;
  @override
  final DCViolation violation;

  @override
  String toString() {
    return 'ControlListBlocEvent.registerSearchResultEvent(object: $object, violation: $violation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterSearchResultEvent &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.violation, violation) ||
                const DeepCollectionEquality()
                    .equals(other.violation, violation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(violation);

  @JsonKey(ignore: true)
  @override
  $RegisterSearchResultEventCopyWith<RegisterSearchResultEvent> get copyWith =>
      _$RegisterSearchResultEventCopyWithImpl<RegisterSearchResultEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return registerSearchResultEvent(object, violation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerSearchResultEvent != null) {
      return registerSearchResultEvent(object, violation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return registerSearchResultEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerSearchResultEvent != null) {
      return registerSearchResultEvent(this);
    }
    return orElse();
  }
}

abstract class RegisterSearchResultEvent implements ControlListBlocEvent {
  const factory RegisterSearchResultEvent(ControlObject object,
      {DCViolation violation}) = _$RegisterSearchResultEvent;

  ControlObject get object;
  DCViolation get violation;
  @JsonKey(ignore: true)
  $RegisterSearchResultEventCopyWith<RegisterSearchResultEvent> get copyWith;
}

/// @nodoc
abstract class $RemoveViolationEventCopyWith<$Res> {
  factory $RemoveViolationEventCopyWith(RemoveViolationEvent value,
          $Res Function(RemoveViolationEvent) then) =
      _$RemoveViolationEventCopyWithImpl<$Res>;
  $Res call({ControlObject object, int violationId});

  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$RemoveViolationEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $RemoveViolationEventCopyWith<$Res> {
  _$RemoveViolationEventCopyWithImpl(
      RemoveViolationEvent _value, $Res Function(RemoveViolationEvent) _then)
      : super(_value, (v) => _then(v as RemoveViolationEvent));

  @override
  RemoveViolationEvent get _value => super._value as RemoveViolationEvent;

  @override
  $Res call({
    Object object = freezed,
    Object violationId = freezed,
  }) {
    return _then(RemoveViolationEvent(
      object == freezed ? _value.object : object as ControlObject,
      violationId == freezed ? _value.violationId : violationId as int,
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
class _$RemoveViolationEvent implements RemoveViolationEvent {
  const _$RemoveViolationEvent(this.object, this.violationId)
      : assert(object != null),
        assert(violationId != null);

  @override
  final ControlObject object;
  @override
  final int violationId;

  @override
  String toString() {
    return 'ControlListBlocEvent.removeViolationEvent(object: $object, violationId: $violationId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RemoveViolationEvent &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.violationId, violationId) ||
                const DeepCollectionEquality()
                    .equals(other.violationId, violationId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(violationId);

  @JsonKey(ignore: true)
  @override
  $RemoveViolationEventCopyWith<RemoveViolationEvent> get copyWith =>
      _$RemoveViolationEventCopyWithImpl<RemoveViolationEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return removeViolationEvent(object, violationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removeViolationEvent != null) {
      return removeViolationEvent(object, violationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return removeViolationEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removeViolationEvent != null) {
      return removeViolationEvent(this);
    }
    return orElse();
  }
}

abstract class RemoveViolationEvent implements ControlListBlocEvent {
  const factory RemoveViolationEvent(ControlObject object, int violationId) =
      _$RemoveViolationEvent;

  ControlObject get object;
  int get violationId;
  @JsonKey(ignore: true)
  $RemoveViolationEventCopyWith<RemoveViolationEvent> get copyWith;
}

/// @nodoc
abstract class $RegisterPerformControlEventCopyWith<$Res> {
  factory $RegisterPerformControlEventCopyWith(
          RegisterPerformControlEvent value,
          $Res Function(RegisterPerformControlEvent) then) =
      _$RegisterPerformControlEventCopyWithImpl<$Res>;
  $Res call(
      {PerformControl performControl,
      ControlObject object,
      int controlResultId});

  $PerformControlCopyWith<$Res> get performControl;
  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$RegisterPerformControlEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $RegisterPerformControlEventCopyWith<$Res> {
  _$RegisterPerformControlEventCopyWithImpl(RegisterPerformControlEvent _value,
      $Res Function(RegisterPerformControlEvent) _then)
      : super(_value, (v) => _then(v as RegisterPerformControlEvent));

  @override
  RegisterPerformControlEvent get _value =>
      super._value as RegisterPerformControlEvent;

  @override
  $Res call({
    Object performControl = freezed,
    Object object = freezed,
    Object controlResultId = freezed,
  }) {
    return _then(RegisterPerformControlEvent(
      performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
      object == freezed ? _value.object : object as ControlObject,
      controlResultId == freezed
          ? _value.controlResultId
          : controlResultId as int,
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
class _$RegisterPerformControlEvent implements RegisterPerformControlEvent {
  const _$RegisterPerformControlEvent(
      this.performControl, this.object, this.controlResultId)
      : assert(performControl != null),
        assert(object != null),
        assert(controlResultId != null);

  @override
  final PerformControl performControl;
  @override
  final ControlObject object;
  @override
  final int controlResultId;

  @override
  String toString() {
    return 'ControlListBlocEvent.registerPerformControlEvent(performControl: $performControl, object: $object, controlResultId: $controlResultId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RegisterPerformControlEvent &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)) &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlResultId, controlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.controlResultId, controlResultId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(performControl) ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlResultId);

  @JsonKey(ignore: true)
  @override
  $RegisterPerformControlEventCopyWith<RegisterPerformControlEvent>
      get copyWith => _$RegisterPerformControlEventCopyWithImpl<
          RegisterPerformControlEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return registerPerformControlEvent(performControl, object, controlResultId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerPerformControlEvent != null) {
      return registerPerformControlEvent(
          performControl, object, controlResultId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return registerPerformControlEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (registerPerformControlEvent != null) {
      return registerPerformControlEvent(this);
    }
    return orElse();
  }
}

abstract class RegisterPerformControlEvent implements ControlListBlocEvent {
  const factory RegisterPerformControlEvent(
      PerformControl performControl,
      ControlObject object,
      int controlResultId) = _$RegisterPerformControlEvent;

  PerformControl get performControl;
  ControlObject get object;
  int get controlResultId;
  @JsonKey(ignore: true)
  $RegisterPerformControlEventCopyWith<RegisterPerformControlEvent>
      get copyWith;
}

/// @nodoc
abstract class $RemovePerformControlEventCopyWith<$Res> {
  factory $RemovePerformControlEventCopyWith(RemovePerformControlEvent value,
          $Res Function(RemovePerformControlEvent) then) =
      _$RemovePerformControlEventCopyWithImpl<$Res>;
  $Res call(
      {PerformControl performControl,
      ControlObject object,
      int controlResultId});

  $PerformControlCopyWith<$Res> get performControl;
  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$RemovePerformControlEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
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
    Object object = freezed,
    Object controlResultId = freezed,
  }) {
    return _then(RemovePerformControlEvent(
      performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
      object == freezed ? _value.object : object as ControlObject,
      controlResultId == freezed
          ? _value.controlResultId
          : controlResultId as int,
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
class _$RemovePerformControlEvent implements RemovePerformControlEvent {
  const _$RemovePerformControlEvent(
      this.performControl, this.object, this.controlResultId)
      : assert(performControl != null),
        assert(object != null),
        assert(controlResultId != null);

  @override
  final PerformControl performControl;
  @override
  final ControlObject object;
  @override
  final int controlResultId;

  @override
  String toString() {
    return 'ControlListBlocEvent.removePerformControlEvent(performControl: $performControl, object: $object, controlResultId: $controlResultId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RemovePerformControlEvent &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)) &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlResultId, controlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.controlResultId, controlResultId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(performControl) ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlResultId);

  @JsonKey(ignore: true)
  @override
  $RemovePerformControlEventCopyWith<RemovePerformControlEvent> get copyWith =>
      _$RemovePerformControlEventCopyWithImpl<RemovePerformControlEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return removePerformControlEvent(performControl, object, controlResultId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removePerformControlEvent != null) {
      return removePerformControlEvent(performControl, object, controlResultId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return removePerformControlEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (removePerformControlEvent != null) {
      return removePerformControlEvent(this);
    }
    return orElse();
  }
}

abstract class RemovePerformControlEvent implements ControlListBlocEvent {
  const factory RemovePerformControlEvent(PerformControl performControl,
      ControlObject object, int controlResultId) = _$RemovePerformControlEvent;

  PerformControl get performControl;
  ControlObject get object;
  int get controlResultId;
  @JsonKey(ignore: true)
  $RemovePerformControlEventCopyWith<RemovePerformControlEvent> get copyWith;
}

/// @nodoc
abstract class $UpdatePerformControlEventCopyWith<$Res> {
  factory $UpdatePerformControlEventCopyWith(UpdatePerformControlEvent value,
          $Res Function(UpdatePerformControlEvent) then) =
      _$UpdatePerformControlEventCopyWithImpl<$Res>;
  $Res call(
      {PerformControl performControl,
      ControlObject object,
      int controlResultId});

  $PerformControlCopyWith<$Res> get performControl;
  $ControlObjectCopyWith<$Res> get object;
}

/// @nodoc
class _$UpdatePerformControlEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $UpdatePerformControlEventCopyWith<$Res> {
  _$UpdatePerformControlEventCopyWithImpl(UpdatePerformControlEvent _value,
      $Res Function(UpdatePerformControlEvent) _then)
      : super(_value, (v) => _then(v as UpdatePerformControlEvent));

  @override
  UpdatePerformControlEvent get _value =>
      super._value as UpdatePerformControlEvent;

  @override
  $Res call({
    Object performControl = freezed,
    Object object = freezed,
    Object controlResultId = freezed,
  }) {
    return _then(UpdatePerformControlEvent(
      performControl == freezed
          ? _value.performControl
          : performControl as PerformControl,
      object == freezed ? _value.object : object as ControlObject,
      controlResultId == freezed
          ? _value.controlResultId
          : controlResultId as int,
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
class _$UpdatePerformControlEvent implements UpdatePerformControlEvent {
  const _$UpdatePerformControlEvent(
      this.performControl, this.object, this.controlResultId)
      : assert(performControl != null),
        assert(object != null),
        assert(controlResultId != null);

  @override
  final PerformControl performControl;
  @override
  final ControlObject object;
  @override
  final int controlResultId;

  @override
  String toString() {
    return 'ControlListBlocEvent.updatePerformControlEvent(performControl: $performControl, object: $object, controlResultId: $controlResultId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdatePerformControlEvent &&
            (identical(other.performControl, performControl) ||
                const DeepCollectionEquality()
                    .equals(other.performControl, performControl)) &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlResultId, controlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.controlResultId, controlResultId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(performControl) ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlResultId);

  @JsonKey(ignore: true)
  @override
  $UpdatePerformControlEventCopyWith<UpdatePerformControlEvent> get copyWith =>
      _$UpdatePerformControlEventCopyWithImpl<UpdatePerformControlEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return updatePerformControlEvent(performControl, object, controlResultId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updatePerformControlEvent != null) {
      return updatePerformControlEvent(performControl, object, controlResultId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return updatePerformControlEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updatePerformControlEvent != null) {
      return updatePerformControlEvent(this);
    }
    return orElse();
  }
}

abstract class UpdatePerformControlEvent implements ControlListBlocEvent {
  const factory UpdatePerformControlEvent(PerformControl performControl,
      ControlObject object, int controlResultId) = _$UpdatePerformControlEvent;

  PerformControl get performControl;
  ControlObject get object;
  int get controlResultId;
  @JsonKey(ignore: true)
  $UpdatePerformControlEventCopyWith<UpdatePerformControlEvent> get copyWith;
}

/// @nodoc
abstract class $UpdateResolveDateEventCopyWith<$Res> {
  factory $UpdateResolveDateEventCopyWith(UpdateResolveDateEvent value,
          $Res Function(UpdateResolveDateEvent) then) =
      _$UpdateResolveDateEventCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object,
      int controlResultId,
      DateTime resolveDate,
      ViolationExtensionReason reason,
      String comments});

  $ControlObjectCopyWith<$Res> get object;
  $ViolationExtensionReasonCopyWith<$Res> get reason;
}

/// @nodoc
class _$UpdateResolveDateEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $UpdateResolveDateEventCopyWith<$Res> {
  _$UpdateResolveDateEventCopyWithImpl(UpdateResolveDateEvent _value,
      $Res Function(UpdateResolveDateEvent) _then)
      : super(_value, (v) => _then(v as UpdateResolveDateEvent));

  @override
  UpdateResolveDateEvent get _value => super._value as UpdateResolveDateEvent;

  @override
  $Res call({
    Object object = freezed,
    Object controlResultId = freezed,
    Object resolveDate = freezed,
    Object reason = freezed,
    Object comments = freezed,
  }) {
    return _then(UpdateResolveDateEvent(
      object == freezed ? _value.object : object as ControlObject,
      controlResultId == freezed
          ? _value.controlResultId
          : controlResultId as int,
      resolveDate == freezed ? _value.resolveDate : resolveDate as DateTime,
      reason == freezed ? _value.reason : reason as ViolationExtensionReason,
      comments == freezed ? _value.comments : comments as String,
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
  $ViolationExtensionReasonCopyWith<$Res> get reason {
    if (_value.reason == null) {
      return null;
    }
    return $ViolationExtensionReasonCopyWith<$Res>(_value.reason, (value) {
      return _then(_value.copyWith(reason: value));
    });
  }
}

/// @nodoc
class _$UpdateResolveDateEvent implements UpdateResolveDateEvent {
  const _$UpdateResolveDateEvent(this.object, this.controlResultId,
      this.resolveDate, this.reason, this.comments)
      : assert(object != null),
        assert(controlResultId != null),
        assert(resolveDate != null),
        assert(reason != null),
        assert(comments != null);

  @override
  final ControlObject object;
  @override
  final int controlResultId;
  @override
  final DateTime resolveDate;
  @override
  final ViolationExtensionReason reason;
  @override
  final String comments;

  @override
  String toString() {
    return 'ControlListBlocEvent.updateResolveDateEvent(object: $object, controlResultId: $controlResultId, resolveDate: $resolveDate, reason: $reason, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateResolveDateEvent &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlResultId, controlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.controlResultId, controlResultId)) &&
            (identical(other.resolveDate, resolveDate) ||
                const DeepCollectionEquality()
                    .equals(other.resolveDate, resolveDate)) &&
            (identical(other.reason, reason) ||
                const DeepCollectionEquality().equals(other.reason, reason)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlResultId) ^
      const DeepCollectionEquality().hash(resolveDate) ^
      const DeepCollectionEquality().hash(reason) ^
      const DeepCollectionEquality().hash(comments);

  @JsonKey(ignore: true)
  @override
  $UpdateResolveDateEventCopyWith<UpdateResolveDateEvent> get copyWith =>
      _$UpdateResolveDateEventCopyWithImpl<UpdateResolveDateEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return updateResolveDateEvent(
        object, controlResultId, resolveDate, reason, comments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateResolveDateEvent != null) {
      return updateResolveDateEvent(
          object, controlResultId, resolveDate, reason, comments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return updateResolveDateEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateResolveDateEvent != null) {
      return updateResolveDateEvent(this);
    }
    return orElse();
  }
}

abstract class UpdateResolveDateEvent implements ControlListBlocEvent {
  const factory UpdateResolveDateEvent(
      ControlObject object,
      int controlResultId,
      DateTime resolveDate,
      ViolationExtensionReason reason,
      String comments) = _$UpdateResolveDateEvent;

  ControlObject get object;
  int get controlResultId;
  DateTime get resolveDate;
  ViolationExtensionReason get reason;
  String get comments;
  @JsonKey(ignore: true)
  $UpdateResolveDateEventCopyWith<UpdateResolveDateEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeShowMapEventCopyWith<$Res> {
  factory $ChangeShowMapEventCopyWith(
          ChangeShowMapEvent value, $Res Function(ChangeShowMapEvent) then) =
      _$ChangeShowMapEventCopyWithImpl<$Res>;
  $Res call({bool showMap});
}

/// @nodoc
class _$ChangeShowMapEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $ChangeShowMapEventCopyWith<$Res> {
  _$ChangeShowMapEventCopyWithImpl(
      ChangeShowMapEvent _value, $Res Function(ChangeShowMapEvent) _then)
      : super(_value, (v) => _then(v as ChangeShowMapEvent));

  @override
  ChangeShowMapEvent get _value => super._value as ChangeShowMapEvent;

  @override
  $Res call({
    Object showMap = freezed,
  }) {
    return _then(ChangeShowMapEvent(
      showMap == freezed ? _value.showMap : showMap as bool,
    ));
  }
}

/// @nodoc
class _$ChangeShowMapEvent implements ChangeShowMapEvent {
  const _$ChangeShowMapEvent(this.showMap) : assert(showMap != null);

  @override
  final bool showMap;

  @override
  String toString() {
    return 'ControlListBlocEvent.changeShowMapEvent(showMap: $showMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeShowMapEvent &&
            (identical(other.showMap, showMap) ||
                const DeepCollectionEquality().equals(other.showMap, showMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(showMap);

  @JsonKey(ignore: true)
  @override
  $ChangeShowMapEventCopyWith<ChangeShowMapEvent> get copyWith =>
      _$ChangeShowMapEventCopyWithImpl<ChangeShowMapEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeShowMapEvent(showMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeShowMapEvent != null) {
      return changeShowMapEvent(showMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeShowMapEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeShowMapEvent != null) {
      return changeShowMapEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeShowMapEvent implements ControlListBlocEvent {
  const factory ChangeShowMapEvent(bool showMap) = _$ChangeShowMapEvent;

  bool get showMap;
  @JsonKey(ignore: true)
  $ChangeShowMapEventCopyWith<ChangeShowMapEvent> get copyWith;
}

/// @nodoc
abstract class $UpdateControlResultEventCopyWith<$Res> {
  factory $UpdateControlResultEventCopyWith(UpdateControlResultEvent value,
          $Res Function(UpdateControlResultEvent) then) =
      _$UpdateControlResultEventCopyWithImpl<$Res>;
  $Res call(
      {ControlObject object,
      int controlResultId,
      DCViolation violation,
      ControlObjectBloc controlObjectBloc,
      bool sentToCafap});

  $ControlObjectCopyWith<$Res> get object;
  $DCViolationCopyWith<$Res> get violation;
}

/// @nodoc
class _$UpdateControlResultEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $UpdateControlResultEventCopyWith<$Res> {
  _$UpdateControlResultEventCopyWithImpl(UpdateControlResultEvent _value,
      $Res Function(UpdateControlResultEvent) _then)
      : super(_value, (v) => _then(v as UpdateControlResultEvent));

  @override
  UpdateControlResultEvent get _value =>
      super._value as UpdateControlResultEvent;

  @override
  $Res call({
    Object object = freezed,
    Object controlResultId = freezed,
    Object violation = freezed,
    Object controlObjectBloc = freezed,
    Object sentToCafap = freezed,
  }) {
    return _then(UpdateControlResultEvent(
      object == freezed ? _value.object : object as ControlObject,
      controlResultId == freezed
          ? _value.controlResultId
          : controlResultId as int,
      violation == freezed ? _value.violation : violation as DCViolation,
      controlObjectBloc == freezed
          ? _value.controlObjectBloc
          : controlObjectBloc as ControlObjectBloc,
      sentToCafap == freezed ? _value.sentToCafap : sentToCafap as bool,
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
  $DCViolationCopyWith<$Res> get violation {
    if (_value.violation == null) {
      return null;
    }
    return $DCViolationCopyWith<$Res>(_value.violation, (value) {
      return _then(_value.copyWith(violation: value));
    });
  }
}

/// @nodoc
class _$UpdateControlResultEvent implements UpdateControlResultEvent {
  const _$UpdateControlResultEvent(this.object, this.controlResultId,
      this.violation, this.controlObjectBloc, this.sentToCafap)
      : assert(object != null),
        assert(controlResultId != null),
        assert(violation != null),
        assert(controlObjectBloc != null),
        assert(sentToCafap != null);

  @override
  final ControlObject object;
  @override
  final int controlResultId;
  @override
  final DCViolation violation;
  @override
  final ControlObjectBloc controlObjectBloc;
  @override
  final bool sentToCafap;

  @override
  String toString() {
    return 'ControlListBlocEvent.updateControlResultEvent(object: $object, controlResultId: $controlResultId, violation: $violation, controlObjectBloc: $controlObjectBloc, sentToCafap: $sentToCafap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UpdateControlResultEvent &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)) &&
            (identical(other.controlResultId, controlResultId) ||
                const DeepCollectionEquality()
                    .equals(other.controlResultId, controlResultId)) &&
            (identical(other.violation, violation) ||
                const DeepCollectionEquality()
                    .equals(other.violation, violation)) &&
            (identical(other.controlObjectBloc, controlObjectBloc) ||
                const DeepCollectionEquality()
                    .equals(other.controlObjectBloc, controlObjectBloc)) &&
            (identical(other.sentToCafap, sentToCafap) ||
                const DeepCollectionEquality()
                    .equals(other.sentToCafap, sentToCafap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(object) ^
      const DeepCollectionEquality().hash(controlResultId) ^
      const DeepCollectionEquality().hash(violation) ^
      const DeepCollectionEquality().hash(controlObjectBloc) ^
      const DeepCollectionEquality().hash(sentToCafap);

  @JsonKey(ignore: true)
  @override
  $UpdateControlResultEventCopyWith<UpdateControlResultEvent> get copyWith =>
      _$UpdateControlResultEventCopyWithImpl<UpdateControlResultEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return updateControlResultEvent(
        object, controlResultId, violation, controlObjectBloc, sentToCafap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateControlResultEvent != null) {
      return updateControlResultEvent(
          object, controlResultId, violation, controlObjectBloc, sentToCafap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return updateControlResultEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (updateControlResultEvent != null) {
      return updateControlResultEvent(this);
    }
    return orElse();
  }
}

abstract class UpdateControlResultEvent implements ControlListBlocEvent {
  const factory UpdateControlResultEvent(
      ControlObject object,
      int controlResultId,
      DCViolation violation,
      ControlObjectBloc controlObjectBloc,
      bool sentToCafap) = _$UpdateControlResultEvent;

  ControlObject get object;
  int get controlResultId;
  DCViolation get violation;
  ControlObjectBloc get controlObjectBloc;
  bool get sentToCafap;
  @JsonKey(ignore: true)
  $UpdateControlResultEventCopyWith<UpdateControlResultEvent> get copyWith;
}

/// @nodoc
abstract class $ChangeNetworkStatusEventCopyWith<$Res> {
  factory $ChangeNetworkStatusEventCopyWith(ChangeNetworkStatusEvent value,
          $Res Function(ChangeNetworkStatusEvent) then) =
      _$ChangeNetworkStatusEventCopyWithImpl<$Res>;
  $Res call({NetworkStatus networkStatus});
}

/// @nodoc
class _$ChangeNetworkStatusEventCopyWithImpl<$Res>
    extends _$ControlListBlocEventCopyWithImpl<$Res>
    implements $ChangeNetworkStatusEventCopyWith<$Res> {
  _$ChangeNetworkStatusEventCopyWithImpl(ChangeNetworkStatusEvent _value,
      $Res Function(ChangeNetworkStatusEvent) _then)
      : super(_value, (v) => _then(v as ChangeNetworkStatusEvent));

  @override
  ChangeNetworkStatusEvent get _value =>
      super._value as ChangeNetworkStatusEvent;

  @override
  $Res call({
    Object networkStatus = freezed,
  }) {
    return _then(ChangeNetworkStatusEvent(
      networkStatus == freezed
          ? _value.networkStatus
          : networkStatus as NetworkStatus,
    ));
  }
}

/// @nodoc
class _$ChangeNetworkStatusEvent implements ChangeNetworkStatusEvent {
  const _$ChangeNetworkStatusEvent(this.networkStatus)
      : assert(networkStatus != null);

  @override
  final NetworkStatus networkStatus;

  @override
  String toString() {
    return 'ControlListBlocEvent.changeNetworkStatusEvent(networkStatus: $networkStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChangeNetworkStatusEvent &&
            (identical(other.networkStatus, networkStatus) ||
                const DeepCollectionEquality()
                    .equals(other.networkStatus, networkStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(networkStatus);

  @JsonKey(ignore: true)
  @override
  $ChangeNetworkStatusEventCopyWith<ChangeNetworkStatusEvent> get copyWith =>
      _$ChangeNetworkStatusEventCopyWithImpl<ChangeNetworkStatusEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loadControlListEvent(),
    @required TResult cantWorkInThisModeEvent(),
    @required TResult refreshControlListEvent(),
    @required TResult loadNextPageControlListEvent(),
    @required TResult changeFilters(ControlFiltersBlocState state),
    @required TResult changeSort(String state),
    @required TResult openInMapEvent(ControlObject object),
    @required TResult selectControlObject(ControlObject object),
    @required
        TResult registerSearchResultEvent(
            ControlObject object, DCViolation violation),
    @required
        TResult removeViolationEvent(ControlObject object, int violationId),
    @required
        TResult registerPerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult removePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updatePerformControlEvent(PerformControl performControl,
            ControlObject object, int controlResultId),
    @required
        TResult updateResolveDateEvent(
            ControlObject object,
            int controlResultId,
            DateTime resolveDate,
            ViolationExtensionReason reason,
            String comments),
    @required TResult changeShowMapEvent(bool showMap),
    @required
        TResult updateControlResultEvent(
            ControlObject object,
            int controlResultId,
            DCViolation violation,
            ControlObjectBloc controlObjectBloc,
            bool sentToCafap),
    @required TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeNetworkStatusEvent(networkStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loadControlListEvent(),
    TResult cantWorkInThisModeEvent(),
    TResult refreshControlListEvent(),
    TResult loadNextPageControlListEvent(),
    TResult changeFilters(ControlFiltersBlocState state),
    TResult changeSort(String state),
    TResult openInMapEvent(ControlObject object),
    TResult selectControlObject(ControlObject object),
    TResult registerSearchResultEvent(
        ControlObject object, DCViolation violation),
    TResult removeViolationEvent(ControlObject object, int violationId),
    TResult registerPerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult removePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updatePerformControlEvent(PerformControl performControl,
        ControlObject object, int controlResultId),
    TResult updateResolveDateEvent(ControlObject object, int controlResultId,
        DateTime resolveDate, ViolationExtensionReason reason, String comments),
    TResult changeShowMapEvent(bool showMap),
    TResult updateControlResultEvent(
        ControlObject object,
        int controlResultId,
        DCViolation violation,
        ControlObjectBloc controlObjectBloc,
        bool sentToCafap),
    TResult changeNetworkStatusEvent(NetworkStatus networkStatus),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeNetworkStatusEvent != null) {
      return changeNetworkStatusEvent(networkStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loadControlListEvent(LoadControlListEvent value),
    @required TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    @required TResult refreshControlListEvent(RefreshControlListEvent value),
    @required
        TResult loadNextPageControlListEvent(
            LoadNextPageControlListEvent value),
    @required TResult changeFilters(ChangeFiltersEvent value),
    @required TResult changeSort(ChangeSortEvent value),
    @required TResult openInMapEvent(OpenInMapEvent value),
    @required TResult selectControlObject(SelectControlObjectEvent value),
    @required
        TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    @required TResult removeViolationEvent(RemoveViolationEvent value),
    @required
        TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    @required
        TResult removePerformControlEvent(RemovePerformControlEvent value),
    @required
        TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    @required TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    @required TResult changeShowMapEvent(ChangeShowMapEvent value),
    @required TResult updateControlResultEvent(UpdateControlResultEvent value),
    @required TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
  }) {
    assert(loadControlListEvent != null);
    assert(cantWorkInThisModeEvent != null);
    assert(refreshControlListEvent != null);
    assert(loadNextPageControlListEvent != null);
    assert(changeFilters != null);
    assert(changeSort != null);
    assert(openInMapEvent != null);
    assert(selectControlObject != null);
    assert(registerSearchResultEvent != null);
    assert(removeViolationEvent != null);
    assert(registerPerformControlEvent != null);
    assert(removePerformControlEvent != null);
    assert(updatePerformControlEvent != null);
    assert(updateResolveDateEvent != null);
    assert(changeShowMapEvent != null);
    assert(updateControlResultEvent != null);
    assert(changeNetworkStatusEvent != null);
    return changeNetworkStatusEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loadControlListEvent(LoadControlListEvent value),
    TResult cantWorkInThisModeEvent(CantWorkInThisModeEvent value),
    TResult refreshControlListEvent(RefreshControlListEvent value),
    TResult loadNextPageControlListEvent(LoadNextPageControlListEvent value),
    TResult changeFilters(ChangeFiltersEvent value),
    TResult changeSort(ChangeSortEvent value),
    TResult openInMapEvent(OpenInMapEvent value),
    TResult selectControlObject(SelectControlObjectEvent value),
    TResult registerSearchResultEvent(RegisterSearchResultEvent value),
    TResult removeViolationEvent(RemoveViolationEvent value),
    TResult registerPerformControlEvent(RegisterPerformControlEvent value),
    TResult removePerformControlEvent(RemovePerformControlEvent value),
    TResult updatePerformControlEvent(UpdatePerformControlEvent value),
    TResult updateResolveDateEvent(UpdateResolveDateEvent value),
    TResult changeShowMapEvent(ChangeShowMapEvent value),
    TResult updateControlResultEvent(UpdateControlResultEvent value),
    TResult changeNetworkStatusEvent(ChangeNetworkStatusEvent value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (changeNetworkStatusEvent != null) {
      return changeNetworkStatusEvent(this);
    }
    return orElse();
  }
}

abstract class ChangeNetworkStatusEvent implements ControlListBlocEvent {
  const factory ChangeNetworkStatusEvent(NetworkStatus networkStatus) =
      _$ChangeNetworkStatusEvent;

  NetworkStatus get networkStatus;
  @JsonKey(ignore: true)
  $ChangeNetworkStatusEventCopyWith<ChangeNetworkStatusEvent> get copyWith;
}
