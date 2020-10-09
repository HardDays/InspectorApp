abstract class InstructionFiltersBlocEvent {}

class LoadEvent extends InstructionFiltersBlocEvent {

}

class ChangeInstructionDatesEvent extends InstructionFiltersBlocEvent {
  final List<DateTime> dates;

  ChangeInstructionDatesEvent(this.dates);
}

class ChangeCheckDatesEvent extends InstructionFiltersBlocEvent {
  final List<DateTime> dates;

  ChangeCheckDatesEvent(this.dates);
}

class ChangeInstructionNumEvent extends InstructionFiltersBlocEvent {
  final String instructionNum;

  ChangeInstructionNumEvent(this.instructionNum);
}

class ChangeInstructionStatusEvent extends InstructionFiltersBlocEvent {
  final String instructionStatus;

  ChangeInstructionStatusEvent(this.instructionStatus);
}
