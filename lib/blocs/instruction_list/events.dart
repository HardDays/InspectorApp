abstract class InstructionListBlocEvent {}

class LoadEvent extends InstructionListBlocEvent {
  
}

class RefreshEvent extends InstructionListBlocEvent {
  
}

class SortEvent extends InstructionListBlocEvent {
  final String sort;

  SortEvent(this.sort);
}