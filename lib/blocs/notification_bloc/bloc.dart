import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/blocs/notification_bloc/states.dart';

typedef Stream<S> Dispatcher<E, S>(E event);

class NotificationBloc
    extends Bloc<NotificationBlocEvent, NotificationBlocState> {
  NotificationBloc() : super(EmptyNotificationState()) {
    _dispatchersMap = {
      SnackBarNotificationEvent: (event) =>
          _dispatchSnackBarNotificationEvent(event),
    };
  }

  Map<Type, Dispatcher<NotificationBlocEvent, NotificationBlocState>>
      _dispatchersMap;

  @override
  Stream<NotificationBlocState> mapEventToState(NotificationBlocEvent event) async* {
    try {
      yield* _dispatchersMap[event.runtimeType](event);
    } catch (e) {
      print(e);
    }
  }

  Stream<SnackBarNotificationState> _dispatchSnackBarNotificationEvent(
      SnackBarNotificationEvent event) async* {
        yield(SnackBarNotificationState(event.message));
      }
}
