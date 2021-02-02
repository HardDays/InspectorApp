abstract class NotificationBlocState {
  String get message;
}

class SnackBarNotificationState extends NotificationBlocState {
  final String message;

  SnackBarNotificationState(this.message);
}

class EmptyNotificationState extends NotificationBlocState {
  @override
  String get message => '';
}