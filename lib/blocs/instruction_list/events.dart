import 'package:inspector/model/instruction.dart';

abstract class InstructionListBlocEvent {}

class LoadEvent extends InstructionListBlocEvent {
  
}

class RefreshEvent extends InstructionListBlocEvent {
  
}

class SortEvent extends InstructionListBlocEvent {
  final String sort;

  SortEvent(this.sort);
}

class FilterEvent extends InstructionListBlocEvent {
  final InstructionFilters filters;

  FilterEvent(this.filters);
}