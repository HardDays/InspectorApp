import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/violation.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/services/addresses_service.dart';
import 'package:inspector/services/areas_service.dart';
import 'package:inspector/services/districts_service.dart';
import 'package:inspector/services/special_objects_service.dart';
import 'package:inspector/services/streets_service.dart';

class TotalReportBloc extends Bloc<TotalReportBlocEvent, TotalReportBlocState> {
  TotalReportBloc(initialState) : super(initialState);

  final _areasService = AreasService();
  final _addressesService = AddressesService();
  final _streetsService = StreetsService();
  final _districtsService = DistrictsService();
  final _specialObjectsService = SpecialObjectsService();

  @override
  Stream<TotalReportBlocState> mapEventToState(TotalReportBlocEvent event) async* {
    if (event is LoadEvent) {
      try {
        final areas = await _areasService.all();
        final districts = await _districtsService.all();
        final streets = await _streetsService.all();
        final addresses = await _addressesService.all();
        final specialObjects = await _specialObjectsService.all();

        yield TotalReportBlocState(
          report: Report.empty(event.violationNotPresent),
          streets: streets, 
          addresses: addresses, 
          areas: areas, 
          districts: districts,
          specialObjects: specialObjects
        );
      } catch (ex) {
        print(ex);
      }
    } else if (event is SetViolationNotPresentEvent) {
      yield state.copyWith(
        report: state.report.copyWith(
          violationNotPresent: event.violationNotPresent
        ),
      );
    } 
  } 
}