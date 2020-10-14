import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/street.dart';

class TotalReportBlocState {

  final bool violationNotPresent;
  final bool violatorNotFound;

  final List<Street> streets;
  final List<Area> areas;
  final List<District> districts;
  final List<Address> addresses;
  final List<SpecialObject> specialObjects;

  TotalReportBlocState({
    this.violationNotPresent = false,
    this.violatorNotFound = false,
    this.streets = const [],
    this.addresses = const [],
    this.areas = const [],
    this.districts = const [],
    this.specialObjects = const []
  });

  TotalReportBlocState copyWith({
    bool violationNotPresent,
    bool violatorNotFound,
  }) {
    return TotalReportBlocState(
      violationNotPresent: violationNotPresent ?? this.violationNotPresent,
      violatorNotFound: violatorNotFound ?? this.violatorNotFound,
      streets: streets,
      addresses: addresses,
      areas: areas,
      districts: districts,
      specialObjects: specialObjects
    );
  }

}