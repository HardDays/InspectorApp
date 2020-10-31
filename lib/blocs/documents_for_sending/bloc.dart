import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/documents_for_sending/events.dart';
import 'package:inspector/blocs/documents_for_sending/states.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/services/reports_service.dart';

class DocumentsBloc extends Bloc<DocumentsBlocEvent, DocumentsBlocState> {
  DocumentsBloc() : super(LoadingState()) {
    add(LoadEvent());
  }

  final ReportsService _reportsService = ReportsService();

  @override
  Stream<DocumentsBlocState> mapEventToState(DocumentsBlocEvent event) async* {
    if(event is LoadEvent) _onLoadEvent(event);
  }

  Stream<DocumentsBlocState> _onLoadEvent(LoadEvent _) async* {
    final reports = (await _reportsService.all()).where((e) => _isReportReadyToSend(e)).toList();
    yield(LoadedState(reports));
  }

  bool _isReportReadyToSend(Report report) {
    return report.reportStatus.id != ReportStatusIds.new_ && report.reportStatus.id != ReportStatusIds.project;
  }

}