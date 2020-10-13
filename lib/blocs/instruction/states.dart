import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';

class InstructionBlocState {
  final Instruction instruction;

  InstructionBlocState(this.instruction);
}

class LoadingState extends InstructionBlocState {

  LoadingState(Instruction instruction) : super(instruction);
}

class ErrorState extends InstructionBlocState {
  final ApiException exception;

  ErrorState(Instruction instruction, this.exception) : super(instruction);
}

class SuccessState extends InstructionBlocState {

  SuccessState(Instruction instruction) : super(instruction);
}
