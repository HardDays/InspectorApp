abstract class TotalReportBlocEvent { }

class LoadEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  LoadEvent(this.violationNotPresent);
}

class SetViolationNotPresentEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  SetViolationNotPresentEvent(this.violationNotPresent);
}