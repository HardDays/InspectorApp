import 'dart:convert' as c;
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:inspector/blocs/digg_report/events.dart';
import 'package:inspector/blocs/digg_report/states.dart';
import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/providers/exceptions/unhadled_exception.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/reports_service.dart';
import 'package:uuid/uuid.dart';

class DiggReportBloc extends Bloc<DiggReportBlocEvent, DiggReportBlocState> {
  
  final _dictionaryService = DictionaryService();
  final _reportsService = ReportsService();
  final _persistanceService = ObjectDbPersistanceService();

  DiggReportBloc(initialState) : super(initialState);

  @override
  Stream<DiggReportBlocState> mapEventToState(DiggReportBlocEvent event) async* {
    if (event is SetStatusEvent) {
      yield DiggReportBlocState(event.status, state.report);
    } else if (event is SaveReportEvent) {
      Report report = state.report;

      final statuses = await _dictionaryService.getReportStatuses(id: event.status);
      final status = statuses.first;
      final photosBase64 = event.photos.map((e) => c.base64Encode(e)).toList();
      final photos = List.generate(photosBase64.length, (i) => Photo(data: photosBase64[i], name: event.photoNames[i]));
      final date = state.report.reportDate ?? DateTime.now();
      final lastNum = await _persistanceService.getReportNumber();
      final number = state.report.reportNum ??  '$lastNum ${DateFormat('dd.MM.yyyy').format(date)}';
      final localId = state.report.localId ?? Uuid().v1();

      report = report.copyWith(
        localId: localId,
        reportStatus: status,
        photos: photos,
        reportDate: date,
        reportNum: number
      );

      bool found = false;
      for (int i = 0; i < report.diggRequestChecks.length; i++) {
        if (report.diggRequestChecks[i].id == event.diggRequestCheck.id) {
          report.diggRequestChecks[i] = report.diggRequestChecks[i].copyWith(
            comment: event.comment,
            workCompleted: state.status == DiggRequestCheckStatus.workNotComplete,
            landscapingRestored: state.status == DiggRequestCheckStatus.landscapingRestored,
          );
          found = true;
          break;
        }
      }
      if (!found) {
        report.diggRequestChecks.add(
          event.diggRequestCheck.copyWith(
            comment: event.comment,
            workCompleted: state.status == DiggRequestCheckStatus.workNotComplete,
            landscapingRestored: state.status == DiggRequestCheckStatus.landscapingRestored,
          )
        );
      }

      try {
        final local = status.id == ReportStatusIds.new_ || status.id == ReportStatusIds.project;
        final res = await _reportsService.create(report, local: local);
        yield SuccessState(state.status, res); 
      } on ApiException catch (ex) {
        yield ErrorState(ex, state.status, state.report);
      } catch (ex) {
        yield ErrorState(UnhandledException(ex.toString()), state.status, state.report);
      }
    } else if (event is RemoveReportEvent) {
      await _reportsService.removeLocal(state.report);
      yield DeletedState(state.status, state.report); 
    } else if (event is FlushEvent) {
      yield DiggReportBlocState(state.status, state.report);
    }
  } 
}
