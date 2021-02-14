import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';

@freezed
abstract class NotificationBlocEvent with _$NotificationBlocEvent {
  const factory NotificationBlocEvent.snackBarNotificationEvent(String message) = SnackBarNotificationEvent;
  const factory NotificationBlocEvent.okDialogNotificationEvent(String message) = OkDialogNotificationEvent;
}