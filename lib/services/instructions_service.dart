import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/objectdb/objectdb_instructions_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';

class InstructionsService {

  final _apiService = ApiService();
  final _persistanceService = ObjectDbPersistanceService();
  final _dbService = ObjectDBInstructionsService();

  static final _instance = InstructionsService._internal();

  factory InstructionsService() {
    return _instance;
  }

  InstructionsService._internal();

  Future init() async {
    await _dbService.init();
    await _persistanceService.init();
  }

  Future<String> date() async {
    return _persistanceService.getInstructionsDate();
  }
  
  Future<InstructionFilters> filters() async {
    return await _persistanceService.getInstructionFilters();
  }

  Future<String> sort() async {
    return await _persistanceService.getInstructionsSort();
  }

  Future<Instruction> find(int id, {bool reload = false}) async {
    return await _apiService.getInstruction(id);
  }

  Future<List<Instruction>> all({bool reload = false}) async {
    if (reload) {
      final data = await _apiService.getInstructions();
      await _persistanceService.saveInstructionsDate();
      _dbService.save(data);
      return data;
    } else {
      return await _dbService.all();
    }
  } 

  Future<Instruction> updateInstruction(int id, {InstructionStatus instructionStatus}) async {
    return await _apiService.updateInstruction(id, instructionStatus: instructionStatus);
  }

  Future saveSort(String sort) async {
    await _persistanceService.saveInstructionSort(sort);
  }

  Future saveFilters(InstructionFilters filters) async {
    await _persistanceService.saveInstructionFilters(filters);
  }

}