import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class ControlBackgroundServiceBlocState with _$ControlBackgroundServiceBlocState {
  const factory ControlBackgroundServiceBlocState.emptyState() = EmptyState;
  const factory ControlBackgroundServiceBlocState.notLoaded() = NotLoadedState;
  const factory ControlBackgroundServiceBlocState.loaded(DateTime lastUpdatedDate) = LoadedState;
}