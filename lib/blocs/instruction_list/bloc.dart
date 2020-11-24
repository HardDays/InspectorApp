import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:intl/intl.dart';


class InstructionListBloc extends Bloc<InstructionListBlocEvent, InstructionListBlocState> {
  InstructionListBloc(initialState) : super(initialState);

  final _service = InstructionsService();
  final _persistanceService = ObjectDbPersistanceService();

  @override
  Stream<InstructionListBlocState> mapEventToState(InstructionListBlocEvent event) async* {
    if (event is LoadEvent || event is RefreshEvent) {
      await _service.init();

      final sort = await _service.sort();
      final filters = await _service.filters();

      try {
        final date = await _service.date();

        final reload = event is RefreshEvent || (date == null) || (date != null && DateTime.now().difference(date).inMinutes > 10);
        final result = await _service.all(reload: reload);       
        final data = _processData(sort, filters, result);
        
        if (reload) {
          final date = await _service.date();
          yield NewDataState(data, date, sort, filters);
        } else {
          yield DataState(data, date, sort, filters);
        }
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
    } else if (event is LoadSilentEvent) {
      final online = await _persistanceService.getDataSendingState();
      final sort = await _service.sort();
      final filters = await _service.filters();

      final result = await _service.all(reload: online);       
      final data = _processData(sort, filters, result);
      final date = await _service.date();
      yield DataState(data, date, sort, filters);
    }
  } 

  List<Instruction> _processData(String sort, InstructionFilters filters, List<Instruction> data) {
    List<Instruction> result = data;
    if (filters != null) {
      if (filters.instructionStatus != null) {
        result = result.where((e) => e.instructionStatus.id == filters.instructionStatus).toList();
      }
      if (filters.instructionNum != null) {
        result = result.where((e) => e.instructionNum.toLowerCase().startsWith(filters.instructionNum.toLowerCase())).toList();
      }
      if (filters.checkDates != null) {
        final dates = filters.checkDates;
        if (dates.length == 1) {
          final date = DateFormat('yyyy-MM-dd').format(dates.first);
          result = result.where((e) => DateFormat('yyyy-MM-dd').format(e.checkDate) == date).toList();
        } else if (dates.length == 2) {
          result = result.where((e) => dates[0].isBefore(e.checkDate) && dates[1].isAfter(e.checkDate)).toList();
        }
      }
       if (filters.instructionDates != null) {
        final dates = filters.instructionDates;
        if (dates.length == 1) {
          final date = DateFormat('yyyy-MM-dd').format(dates.first);
          result = result.where((e) => DateFormat('yyyy-MM-dd').format(e.instructionDate) == date).toList();
        } else if (dates.length == 2) {
          result = result.where((e) => dates[0].isBefore(e.instructionDate) && dates[1].isAfter(e.instructionDate)).toList();
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
      result.sort((c1, c2) => c1.instructionStatus.id.compareTo(c2.instructionStatus.id));
    }
    return result;
  }
}
