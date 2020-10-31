import 'package:inspector/model/report.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/mixins/data_sending_configuration_mixin.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';

class ReportsService {

  final _apiService = ApiService();
  final _reportsDbService = ObjectDbCollectionService<Report>('reports.db', (json) => Report.fromJson(json));
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
    return (await _reportsDbService.all()).where((element) => !_isReportLocal(element)).toList();
  }

  Future<Report> create(Report report, {bool local = false}) async {
    if (local || !(await _dataSendingConfiguration.getDataSendingState())) {
      await _reportsDbService.save({'instructionId': report.instructionId, 'checkId': report.checkId}, report);
      return report;
    } else {
      await _dataSendingConfiguration.saveLastDataSendingDate(DateTime.now());
      return await _apiService.createReport(report);
    }
  }

  bool _isReportLocal(Report report) {
    return report.reportStatus.id == ReportStatusIds.new_ || report.reportStatus.id == ReportStatusIds.project;
  }

  Future remove(Report report) async {
    await _reportsDbService.remove({'instructionId': report.instructionId, 'checkId': report.checkId});
  }

}