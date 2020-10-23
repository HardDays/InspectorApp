import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';

class InstructionsService {

  final _apiService = ApiService();
  final _persistanceService = ObjectDbPersistanceService();
  final _instructionsDbService = ObjectDbCollectionService<Instruction>('instructions.db', (json) => Instruction.fromJson(json));
  final _reportsDbService = ObjectDbCollectionService<Report>('reports.db', (json) => Report.fromJson(json));

  static final _instance = InstructionsService._internal();

  factory InstructionsService() {
    return _instance;
  }

  InstructionsService._internal();

  Future init() async {
    await _instructionsDbService.init();
    await _reportsDbService.init();
    await _persistanceService.init();
  }

  Future<DateTime> date() async {
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
      _instructionsDbService.saveAll(data);
      return data;
    } else {
      return await _instructionsDbService.all();
    }
  } 

  Future<List<Report>> reports(int id, {bool reload = false}) async {
    if (reload) { 
      final data = await _apiService.getInstructionReports(id);
      await _persistanceService.saveInstructionsReportDate(id);
      if (data.isNotEmpty) {
        for (final report in data) {
          await _reportsDbService.save({'instructionId': id, 'checkId': report.checkId}, report);
        }
        return data;
      } else {
        return await _reportsDbService.all(query: {'instructionId': id});
      }
    } else {
      return await _reportsDbService.all(query: {'instructionId': id});
    }
  }

  Future<DateTime> reportsDate(int id) async {
    return _persistanceService.getInstructionReportDate(id);
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