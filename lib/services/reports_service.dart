import 'package:inspector/model/report.dart';
import 'package:inspector/services/api/api_service.dart';
import 'package:inspector/services/objectdb/objectdb_collection_service.dart';

class ReportsService {

  final _apiService = ApiService();
   final _reportsDbService = ObjectDbCollectionService<Report>('reports.db', (json) => Report.fromJson(json));

  static final _instance = ReportsService._internal();

  factory ReportsService() {
    return _instance;
  }

  ReportsService._internal();

  Future init() async {
    await _reportsDbService.init();
  }

  Future<Report> create(Report report, {bool local = false}) async {
    if (local) {
      await _reportsDbService.save({'instructionId': report.instructionId, 'checkId': report.checkId}, report);
      return report;
    } else {
      return await _apiService.createReport(report);
    }
  }

  Future remove(Report report) async {
    await _reportsDbService.remove({'instructionId': report.instructionId, 'checkId': report.checkId});
  }

}