import 'package:inspector/model/instruction.dart';

mixin InstructionMixin {
  Future<void> save(List<Instruction> instructions);
  Future<List<Instruction>> getAll();
  Future<void> saveInstructionsDate(DateTime date);
  Future<String> getInstructionsDate();
  Future saveInstructionSort(String value);
  Future<String> getInstructionsSort();
}