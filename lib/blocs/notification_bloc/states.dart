import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

@freezed
abstract class NotificationBlocState with _$NotificationBlocState {
  const factory NotificationBlocState.emptyNotificationState() = EmptyNotificationState;
  const factory NotificationBlocState.snackBarNotificationState(String message) = SnackBarNotificationState;
  const factory NotificationBlocState.okDialogNotificationState(String message) = OkDialogNotificationState;
}