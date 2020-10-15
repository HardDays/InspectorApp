import 'package:inspector/model/instruction.dart';

mixin InstructionMixin {
  Future<void> saveInstructionsDate();
  Future<String> getInstructionsDate();
  Future saveInstructionSort(String value);
  Future<String> getInstructionsSort();
}