import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/services/dictionary_service.dart';

class TotalReportBloc extends Bloc<TotalReportBlocEvent, TotalReportBlocState> {
  TotalReportBloc(initialState) : super(initialState);

  final _dictionaryService = DictionaryService();

  Future<Iterable<Area>> getAreas(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getAreas(name: name);
    }
  }

  Future<Iterable<District>> getDistricts(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getDitricts(name: name);
    }
  }

  Future<Iterable<Street>> getStreets(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getStreets(name: name);
    }
  }

  Future<Iterable<Address>> getAddresses(String houseNum) async {
    if (houseNum.isNotEmpty) {
      return await _dictionaryService.getAddresses(houseNum: houseNum);
    }
  }

  @override
  Stream<TotalReportBlocState> mapEventToState(TotalReportBlocEvent event) async* {
    if (event is LoadEvent) {
      try {
        final loaded = await _dictionaryService.isLoaded();        
        if (!loaded) {
          yield LoadDictState(state.report);
          await Future.delayed(Duration(seconds: 2));
          yield TotalReportBlocState(
            report: state.report
          );
        } else {
          add(InitEvent(event.violationNotPresent));
        } 
      } catch (ex) {
        print(ex);
      }
    } else if (event is InitEvent) {
      try {
        // final areas = await _dictionaryService.getAreas();
        // final districts = await _dictionaryService.getDitricts();
        // final streets = await _dictionaryService.getStreets();
        // final addresses = await _dictionaryService.getAddresses();
        // final specialObjects = await _dictionaryService.getSpecialObjects();
        // final normativeActs = await _dictionaryService.getNormativeActs();
        // final normativeActArticles = await _dictionaryService.getNormativeActArticles();
        // final violationTypes = await _dictionaryService.getViolationTypes();
        // final violatorTypes = await _dictionaryService.getViolatorTypes();
        // final departmentCodes = await _dictionaryService.getDepartmentCodes();

        yield TotalReportBlocState(
          report: Report.empty(event.violationNotPresent),
          //areas: areas, 
          // specialObjects: specialObjects,
          // normativeActs: normativeActs,
          // violationTypes: violationTypes,
          // violatorTypes: violatorTypes,
          // departmentCodes: departmentCodes,
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