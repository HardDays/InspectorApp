import 'package:inspector/model/report.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';

class DiggReportBlocState {
  final String status;
  final Report report;

  DiggReportBlocState(this.status, this.report);
}

class SuccessState extends DiggReportBlocState {
  SuccessState(String status, Report report) : super(status, report);
}

class ErrorState extends DiggReportBlocState {
  final ApiException exception;
  
  ErrorState(this.exception, String status, Report report) : super(status, report);
}

class DeletedState extends DiggReportBlocState {
  DeletedState(String status, Report report) : super(status, report);
}