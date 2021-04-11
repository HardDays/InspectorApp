import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/documents_for_editing/events.dart';
import 'package:inspector/blocs/documents_for_editing/states.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:inspector/services/reports_service.dart';

class DocumentsBloc extends Bloc<DocumentsBlocEvent, DocumentsBlocState> {
  DocumentsBloc() : super(LoadingState()) {
    add(LoadEvent());
  } 

  final _persistanceService = ObjectDbPersistanceService();

  final ReportsService _reportsService = ReportsService();

  @override
  Stream<DocumentsBlocState> mapEventToState(DocumentsBlocEvent event) async* {
    if (event is LoadEvent) yield* _onLoadEvent(event);
  }

  Stream<DocumentsBlocState> _onLoadEvent(LoadEvent _) async* {
    final user = await _persistanceService.getUser();
    final reports = await _reportsService.reportErrors(user?.id);
    if (reports.isEmpty) {
      yield (EmptyState());
    } else {
      yield (LoadedState(reports));
    }
  }
}
