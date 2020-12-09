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
      final order = await _service.sortOrder();
      final filters = await _service.filters();

      try {
        final date = await _service.date();

        final reload = event is RefreshEvent || (date == null) || (date != null && DateTime.now().difference(date).inMinutes > 10);
        final result = await _service.all(reload: reload);       
        final data = _processData(sort, order, filters, result);
        
        if (reload) {
          final date = await _service.date();
          yield NewDataState(data, date, sort, order, filters);
        } else {
          yield DataState(data, date, sort, order, filters);
        }
      } on ApiException catch (ex) {
        try {
          final result = await _service.all();
          final date = await _service.date();
          
          final data = _processData(sort, order, filters, result);
          yield OldDataState(data, date, sort, order, filters, ex);
        } catch (ex) {
          print(ex);
        }
      } catch (ex) {
        print(ex);
      }
    } else if (event is SortEvent) {
      await _service.saveSort(event.sort);
      String order = SortOrder.asc;
      if (event.sort == state.sort) {
        if (state.order == SortOrder.asc) {
          order = SortOrder.desc;
        } else {
          order = SortOrder.asc;
        }
      }
      await _service.saveSortOrder(order);
      if (state is DataState) {
        List<Instruction> data = await _service.all();
        data = _processData(event.sort, order, state.filters, data);
        yield DataState(data, state.date, event.sort, order, state.filters);
      }
    } else if (event is FilterEvent) {
      _service.saveFilters(event.filters);

      if (state is DataState) {
        List<Instruction> data = await _service.all();
        data = _processData(state.sort, state.order, event.filters, data);
        yield DataState(data, state.date, state.sort, state.order, event.filters);
      }
    } else if (event is FlushEvent) {
      if (state is DataState) {
        yield DataState((state as DataState).instructions, state.date, state.sort, state.order, state.filters);
      }
    } else if (event is LoadSilentEvent) {
      final online = await _persistanceService.getDataSendingState();
      final sort = await _service.sort();
      final order = await _service.sortOrder();
      final filters = await _service.filters();
      try {
        final result = await _service.all(reload: online);       
        final data = _processData(sort, order, filters, result);
        final date = await _service.date();
        yield DataState(data, date, sort, order, filters);
      } catch (ex) {
        
      }
    }
  } 

  List<Instruction> _processData(String sort, String order, InstructionFilters filters, List<Instruction> data) {
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
          final date = DateTime(dates[0].year, dates[0].month, dates[0].day);
          result = result.where((e) => date == DateTime(e.checkDate.year, e.checkDate.month, e.checkDate.day)).toList();
        } else if (dates.length == 2) {
          final first = dates[0].subtract(Duration(seconds: 1));
          final last = DateTime(dates[1].year, dates[1].month, dates[1].day, 23, 59);
          result = result.where((e) => first.isBefore(e.checkDate) && last.isAfter(e.checkDate)).toList();
        }
      }
       if (filters.instructionDates != null) {
        final dates = filters.instructionDates;
        if (dates.length == 1) {
          final date = DateTime(dates[0].year, dates[0].month, dates[0].day);
          result = result.where((e) => date == DateTime(e.instructionDate.year, e.instructionDate.month, e.instructionDate.day)).toList();
        } else if (dates.length == 2) {
          final first = dates[0].subtract(Duration(seconds: 1));
          final last = DateTime(dates[1].year, dates[1].month, dates[1].day, 23, 59);
          result = result.where((e) => first.isBefore(e.instructionDate) && last.isAfter(e.instructionDate)).toList();
        }
      }
    }
    result.sort((c1, c2) => c1.instructionNum.compareTo(c2.instructionNum));
    if (sort == InstructionSortStrings.instructionNum) {
      result.sort((c1, c2) => c1.instructionNum.compareTo(c2.instructionNum));
    } else if (sort == InstructionSortStrings.checkDate) {
      result.sort((c1, c2) => c1.checkDate.compareTo(c2.checkDate));
    } else if (sort == InstructionSortStrings.instructionDate) {
      result.sort((c1, c2) => c1.instructionDate.compareTo(c2.instructionDate));
    } else {
      result.sort((c1, c2) => c1.instructionStatus.id.compareTo(c2.instructionStatus.id));
    }
    if (order == SortOrder.desc) {
      result = result.reversed.toList();
    }
    return result;
  }
}
