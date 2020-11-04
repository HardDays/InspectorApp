import 'package:inspector/model/report.dart';

abstract class DocumentsBlocState {}

class LoadingState extends DocumentsBlocState {}

class LoadedState extends DocumentsBlocState {
  final Iterable<ReportError> reports;

  LoadedState(this.reports);
}

class EmptyState extends DocumentsBlocState {}