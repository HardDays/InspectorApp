import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/dictionary/event.dart';
import 'package:inspector/blocs/dictionary/state.dart';
import 'package:inspector/services/dictionary_service.dart';

class DictionaryBloc extends Bloc<DictionaryBlocEvent, DictionaryBlocState> {
  DictionaryBloc(initialState) : super(initialState);

  CancelableOperation operation;

  @override
  Stream<DictionaryBlocState> mapEventToState(DictionaryBlocEvent event) async* {
    if (event is LoadEvent) {
      final service = DictionaryService();
      
      operation = CancelableOperation.fromFuture(
        service.load(
          notifier: (name, count) {
            add(UpdateEvent(name, count));
          },
        ),
        onCancel: () {
          service.canceled = true;
        },
      );
      operation.value.whenComplete(() {
        add(LoadedEvent());
      });
    } else if (event is UpdateEvent) {
      yield LoadingState(event.name, event.count);
    } else if (event is LoadedEvent) {
      yield LoadedState();
    } else if (event is CancelEvent) {
      await operation?.cancel();
      yield LoadedState();
    }
  } 

  @override
  Future<void> close() async {
    operation?.cancel();
    super.close();
  }
}