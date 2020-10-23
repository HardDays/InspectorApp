import 'package:inspector/model/report.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:latlong/latlong.dart';

class TotalReportBlocState {

  final Report report;
  final LatLng location;

  TotalReportBlocState(
    this.report,
    this.location
  );

  TotalReportBlocState copyWith({Report report, LatLng location}) {
    return TotalReportBlocState(
      report ?? this.report,
      location ?? this.location
    );
  }
}

class LoadDictState extends TotalReportBlocState {
  LoadDictState(Report report, LatLng location) : super(report, location);
}

class LocationLoadedState extends TotalReportBlocState {
  LocationLoadedState(Report report, LatLng location) : super(report, location);
}

class SuccessState extends TotalReportBlocState {
  SuccessState(Report report, LatLng location) : super(report, location);
}

class ErrorState extends TotalReportBlocState {
  final ApiException exception;
  
  ErrorState(Report report, LatLng location, this.exception) : super(report, location);
}

class DeletedState extends TotalReportBlocState {
  DeletedState(Report report, LatLng location) : super(report, location);
}