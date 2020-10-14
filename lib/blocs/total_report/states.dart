import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';

class TotalReportBlocState {

  final Report report;

  final List<Street> streets;
  final List<Area> areas;
  final List<District> districts;
  final List<Address> addresses;
  final List<SpecialObject> specialObjects;

  TotalReportBlocState({
    this.report,
    this.streets = const [],
    this.addresses = const [],
    this.areas = const [],
    this.districts = const [],
    this.specialObjects = const []
  });

  TotalReportBlocState copyWith({Report report}) {
    return TotalReportBlocState(
      report: report,
      streets: streets,
      addresses: addresses,
      areas: areas,
      districts: districts,
      specialObjects: specialObjects
    );
  }

}