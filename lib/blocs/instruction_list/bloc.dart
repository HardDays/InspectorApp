import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/api/instruction_service.dart';
import 'package:inspector/services/objectdb/instruction_service.dart';
import 'package:inspector/services/objectdb/persistance_service.dart';


class InstructionListBloc extends Bloc<InstructionListBlocEvent, InstructionListBlocState> {
  InstructionListBloc(initialState) : super(initialState);

  final _apiService = ApiInstructionService();
  final _dbService = ObjectDBInstructionService();
  final _persistanceService = ObjectDBPersistanceService();

  @override
  Stream<InstructionListBlocState> mapEventToState(InstructionListBlocEvent event) async* {
    if (event is LoadEvent || event is RefreshEvent) {
      await _apiService.init();
      await _dbService.init();
      await _persistanceService.init();

      final sort = await _persistanceService.getInstructionsSort();

      try {
        final apiResult = await _apiService.getAll();
        
        await _persistanceService.saveInstructionsDate();
        final newDate = await _persistanceService.getInstructionsDate();
        
        _sortData(sort, apiResult);

        yield NewDataState(apiResult, newDate, sort);

        await _dbService.save(apiResult);
      } catch (ex) {
        try {
          final dbResult = await _dbService.getAll();
          final oldDate = await _persistanceService.getInstructionsDate();
          
          _sortData(sort, dbResult);
          
          yield OldDataState(dbResult, oldDate, sort);
        } catch (ex) {
          
        }
      }
    } else if (event is SortEvent) {
      _persistanceService.saveInstructionSort(event.sort);
      if (state is DataState) {
        final currentState = state as DataState;
        _sortData(event.sort, currentState.instructions);
        yield DataState(
          date: state.date,
          sort: event.sort,
          instructions: currentState.instructions
        );
      }
    }
  } 

  void _sortData(String sort, List<Instruction> data) {
    if (sort == InstructionSortStrings.instructionNum) {
      data.sort((c1, c2) => c1.instructionNum.compareTo(c2.instructionNum));
    } else if (sort == InstructionSortStrings.checkDate) {
      data.sort((c1, c2) => c1.checkDate.compareTo(c2.checkDate));
    } else if (sort == InstructionSortStrings.instructionDate) {
      data.sort((c1, c2) => c1.instructionDate.compareTo(c2.instructionDate));
    } else {
      data.sort((c1, c2) => InstructionStatusStrings.all.indexOf(c1.instructionStatus.name).compareTo(InstructionStatusStrings.all.indexOf(c2.instructionStatus.name)));
    }
  }
}
