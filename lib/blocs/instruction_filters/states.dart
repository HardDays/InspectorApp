import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';

class InstructionFiltersBlocState {
  final List<InstructionStatus> statuses;
  final InstructionFilters filters;

  InstructionFiltersBlocState(this.statuses, this.filters);
}
