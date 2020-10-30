import 'package:inspector/model/report.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:latlong/latlong.dart';

class TotalReportBlocState {

  final Report report;
  final LatLng userLocation;
  final LatLng violationLocation;

  TotalReportBlocState(
    this.report,
    this.userLocation,
    this.violationLocation
  );

  TotalReportBlocState copyWith({Report report, LatLng userLocation, LatLng violationLocation}) {
    return TotalReportBlocState(
      report ?? this.report,
      userLocation ?? this.userLocation,
      violationLocation ?? this.violationLocation
    );
  }
}

class LoadDictState extends TotalReportBlocState {
  LoadDictState(Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class UserLocationLoadedState extends TotalReportBlocState {
  UserLocationLoadedState(Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class ViolationLocationLoadedState extends TotalReportBlocState {
  ViolationLocationLoadedState(Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class AddressFromLocationState extends TotalReportBlocState {
  AddressFromLocationState(Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class SuccessState extends TotalReportBlocState {
  SuccessState(Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class ErrorState extends TotalReportBlocState {
  final ApiException exception;
  
  ErrorState(this.exception, Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class DeletedState extends TotalReportBlocState {
  DeletedState(Report report, LatLng userLocation, LatLng violationLocation) : super(report, userLocation, violationLocation);
}

class TotalReportDialogBlocState {
  final ViolatorAddress address;

  TotalReportDialogBlocState(this.address);
}