import 'package:inspector/model/report.dart';
import 'package:inspector/model/report_status_info.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:latlong/latlong.dart';

class TotalReportBlocState {

  final Report report;
  final LatLng userLocation;
  final LatLng violationLocation;
  final ReportStatusInfo reportStatusInfo;

  TotalReportBlocState(
    this.report,
    this.userLocation,
    this.violationLocation, 
    {this.reportStatusInfo}
  );

  TotalReportBlocState copyWith({Report report, LatLng userLocation, LatLng violationLocation, ReportStatusInfo reportStatusInfo}) {
    return TotalReportBlocState(
      report ?? this.report,
      userLocation ?? this.userLocation,
      violationLocation ?? this.violationLocation,
      reportStatusInfo: reportStatusInfo ?? this.reportStatusInfo,
    );
  }
}

class LoadDictState extends TotalReportBlocState {
  LoadDictState(Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class UserLocationLoadedState extends TotalReportBlocState {
  UserLocationLoadedState(Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class ViolationLocationLoadedState extends TotalReportBlocState {
  ViolationLocationLoadedState(Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class AddressFromLocationState extends TotalReportBlocState {
  AddressFromLocationState(Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class SuccessState extends TotalReportBlocState {
  SuccessState(Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class ErrorState extends TotalReportBlocState {
  final ApiException exception;
  
  ErrorState(this.exception, Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class DeletedState extends TotalReportBlocState {
  DeletedState(Report report, LatLng userLocation, LatLng violationLocation, {ReportStatusInfo reportStatusInfo}) : super(report, userLocation, violationLocation, reportStatusInfo: reportStatusInfo);
}

class TotalReportDialogBlocState {
  final ViolatorAddress address;

  TotalReportDialogBlocState(this.address);
}