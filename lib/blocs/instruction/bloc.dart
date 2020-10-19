import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/instruction/events.dart';
import 'package:inspector/blocs/instruction/states.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/providers/exceptions/unhadled_exception.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/sqlite/sqlite_dictionary_service.dart';

class InstructionBloc extends Bloc<InstructionBlocEvent, InstructionBlocState> {
  InstructionBloc(initialState) : super(initialState);

  final _instructionService = InstructionsService();
  final _dictionaryService = DictionaryService();

  @override
  Stream<InstructionBlocState> mapEventToState(InstructionBlocEvent event) async* {
    if (event is LoadReportsEvent || event is RefreshReportsEvent) {
      await _instructionService.init();

      final date = await _instructionService.reportsDate(state.instruction.id);

      yield LoadingReportsState(date, state.instruction, []);
      try {
        final reload = event is RefreshReportsEvent || (date == null) || (date != null && DateTime.now().difference(date).inMinutes > 10);
        
        final reports = await _instructionService.reports(state.instruction.id, reload: reload);
        final newDate = await _instructionService.reportsDate(state.instruction.id);
        if (reload) {
          yield SuccessState(newDate, state.instruction, reports);
        } else {
          yield InstructionBlocState(newDate, state.instruction, reports);
        }
      } on ApiException catch (ex) {
        final reports = await _instructionService.reports(state.instruction.id);
        yield ErrorState(date, state.instruction, reports, ex);
        await Future.delayed(Duration(seconds: 2));
        yield InstructionBlocState(date, state.instruction, reports);
      } catch (ex) {
        yield ErrorState(date, state.instruction, state.reports, UnhandledException(ex.toString()));
      }
    } else if (event is UpadteInstructionStatusEvent) {
      try {
        yield LoadingUpdateState(state.date, state.instruction, state.reports);
        // final isLoaded = await _dictionaryService.isLoaded(keys: [DictionaryNames.instructionStatuses]);
        // if (!isLoaded) {
        //   await _dictionaryService.load(keys: [DictionaryNames.instructionStatuses]);
        // }
        await _dictionaryService.load(keys: [DictionaryNames.instructionStatuses]);

        final statuses = await _dictionaryService.getInstructionStatuses();
        final status = statuses.firstWhere((element) => element.id == event.status);
        await _instructionService.updateInstruction(state.instruction.id, instructionStatus: status);
        final instruction = await _instructionService.find(state.instruction.id, reload: true);

        yield SuccessState(state.date, instruction, state.reports);
      } on ApiException catch (ex) {
        yield ErrorState(state.date, state.instruction, state.reports, ex);
      } catch (ex) {
        yield ErrorState(state.date, state.instruction, state.reports, UnhandledException(ex.toString()));
      }
    } else if (event is FlushEvent) {
      yield InstructionBlocState(state.date, state.instruction, state.reports);
    }
  } 
}