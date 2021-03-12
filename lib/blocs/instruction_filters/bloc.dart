import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/instruction_filters/events.dart';
import 'package:inspector/blocs/instruction_filters/states.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/sqlite/sqlite_dictionary_service.dart';

class InstructionFiltersBloc extends Bloc<InstructionFiltersBlocEvent, InstructionFiltersBlocState> {
  
  final _dictionaryService = DictionaryService();
  final _service = InstructionsService();

  InstructionFiltersBloc(initialState) : super(initialState);

  @override
  Stream<InstructionFiltersBlocState> mapEventToState(InstructionFiltersBlocEvent event) async* {
    if (event is LoadEvent) {
      await _dictionaryService.load(keys: [DictionaryNames.instructionStatuses]);
      final statuses = await _dictionaryService.getInstructionStatuses();
      statuses.insert(0, InstructionStatus(id: null, name: 'Все'));
      yield InstructionFiltersBlocState(statuses, state.filters);
    } else if (event is SetCheckDateFromEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        state.filters.copyWith(
          checkDateFrom: event.date,
          checkDateTo: state.filters.checkDateTo,
          instructionDateFrom: state.filters.instructionDateFrom,
          instructionDateTo: state.filters.instructionDateTo
        )
      );
    } else if (event is SetCheckDateToEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        state.filters.copyWith(
          checkDateTo: event.date,
          checkDateFrom: state.filters.checkDateFrom,
          instructionDateFrom: state.filters.instructionDateFrom,
          instructionDateTo: state.filters.instructionDateTo
        )
      );
    } else if (event is SetInstructionDateFromEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        state.filters.copyWith(
          instructionDateFrom: event.date,
          instructionDateTo: state.filters.instructionDateTo,
          checkDateTo: state.filters.checkDateTo,
          checkDateFrom: state.filters.checkDateFrom,
        )
      );
    } else if (event is SetInstructionDateToEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        state.filters.copyWith(
          instructionDateTo: event.date,
          instructionDateFrom: state.filters.instructionDateFrom,
          checkDateTo: state.filters.checkDateTo,
          checkDateFrom: state.filters.checkDateFrom,
        )
      );
    } else if (event is SetInstructionStatusEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        state.filters.copyWith(
          instructionStatus: event.instructionStatus == 0 ? null :  event.instructionStatus,
        )
      );
    } else if (event is SetInstructionNumEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        state.filters.copyWith(
          instructionNum: event.instructionNum,
        ),
      );
    } else if (event is SaveEvent) {
      await _service.saveFilters(event.filters);
      yield InstructionFiltersBlocState(
        state.statuses,
        event.filters
      );
    }
  } 
}
