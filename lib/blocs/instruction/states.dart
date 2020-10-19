import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';

class InstructionBlocState {
  final DateTime date;
  final Instruction instruction;
  final List<Report> reports;

  InstructionBlocState(this.date, this.instruction, this.reports);
}

class LoadingReportsState  extends InstructionBlocState {
  LoadingReportsState(DateTime date, Instruction instruction, List<Report> reports) : super(date, instruction, reports);
}

class LoadingUpdateState extends InstructionBlocState {
  LoadingUpdateState(DateTime date, Instruction instruction, List<Report> reports) : super(date, instruction, reports);
}

class ErrorState extends InstructionBlocState {
  final ApiException exception;

  ErrorState(DateTime date, Instruction instruction, List<Report> reports, this.exception) : super(date, instruction, reports);
}

class SuccessState extends InstructionBlocState {
  SuccessState(DateTime date, Instruction instruction, List<Report> reports) : super(date, instruction, reports);
}
