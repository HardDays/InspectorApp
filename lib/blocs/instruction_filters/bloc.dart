import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/instruction_filters/events.dart';
import 'package:inspector/blocs/instruction_filters/states.dart';
import 'package:inspector/model/instruction.dart';

class InstructionFiltersBloc extends Bloc<InstructionFiltersBlocEvent, InstructionFiltersBlocState> {
  
  InstructionFiltersBloc(initialState) : super(initialState);

  @override
  Stream<InstructionFiltersBlocState> mapEventToState(InstructionFiltersBlocEvent event) async* {
    if (event is ChangeCheckDatesEvent) {
      yield InstructionFiltersBlocState(
        InstructionFilters(
          checkDates: event.dates,
          instructionDates: state.filters.instructionDates,
          instructionStatus: state.filters.instructionStatus,
          instructionNum: state.filters.instructionNum,
        )
      );
    } else if (event is ChangeInstructionDatesEvent) {
      yield InstructionFiltersBlocState(
        InstructionFilters(
          checkDates: state.filters.checkDates,
          instructionDates: event.dates,
          instructionStatus: state.filters.instructionStatus,
          instructionNum: state.filters.instructionNum,
        )
      );
    } else if (event is ChangeInstructionStatusEvent) {
      yield InstructionFiltersBlocState(
        InstructionFilters(
          checkDates: state.filters.checkDates,
          instructionDates: state.filters.instructionDates,
          instructionStatus: event.instructionStatus,
          instructionNum: state.filters.instructionNum,
        )
      );
    } else if (event is ChangeInstructionNumEvent) {
      yield InstructionFiltersBlocState(
        InstructionFilters(
          checkDates: state.filters.checkDates,
          instructionDates: state.filters.instructionDates,
          instructionStatus: state.filters.instructionStatus,
          instructionNum: event.instructionNum,
        ),
      );
    }
  } 
}
