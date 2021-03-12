import 'package:inspector/model/instruction.dart';

abstract class InstructionFiltersBlocEvent {}

class LoadEvent extends InstructionFiltersBlocEvent {

}

class SetInstructionDateFromEvent extends InstructionFiltersBlocEvent {
  final DateTime date;

  SetInstructionDateFromEvent(this.date);
}

class SetInstructionDateToEvent extends InstructionFiltersBlocEvent {
  final DateTime date;

  SetInstructionDateToEvent(this.date);
}

class SetCheckDateFromEvent extends InstructionFiltersBlocEvent {
  final DateTime date;

  SetCheckDateFromEvent(this.date);
}

class SetCheckDateToEvent extends InstructionFiltersBlocEvent {
  final DateTime date;

  SetCheckDateToEvent(this.date);
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
