import 'package:inspector/model/digg_request_check.dart';
import 'package:inspector/model/report.dart';

class DiggReportBlocEvent {

}

class SetStatusEvent extends DiggReportBlocEvent {
  final String status;

  SetStatusEvent(this.status);
}

class SaveReportEvent extends DiggReportBlocEvent {
  final int status;
  final DiggRequestCheck diggRequestCheck;
  final String comment;

  SaveReportEvent(this.diggRequestCheck, this.status, this.comment);
}

class RemoveReportEvent extends DiggReportBlocEvent {

}

class FlushEvent extends DiggReportBlocEvent {

}