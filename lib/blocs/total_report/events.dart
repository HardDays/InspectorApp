import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_info.dart';
import 'package:inspector/model/violator_type.dart';

abstract class TotalReportBlocEvent { }

class LoadEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;
  final int checkId;
  final int instructionId;

  LoadEvent(this.violationNotPresent, this.checkId, this.instructionId);
}

class InitEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;
  final int checkId;
  final int instructionId;

  InitEvent(this.violationNotPresent, this.checkId, this.instructionId);
}

class SetViolationNotPresentEvent extends TotalReportBlocEvent {
  final bool violationNotPresent;

  SetViolationNotPresentEvent(this.violationNotPresent);
}

class ChangeViolationEvent extends TotalReportBlocEvent {

}

class AddViolationActEvent extends ChangeViolationEvent {

}

class SetViolationAreaEvent extends ChangeViolationEvent {
  final Area area;

  SetViolationAreaEvent(this.area);
}

class SetViolationDistrictEvent extends ChangeViolationEvent {
  final District district;

  SetViolationDistrictEvent(this.district);
}

class SetViolationStreetEvent extends ChangeViolationEvent {
  final Street street;

  SetViolationStreetEvent(this.street);
}

class SetViolationAddressEvent extends ChangeViolationEvent {
  final Address address;

  SetViolationAddressEvent(this.address);
}

class SetViolationOjbectCategoryEvent extends ChangeViolationEvent {
  final ObjectCategory objectCategory;

  SetViolationOjbectCategoryEvent(this.objectCategory);
}

class SetViolationNormativeActEvent extends ChangeViolationEvent {
  final int index;
  final NormativeAct normativeAct;

  SetViolationNormativeActEvent(this.index, this.normativeAct);
}

class SetViolationNormativeActArticleEvent extends ChangeViolationEvent {
  final int index;
  final NormativeActArticle normativeActArticle;

  SetViolationNormativeActArticleEvent(this.index, this.normativeActArticle);
}

class SetViolationTypeEvent extends ChangeViolationEvent {
  final ViolationType violationType;

  SetViolationTypeEvent(this.violationType);
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

class SetViolatorTypeEvent extends ChangeViolatorEvent {
  final ViolatorType type;

  SetViolatorTypeEvent(int index, this.type) : super(index);
}

class SetViolatorDepartmentCodeEvent extends ChangeViolatorEvent {
  final DepartmentCode departmentCode;

  SetViolatorDepartmentCodeEvent(int index, this.departmentCode) : super(index);
}

class SetViolatorInfoEvent extends ChangeViolatorEvent {
  final ViolatorInfo violatorPerson;

  SetViolatorInfoEvent(int index, this.violatorPerson) : super(index);
}

class SaveEvent extends TotalReportBlocEvent {
  final int status;
  final String violationDescription;
  final String specifiedAddress;
  final String codexArticle;

  SaveEvent(this.status, this.violationDescription, this.specifiedAddress, this.codexArticle);

}