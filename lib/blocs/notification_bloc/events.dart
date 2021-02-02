abstract class NotificationBlocEvent {
  String get message;
}

class SnackBarNotificationEvent extends NotificationBlocEvent {
  final String message;

  SnackBarNotificationEvent(this.message);
}