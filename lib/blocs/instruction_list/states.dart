import 'package:inspector/model/instruction.dart';

abstract class InstructionListBlocState {
  final String sort;
  final String date;
  final InstructionFilters filters;

  InstructionListBlocState({this.sort, this.date, this.filters});
}

class LoadingState extends InstructionListBlocState {

}

class DataState extends InstructionListBlocState {
  final List<Instruction> instructions;

  DataState(
    this.instructions, 
    String date, 
    String sort, 
    InstructionFilters filters) : 
  super(
    sort: sort, 
    date: date,
    filters: filters
  );
}

class OldDataState extends DataState {

  OldDataState(
    List<Instruction> instructions, 
    String date, 
    String sort, 
    InstructionFilters filters
  ) : super(
    instructions, 
    date, 
    sort, 
    filters,
  );
}


class NewDataState extends DataState {

  NewDataState(
    List<Instruction> instructions, 
    String date, 
    String sort, 
    InstructionFilters filters
  ) : super(
    instructions, 
    date, 
    sort, 
    filters,
  );
}

