import 'package:inspector/model/report.dart';

class TotalReportBlocState {

  final Report report;

  TotalReportBlocState({
    this.report,

  });

  TotalReportBlocState copyWith({Report report}) {
    return TotalReportBlocState(
      report: report,
 
    );
  }
}

class LoadDictState extends TotalReportBlocState {
  LoadDictState(Report report) : super(report: report);
}