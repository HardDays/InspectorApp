import 'package:inspector/model/instruction.dart';

abstract class InstructionBlocEvent {}

class FlushEvent extends InstructionBlocEvent {
  
} 

class LoadReportsEvent extends InstructionBlocEvent {

  LoadReportsEvent();
}

class UpadteInstructionStatusEvent extends InstructionBlocEvent {
  final String status;

  UpadteInstructionStatusEvent(this.status);
}