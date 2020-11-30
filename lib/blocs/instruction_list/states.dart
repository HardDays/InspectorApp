import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';

abstract class InstructionListBlocState {
  final String sort;
  final DateTime date;
  final InstructionFilters filters;

  InstructionListBlocState({this.sort, this.date, this.filters});
}

class LoadingState extends InstructionListBlocState {

}

class DataState extends InstructionListBlocState {
  final List<Instruction> instructions;

  DataState(
    this.instructions, 
    DateTime date, 
    String sort, 
    InstructionFilters filters) : 
  super(
    sort: sort, 
    date: date,
    filters: filters
  );
}

class OldDataState extends DataState {

  final ApiException exception;

  OldDataState(
    List<Instruction> instructions, 
    DateTime date, 
    String sort, 
    InstructionFilters filters,
    this.exception
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
    DateTime date, 
    String sort, 
    InstructionFilters filters
  ) : super(
    instructions, 
    date, 
    sort, 
    filters,
  );
}

