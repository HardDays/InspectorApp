import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator_type.dart';

class TotalReportBlocState {

  final Report report;

  // final List<Street> streets;
  // final List<Area> areas;
  // final List<District> districts;
  // final List<Address> addresses;
  // final List<SpecialObject> specialObjects;
  // final List<NormativeAct> normativeActs;
  // final List<NormativeActArticle> normativeActArticles;
  // final List<ViolationType> violationTypes;
  // final List<ViolatorType> violatorTypes;
  // final List<DepartmentCode> departmentCodes;

  TotalReportBlocState({
    this.report,
    // this.streets = const [],
    // this.addresses = const [],
    // this.areas = const [],
    // this.districts = const [],
    // this.specialObjects = const [],
    // this.normativeActs = const [],
    // this.normativeActArticles = const [],
    // this.violationTypes = const [],
    // this.violatorTypes = const [],
    // this.departmentCodes = const [],
  });

  TotalReportBlocState copyWith({Report report}) {
    return TotalReportBlocState(
      report: report,
      // streets: streets,
      // addresses: addresses,
      // areas: areas,
      // districts: districts,
      // specialObjects: specialObjects,
      // normativeActs: normativeActs,
      // normativeActArticles: normativeActArticles,
      // violationTypes: violationTypes,
      // violatorTypes: violatorTypes,
      // departmentCodes: departmentCodes,
    );
  }
}

class LoadDictState extends TotalReportBlocState {
  LoadDictState(Report report) : super(report: report);
}