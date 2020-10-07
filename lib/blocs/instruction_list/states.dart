import 'package:inspector/model/instruction.dart';

abstract class InstructionListBlocState {}

class LoadingState extends InstructionListBlocState {
}

class LoadedState extends InstructionListBlocState {
  final int from;
  final int to;
  final List<Instruction> instructions;

  LoadedState(this.instructions, this.from, this.to);
}

