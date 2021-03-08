import 'package:freezed_annotation/freezed_annotation.dart';

part 'state.freezed.dart';

@freezed
abstract class BackgroundLoadingBlocState with _$BackgroundLoadingBlocState {
  const factory BackgroundLoadingBlocState.emptyQueueState() = _EmptyQueueState;
  const factory BackgroundLoadingBlocState.haveStatusState(String status) = _HaveStatusState;
}