import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/hive/hive_instruction_service.dart';

class InstructionService {

  final api = ApiProvider();

  final hiveService = HiveInstructionService();

  Future<List<Instruction>> getAll() async {
    await api.init();
    await hiveService.init();

    final data = await api.getInstructions();
    try {
      final result = List<Instruction>.from(data['data'].map((d) => Instruction.fromJson(d)));
      hiveService.saveInstructions(result);
      return result;
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

}