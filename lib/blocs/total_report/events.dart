abstract class TotalReportBlocEvent { }

class LoadEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  LoadEvent(this.violationNotPresent);
}

class SetViolationNotPresentEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  SetViolationNotPresentEvent(this.violationNotPresent);
}

class AddViolatorEvent extends TotalReportBlocEvent {
}

class ChangeViolatorEvent extends TotalReportBlocEvent {
  final int index;
  
  ChangeViolatorEvent(this.index);
}

class SetViolatorNotFoundEvent extends ChangeViolatorEvent {
  final bool violatorNotFound;

  SetViolatorNotFoundEvent(int index, this.violatorNotFound) : super(index);
}

class SetViolatorForeignEvent extends ChangeViolatorEvent {
  final bool foreign;

  SetViolatorForeignEvent(int index, this.foreign) : super(index);
}

