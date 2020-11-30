abstract class InstructionFiltersBlocEvent {}

class LoadEvent extends InstructionFiltersBlocEvent {

}

class SetInstructionDatesEvent extends InstructionFiltersBlocEvent {
  final List<DateTime> dates;

  SetInstructionDatesEvent(this.dates);
}

class SetCheckDatesEvent extends InstructionFiltersBlocEvent {
  final List<DateTime> dates;

  SetCheckDatesEvent(this.dates);
}

class SetInstructionNumEvent extends InstructionFiltersBlocEvent {
  final String instructionNum;

  SetInstructionNumEvent(this.instructionNum);
}

class SetInstructionStatusEvent extends InstructionFiltersBlocEvent {
  final int instructionStatus;

  SetInstructionStatusEvent(this.instructionStatus);
}
