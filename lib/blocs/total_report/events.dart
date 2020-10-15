import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/street.dart';

abstract class TotalReportBlocEvent { }

class LoadEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  LoadEvent(this.violationNotPresent);
}

class InitEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  InitEvent(this.violationNotPresent);
}

class SetViolationNotPresentEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  SetViolationNotPresentEvent(this.violationNotPresent);
}

class SetViolationAreaEvent extends TotalReportBlocEvent {
  final Area area;

  SetViolationAreaEvent(this.area);
}

class SetViolatioDistrictEvent extends TotalReportBlocEvent {
  final District district;

  SetViolatioDistrictEvent(this.district);
}

class SetViolatioStreetEvent extends TotalReportBlocEvent {
  final Street street;

  SetViolatioStreetEvent(this.street);
}

class SetViolatioAddressEvent extends TotalReportBlocEvent {
  final Address address;

  SetViolatioAddressEvent(this.address);
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

