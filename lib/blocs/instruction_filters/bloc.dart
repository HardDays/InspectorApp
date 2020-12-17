import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
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
    } else if (event is SetCheckDatesEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        InstructionFilters(
          checkDates: event.dates,
          instructionDates: state.filters.instructionDates,
          instructionStatus: state.filters.instructionStatus,
          instructionNum: state.filters.instructionNum,
        )
      );
    } else if (event is SetInstructionDatesEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        InstructionFilters(
          checkDates: state.filters.checkDates,
          instructionDates: event.dates,
          instructionStatus: state.filters.instructionStatus,
          instructionNum: state.filters.instructionNum,
        )
      );
    } else if (event is SetInstructionStatusEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        InstructionFilters(
          checkDates: state.filters.checkDates,
          instructionDates: state.filters.instructionDates,
          instructionStatus: event.instructionStatus == 0 ? null :  event.instructionStatus,
          instructionNum: state.filters.instructionNum,
        )
      );
    } else if (event is SetInstructionNumEvent) {
      yield InstructionFiltersBlocState(
        state.statuses,
        InstructionFilters(
          checkDates: state.filters.checkDates,
          instructionDates: state.filters.instructionDates,
          instructionStatus: state.filters.instructionStatus,
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
