import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_object_filters/event.dart';
import 'package:inspector/blocs/control_object_filters/state.dart';

class ControlObjectFiltersBloc
    extends Bloc<ControlObjectFiltersBlocEvent, ControlObjectFilters> {
  ControlObjectFiltersBloc({ControlObjectFilters state})
      : super(state ?? ControlObjectFilters());

  @override
  Stream<ControlObjectFilters> mapEventToState(
          ControlObjectFiltersBlocEvent event) =>
      event.map(
        changeDatesEvent: _changeDatesEvent,
        changeViolationExistsEvent: _changeViolationExistsEvent,
        changeViolationNumEvent: _changeViolationNumEvent,
        changeViolationTypeEvent: _changeViolationTypeEvent,
        changeViolationKindEvent: _changeViolationKindEvent,
        changeSourceEvent: _changeSourceEvent, 
        changeViolationStatusEvent: _changeViolationStatusEvent,
      );


  Stream<ControlObjectFilters> _changeDatesEvent(ChangeDatesEvent event) async* {
    yield state.copyWith(
      surveyDateFrom: event.startDate,
      surveyDateTo: event.finishDate,
    );
  }

  Stream<ControlObjectFilters> _changeViolationExistsEvent(ChangeViolationExistsEvent event) async* {
    yield state.copyWith(
      violationExists: event.result,
    );
  }

  Stream<ControlObjectFilters> _changeViolationNumEvent(ChangeViolationNumEvent event) async* {
    yield state.copyWith(
      violationNum: event.value,
    );
  }

  Stream<ControlObjectFilters> _changeViolationTypeEvent(ChangeViolationTypeEvent event) async* {
    yield state.copyWith(
      dcViolationType: event.type,
    );
  }

  

  Stream<ControlObjectFilters> _changeViolationKindEvent(ChangeViolationKindEvent event) async* {
    yield state.copyWith(
      dcViolationKind: event.kind,
    );
  }

  Stream<ControlObjectFilters> _changeSourceEvent(ChangeSourceEvent event) async* {
    yield state.copyWith(
      source: event.source,
    );
  }

  Stream<ControlObjectFilters> _changeViolationStatusEvent(ChangeViolationStatusEvent event) async* {
    yield state.copyWith(
      violationStatus: event.violationStatus,
    );
  }
}
