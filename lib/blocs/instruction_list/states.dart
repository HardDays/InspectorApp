import 'package:inspector/model/instruction.dart';

abstract class InstructionListBlocState {
  final String sort;
  final String date;

  InstructionListBlocState({this.sort, this.date});
}

class LoadingState extends InstructionListBlocState {

}

class DataState extends InstructionListBlocState {

  final List<Instruction> instructions;

  DataState({
    String sort, 
    String date,
    this.instructions = const []
  }) : 
  super(
    sort: sort, 
    date: date
  );
}

class OldDataState extends DataState {

  OldDataState(List<Instruction> instructions, String date, String sort) : super(instructions: instructions, date: date, sort: sort);
}


class NewDataState extends DataState {

  NewDataState(List<Instruction> instructions, String date, String sort) : super(instructions: instructions, date: date, sort: sort);
}

