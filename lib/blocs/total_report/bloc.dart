import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/services/dictionary_service.dart';

class TotalReportBloc extends Bloc<TotalReportBlocEvent, TotalReportBlocState> {
  TotalReportBloc(initialState) : super(initialState);

  final _dictionaryService = DictionaryService();

  // final _areasService = AreasService();
  // final _addressesService = AddressesService();
  // final _streetsService = StreetsService();
  // final _districtsService = DistrictsService();
  // final _specialObjectsService = SpecialObjectsService();
  // final _normativeActsService = NormativeActsService();
  // final _normativeActArticlessService = NormativeActArticlesService();
  // final _violationTypesService = ViolationTypesService();
  // final _violatorTypesService = ViolatorTypesService();
  // final _departmentCodesService = DepartmentCodesService();

  @override
  Stream<TotalReportBlocState> mapEventToState(TotalReportBlocEvent event) async* {
    if (event is LoadEvent) {
      try {

        final loaded = await _dictionaryService.isLoaded();

        if (!loaded) {
          yield LoadDictState(state.report);
          await Future.delayed(Duration(seconds: 2));
        }

        // print(await dict.isLoaded());

        // final areas = await _areasService.all();
        // final districts = await _districtsService.all();
        // final streets = await _streetsService.all();
        // final addresses = await _addressesService.all();
        // final specialObjects = await _specialObjectsService.all();
        // final normativeActs = await _normativeActsService.all();
        // final normativeActArticles = await _normativeActArticlessService.all();
        // final violationTypes = await _violationTypesService.all();
        // final violatorTypes = await _violatorTypesService.all();
        // final departmentCodes = await _departmentCodesService.all();

        // yield TotalReportBlocState(
        //   report: Report.empty(event.violationNotPresent),
        //   streets: streets, 
        //   addresses: addresses, 
        //   areas: areas, 
        //   districts: districts,
        //   specialObjects: specialObjects,
        //   normativeActs: normativeActs,
        //   normativeActArticles: normativeActArticles,
        //   violationTypes: violationTypes,
        //   violatorTypes: violatorTypes,
        //   departmentCodes: departmentCodes,
        // );
      } catch (ex) {
        print(ex);
      }
    } else if (event is SetViolationNotPresentEvent) {
      yield state.copyWith(
        report: state.report.copyWith(
          violationNotPresent: event.violationNotPresent
        ),
      );
    } if (event is ChangeViolatorEvent) { 
      final violators = state.report.violation.violators;
      Violator violator = violators[event.index];

      if (event is SetViolatorNotFoundEvent) {
        violator = violator.copyWith(violatorNotFound: event.violatorNotFound);
      } else if (event is SetViolatorForeignEvent) {
        violator = violator.copyWith(foreign: event.foreign);
      }

      violators[event.index] = violator;
      yield state.copyWith(
        report: state.report.copyWith(
          violation: state.report.violation.copyWith(
            violators: violators
          ),
        ),
      );
    } else if (event is AddViolatorEvent) {
      yield state.copyWith(
        report: state.report.copyWith(
          violation: state.report.violation.copyWith(
            violators: state.report.violation.violators..add(Violator.empty())
          ),
        ),
      );
    }
  } 
}