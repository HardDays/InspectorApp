import 'package:inspector/model/instruction.dart';
import 'package:inspector/providers/api_provider.dart';
import 'package:inspector/providers/exceptions/parse_exception.dart';
import 'package:inspector/services/objectdb/instruction_service.dart';

class ApiInstructionService {

  final api = ApiProvider();

  //final dbService = ObjectDBInstructionService();
  Future init() async {
    return await api.init();
  }

  Future<List<Instruction>> getAll() async {
    final data = await api.getInstructions();
    try {
      return List<Instruction>.from(data['data'].map((d) => Instruction.fromJson(d)));
    } catch (ex) {
      print(ex);
      throw ParseException();
    }
  }

}