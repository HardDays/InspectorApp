import 'package:inspector/model/report.dart';
import 'package:inspector/services/api/api_service.dart';

class ReportsService {

  final _apiService = ApiService();
 
  static final _instance = ReportsService._internal();

  factory ReportsService() {
    return _instance;
  }

  ReportsService._internal();

  Future init() async {

  }

  Future<Report> create(Report report) async {
    return await _apiService.createReport(report);
  }

}