import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/objectdb/objectdb_instructions_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:intl/intl.dart';


class InstructionListBloc extends Bloc<InstructionListBlocEvent, InstructionListBlocState> {
  InstructionListBloc(initialState) : super(initialState);

  // final _apiService = ApiService();
  // final _dbService = ObjectDBInstructionsService();
  final _service = InstructionsService();

  @override
  Stream<InstructionListBlocState> mapEventToState(InstructionListBlocEvent event) async* {
    if (event is LoadEvent || event is RefreshEvent) {
      await _service.init();

      final sort = await _service.sort();
      final filters = await _service.filters();

      try {
        final result = await _service.all(reload: true);       
        final date = await _service.date();
        
        final data = _processData(sort, filters, result);
        yield NewDataState(data, date, sort, filters);
      } on ApiException catch (ex) {
        try {
          final result = await _service.all();
          final date = await _service.date();
          
          final data = _processData(sort, filters, result);
          yield OldDataState(data, date, sort, filters, ex);
        } catch (ex) {
          print(ex);
        }
      } catch (ex) {
        print(ex);
      }
    } else if (event is SortEvent) {
      _service.saveSort(event.sort);

      if (state is DataState) {
        List<Instruction> data = await _service.all();
        data = _processData(event.sort, state.filters, data);
        yield DataState(data, state.date, event.sort, state.filters);
      }
    } else if (event is FilterEvent) {
      _service.saveFilters(event.filters);

      if (state is DataState) {
        List<Instruction> data = await _service.all();
        data = _processData(state.sort, event.filters, data);
        yield DataState(data, state.date, state.sort, event.filters);
      }
    } else if (event is FlushEvent) {
      if (state is DataState) {
        yield DataState((state as DataState).instructions, state.date, state.sort, state.filters);
      }
    }
  } 

  List<Instruction> _processData(String sort, InstructionFilters filters, List<Instruction> data) {
    List<Instruction> result = data;
    if (filters != null) {
      if (filters.instructionStatus != null) {
        result = result.where((e) => e.instructionStatus.name == filters.instructionStatus).toList();
      }
      if (filters.instructionNum != null) {
        result = result.where((e) => e.instructionNum.toLowerCase().startsWith(filters.instructionNum.toLowerCase())).toList();
      }
      if (filters.checkDates != null) {
        final dates = filters.checkDates.map((e) => DateFormat('yyyy-MM-dd').format(e)).toList();
        if (dates.length == 1) {
          result = result.where((e) => e.checkDate == dates.first).toList();
        } else if (dates.length == 2) {
          result = result.where((e) => e.checkDate.compareTo(dates[0]) >= 0 && e.checkDate.compareTo(dates[1]) <= 0).toList();
        }
      }
       if (filters.instructionDates != null) {
        final dates = filters.instructionDates.map((e) => DateFormat('yyyy-MM-dd').format(e)).toList();
        if (dates.length == 1) {
          result = result.where((e) => e.instructionDate == dates.first).toList();
        } else if (dates.length == 2) {
          result = result.where((e) => e.instructionDate.compareTo(dates[0]) >= 0 && e.instructionDate.compareTo(dates[1]) <= 0).toList();
        }
      }
    }
    if (sort == InstructionSortStrings.instructionNum) {
      result.sort((c1, c2) => c1.instructionNum.compareTo(c2.instructionNum));
    } else if (sort == InstructionSortStrings.checkDate) {
      result.sort((c1, c2) => c1.checkDate.compareTo(c2.checkDate));
    } else if (sort == InstructionSortStrings.instructionDate) {
      result.sort((c1, c2) => c1.instructionDate.compareTo(c2.instructionDate));
    } else {
      result.sort((c1, c2) => InstructionStatusStrings.all.indexOf(c1.instructionStatus.name).compareTo(InstructionStatusStrings.all.indexOf(c2.instructionStatus.name)));
    }
    return result;
  }
}
