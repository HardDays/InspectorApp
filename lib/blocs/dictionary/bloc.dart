import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/background_loading/bloc.dart';
import 'package:inspector/blocs/background_loading/event.dart';
import 'package:inspector/blocs/dictionary/event.dart';
import 'package:inspector/blocs/dictionary/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:wakelock/wakelock.dart';

class DictionaryBloc extends Bloc<DictionaryBlocEvent, DictionaryBlocState> {
  DictionaryBloc({
    this.dictionaryService,
    this.notificationBloc,
    this.backgroundLoadingBloc,
  }) : super(DictionaryBlocState());

  final DictionaryService dictionaryService;
  final NotificationBloc notificationBloc;
  final BackgroundLoadingBloc backgroundLoadingBloc;

  ApiService _apiService = ApiService();
  PersistanceService _persistanceService = ObjectDbPersistanceService();

  @override
  Stream<DictionaryBlocState> mapEventToState(DictionaryBlocEvent event) =>
      event.map(
        initEvent: (event) async* {
          await _apiService.getApiParameters().then((params) async {
            await _persistanceService.setUseWebVersionOfVk(
                params.nativeDepControl == 0 ? true : false);
            await _persistanceService.saveDcWebUrl(params.depControlUrl);
          });
          backgroundLoadingBloc.add(
            BackgroundLoadingBlocEvent.addOperationToQueueEvent(
              _cancelableOperation,
            ),
          );
        },
      );

  CancelableOperation get _cancelableOperation =>
      CancelableOperation.fromFuture(
        Future(() async {
          BackgroundLoadingBlocEvent.updateStatusTextEvent(
              'Проверяется информация о словарях');
          if (!(await dictionaryService.isLoaded())) {
            Wakelock.enable();
            await dictionaryService.load(
              notifier: (name, count) {
                backgroundLoadingBloc.add(
                  BackgroundLoadingBlocEvent.updateStatusTextEvent(
                    'Загружается $name - $count',
                  ),
                );
              },
            );
            if (await dictionaryService.isLoaded()) {
              notificationBloc
                  .add(SnackBarNotificationEvent('Словари загружены'));
            } else {
              notificationBloc
                  .add(SnackBarNotificationEvent('Загрузка отменена'));
            }
          }
          Wakelock.disable();
        }),
        onCancel: () {
          dictionaryService.canceled = true;
        },
      );
}
