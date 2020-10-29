import 'dart:typed_data';

import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:latlong/latlong.dart';

abstract class TotalReportBlocEvent { }

class LoadEvent extends TotalReportBlocEvent {
  final Report report;

  LoadEvent(this.report);
}

class FlushEvent extends TotalReportBlocEvent {
  
} 

class InitEvent extends TotalReportBlocEvent {
  final Report report;

  InitEvent(this.report);
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

class SearchAddressByLocation extends ChangeViolationEvent {

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

class SetViolatorDocumentTypeEvent extends ChangeViolatorEvent {
  final ViolatorDocumentType documentType;

  SetViolatorDocumentTypeEvent(int index, this.documentType) : super(index);
}


class SetViolatorRegistrationAddressEvent extends ChangeViolatorEvent {
  final ViolatorAddress address;

  SetViolatorRegistrationAddressEvent(int index, this.address) : super(index);
}

class SetViolatorLegalAddressEvent extends ChangeViolatorEvent {
  final ViolatorAddress address;

  SetViolatorLegalAddressEvent(int index, this.address) : super(index);
}

class SetViolatorPostalAddressEvent extends ChangeViolatorEvent {
  final ViolatorAddress address;

  SetViolatorPostalAddressEvent(int index, this.address) : super(index);
}

class SetViolationLocationEvent extends TotalReportBlocEvent {
  final LatLng location;

  SetViolationLocationEvent(this.location);
}

class SaveReportEvent extends TotalReportBlocEvent {
  final int status;
  final String violationDescription;
  final String specifiedAddress;
  final String codexArticle;
  final List<Violator> violators;
  final List<Uint8List> photos;

  SaveReportEvent({this.status, this.violationDescription, this.specifiedAddress, this.codexArticle, this.violators, this.photos});
}

class RemoveReportEvent extends TotalReportBlocEvent {

}

class TotalReportDialogBlocEvent {
  final ViolatorAddress address;

  TotalReportDialogBlocEvent(this.address);
}