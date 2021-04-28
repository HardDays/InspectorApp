import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/blocs/notification_bloc/states.dart';

class NotificationBloc
    extends Bloc<NotificationBlocEvent, NotificationBlocState> {
  NotificationBloc() : super(EmptyNotificationState()) {
    print('n');
  }

  Stream<NotificationBlocState> _onSnackBarNotificationEvent(
      SnackBarNotificationEvent event) async* {
    yield (SnackBarNotificationState(event.message));
  }

  Stream<NotificationBlocState> _onOkDialogNotificationEvent(
      OkDialogNotificationEvent event) async* {
    yield (OkDialogNotificationState(event.message));
  }

  @override
  Stream<NotificationBlocState> mapEventToState(NotificationBlocEvent event) =>
      event.map(
        okDialogNotificationEvent: _onOkDialogNotificationEvent,
        snackBarNotificationEvent: _onSnackBarNotificationEvent,
      );
}
