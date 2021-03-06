import 'package:connectivity/connectivity.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/instruction_request_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/sqlite/sqlite_instructions_service.dart';
import 'package:inspector/services/sqlite/sqlite_reports_service.dart';

class InstructionsService {

  final _apiService = ApiService();
  final _persistanceService = ObjectDbPersistanceService();
  final _instructionsDbService = SqliteInstructionsService();
  //final _instructionsDbService = ObjectDbCollectionService<Instruction>('instructions.db', (json) => Instruction.fromJson(json));
  //final _reportsDbService = ObjectDbCollectionService<Report>('reports.db', (json) => Report.fromJson(json));
  final _reportsDbService = SqliteReportsService();
  final _instructionRequestService = InstructionRequestService();

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

  Future<String> sortOrder() async {
    return await _persistanceService.getInstructionSortOrder() ?? SortOrder.asc;
  }

  Future<Instruction> find(int id, {bool reload = true}) async {
    final connectivityStatus = await Connectivity().checkConnectivity();
    if(!reload || !(await _persistanceService.getDataSendingState()) || connectivityStatus == ConnectivityResult.none) {
      return (await _instructionsDbService.all(query: {'id': id})).first;
    }
    return await _apiService.getInstruction(id);
  }

  Future<List<Instruction>> all({bool reload = false}) async {
    if (reload) {
      final data = await _apiService.getInstructions();
      await _persistanceService.saveInstructionsDate();
      await _instructionsDbService.saveAll(data);
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
          await _reportsDbService.removeGlobal(report);
          await _reportsDbService.save(report);
        }
        return await _reportsDbService.all(query: {'instructionId': id});
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

  Future<Instruction> updateInstruction(int id, {InstructionStatus instructionStatus, String rejectReason}) async {
    final connectivityStatus = await Connectivity().checkConnectivity();
    if(!(await  _persistanceService.getDataSendingState()) || connectivityStatus == ConnectivityResult.none) {
      _instructionRequestService.save(id, instructionStatus);
      final instruction = (await _instructionsDbService.all(query: {'id': id})).first;
      final newInstructionJson = instruction.toJson();
      newInstructionJson['instructionStatus'] = instructionStatus.toJson();
      final newInstruction = Instruction.fromJson(newInstructionJson);
      await _instructionsDbService.update(newInstruction);
      return newInstruction;
    } else {
      _persistanceService.saveLastDataSendingDate(DateTime.now());
      return await _apiService.updateInstruction(id, instructionStatus: instructionStatus, rejectReason: rejectReason);
    }
  }

  Future saveSort(String sort) async {
    await _persistanceService.saveInstructionSort(sort);
  }

  Future saveSortOrder(String order) async {
    await _persistanceService.saveInstructionSortOrder(order);
  }

  Future saveFilters(InstructionFilters filters) async {
    await _persistanceService.saveInstructionFilters(filters);
  }

  Future flushReportsDate(int instructionId) async {
    await _persistanceService.saveInstructionsReportDate(instructionId, date: DateTime.now().subtract(Duration(minutes: 15)));
  }

}