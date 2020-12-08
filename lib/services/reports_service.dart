import 'package:inspector/model/report.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/mixins/data_sending_configuration_mixin.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/sqlite/sqlite_reports_service.dart';

class ReportsService {

  final _apiService = ApiService();
  //final _reportsDbService = ObjectDbCollectionService<Report>('reports.db', (json) => Report.fromJson(json));
  final _reportsDbService = SqliteReportsService();
  //final _reportErrorsDbService = ObjectDbCollectionService<ReportError>('report_errors.db', (json) => ReportError.fromJson(json));

  final DataSendingConfigurationMixin _dataSendingConfiguration = ObjectDbPersistanceService();

  static final _instance = ReportsService._internal();

  factory ReportsService() {
    return _instance;
  }

  ReportsService._internal();

  Future init() async {
    await _reportsDbService.init();
  }

  Future<Iterable<Report>> all() async {
    return await _reportsDbService.all();
  }

  Future<Iterable<Report>> readyToSend() async {
    final ready = await _reportsDbService.all();
    return ready.where((element) => element.isReady).toList();
  }

  Future<Report> create(Report report, {String error, bool local = false}) async {
    // для тестирования
    if ((local || !(await _dataSendingConfiguration.getDataSendingState()))) {
      //await _reportsDbService.save({'instructionId': report.instructionId, 'checkId': report.checkId}, report);
      await _reportsDbService.save(report, error: error);
      return report;
    } else {
      return await send(report);
    }
  }

  Future<Report> send(Report report) async {
    await _dataSendingConfiguration.saveLastDataSendingDate(DateTime.now());
    final res = await _apiService.createReport(report);
    await removeLocal(report);
    return res;
  }

  Future removeLocal(Report report) async {
    await _reportsDbService.removeLocal(report);
  }

  Future<List<ReportError>> reportErrors() async {
   //return [];
    return await _reportsDbService.errors();
  }

}