import 'package:inspector/model/instruction.dart';

abstract class InstructionFiltersBlocEvent {}

class LoadEvent extends InstructionFiltersBlocEvent {

}

class SetMinDateEvent extends InstructionFiltersBlocEvent {
  final DateTime date;

  SetMinDateEvent(this.date);
}

class SetMaxDateEvent extends InstructionFiltersBlocEvent {
  final DateTime date;

  SetMaxDateEvent(this.date);
}

class SetInstructionNumEvent extends InstructionFiltersBlocEvent {
  final String instructionNum;

  SetInstructionNumEvent(this.instructionNum);
}

class SetInstructionStatusEvent extends InstructionFiltersBlocEvent {
  final int instructionStatus;

  SetInstructionStatusEvent(this.instructionStatus);
}

class SaveEvent extends InstructionFiltersBlocEvent {
  final InstructionFilters filters;

  SaveEvent(this.filters);
}
