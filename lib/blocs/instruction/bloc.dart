import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/instruction/events.dart';
import 'package:inspector/blocs/instruction/states.dart';
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
    if (event is UpadteInstructionStatusEvent) {
      try {
        await _instructionService.init();

        yield LoadingState(state.instruction);

        final isLoaded = await _dictionaryService.isLoaded(keys: [DictionaryNames.instructionStatuses]);
        if (!isLoaded) {
          await _dictionaryService.load(keys: [DictionaryNames.instructionStatuses]);
        }

        final statuses = await _dictionaryService.getInstructionStatuses();
        final status = statuses.firstWhere((element) => element.name == event.status);
        await _instructionService.updateInstruction(state.instruction.id, instructionStatus: status);
        final instruction = await _instructionService.find(state.instruction.id, reload: true);

        yield SuccessState(instruction);
      } on ApiException catch (ex) {
        yield ErrorState(state.instruction, ex);
      } catch (ex) {
        yield ErrorState(state.instruction, UnhandledException(ex.toString()));
      }
    } else if (event is FlushEvent) {
      yield InstructionBlocState(state.instruction);
    }
  } 
}