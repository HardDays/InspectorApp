import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/api_provider.dart';

class InstructionService {

  final api = ApiProvider();

  Future<List<Instruction>> getAll() async {
    await api.init();
    // todo: catch 401, timeout, parse errors
    try {
      final res = await api.getInstructions();

      return List<Instruction>.from(res.data['data'].map((d) => Instruction.fromJson(d)));
    } catch (ex) {

    }
  }

}