import 'dart:async';

import 'package:async/async.dart';
import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/background_loading/event.dart';
import 'package:inspector/blocs/background_loading/state.dart';

class BackgroundLoadingBloc
    extends Bloc<BackgroundLoadingBlocEvent, BackgroundLoadingBlocState> {
  BackgroundLoadingBloc()
      : super(BackgroundLoadingBlocState.emptyQueueState()) {
    _streamSubscription = _queue.stream.listen((event) async {
      print('OK');
      _cancelableOperation = event;
      await event.value;
      add(BackgroundLoadingBlocEvent.finishEvent());
    });
  }

  StreamController<CancelableOperation> _queue = StreamController();
  StreamSubscription<CancelableOperation> _streamSubscription;

  CancelableOperation _cancelableOperation = null;

  @override
  Stream<BackgroundLoadingBlocState> mapEventToState(
          BackgroundLoadingBlocEvent event) =>
      event.map(
        addOperationToQueueEvent: _onAddOperationToQueueEvent,
        updateStatusTextEvent: _onUpdateStatusTextEvent,
        cancelEvent: _onCancelEvent,
        finishEvent: _onFinishEvent,
      );

  Stream<BackgroundLoadingBlocState> _onAddOperationToQueueEvent(
      AddOperationToQueueEvent event) async* {
    _queue.add(event.operation);
  }

  Stream<BackgroundLoadingBlocState> _onUpdateStatusTextEvent(
      UpdateStatusTextEvent event) async* {
    if(!_cancelableOperation.isCanceled) {
      yield (BackgroundLoadingBlocState.haveStatusState(event.text));
    }
  }

  Stream<BackgroundLoadingBlocState> _onFinishEvent(FinishEvent event) async* {
    yield (BackgroundLoadingBlocState.emptyQueueState());
  }

  Stream<BackgroundLoadingBlocState> _onCancelEvent(CancelEvent event) async* {
    await _cancelableOperation.cancel();
    yield (BackgroundLoadingBlocState.emptyQueueState());
  }

  @override
  Future<void> close() async {
    _cancelableOperation?.cancel();
    _streamSubscription.cancel();
    super.close();
  }
}
