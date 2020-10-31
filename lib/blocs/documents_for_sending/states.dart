import 'package:inspector/blocs/documents_for_sending/events.dart';
import 'package:inspector/model/report.dart';

abstract class DocumentsBlocState {}

class LoadingState extends DocumentsBlocState {}

class LoadedState extends DocumentsBlocState {
  final Iterable<Report> reports;

  LoadedState(this.reports);
}