import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/address_search.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/report_status.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_doc_type.dart';
import 'package:inspector/model/violator_info.dart';
import 'package:inspector/model/violator_info_ip.dart';
import 'package:inspector/model/violator_info_legal.dart';
import 'package:inspector/model/photo.dart';
import 'package:inspector/model/violator_info_official.dart';
import 'package:inspector/model/violator_info_private.dart';
import 'package:inspector/model/violator_type.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/providers/exceptions/unhadled_exception.dart';
import 'package:inspector/services/api/here_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/geo_service.dart';
import 'package:inspector/services/reports_service.dart';

import 'package:latlong/latlong.dart';

import 'dart:convert' as c;

class TotalReportBloc extends Bloc<TotalReportBlocEvent, TotalReportBlocState> {
  TotalReportBloc(initialState) : super(initialState);

  final _dictionaryService = DictionaryService();
  final _reportsService = ReportsService();
  final _geoService = GeoService();

  Future<Iterable<AddressSearch>> getSearchAddresses(String name) async {
    return await _geoService.autocomplete(name);
  }

   Future<AddressSearch> getGeocoding(String name) async {
    return await _geoService.geocode(name);
  }

  Future<Iterable<Area>> getAreas(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getAreas(name: name);
    }
  }

  Future<Iterable<District>> getDistricts(String name) async {
    final address = state.report.violation?.violationAddress;
    if (name.isNotEmpty) {
      return await _dictionaryService.getDitricts(name: name, areaId: address?.area?.id);
    }
  }

  Future<Iterable<Street>> getStreets(String name) async {
    final address = state.report.violation?.violationAddress;
    if (name.isNotEmpty) {
      return await _dictionaryService.getStreets(name: name, districtId: address?.district?.id);
    }
  }

  Future<Iterable<Address>> getAddresses(String houseNum) async {
    final address = state.report.violation?.violationAddress;
    if (houseNum.isNotEmpty) {
      return await _dictionaryService.getAddresses(houseNum: houseNum, streetId: address?.street?.id);
    }
  }

  Future<Iterable<ObjectCategory>> getObjectCategories(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getObjectCategories(name: name);
    }
  }

  Future<Iterable<NormativeAct>> getNormativeActs(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getNormativeActs(name: name);
    }
  }

  Future<Iterable<NormativeActArticle>> getNormativeActArticles(int index, String name) async {
    if (name.isNotEmpty) {
      final act = state.report.violation?.normativeActArticles[index];
      return await _dictionaryService.getNormativeActArticles(name: name, normativeActId: act?.normativeActId);
    }
  }

  Future<Iterable<ViolationType>> getViolationTypes(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getViolationTypes(name: name);
    }
  }

  Future<Iterable<ViolatorType>> getViolatorTypes(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getViolatorTypes(name: name);
    }
  }

  Future<Iterable<ViolatorDocumentType>> getViolatorDocumentTypes(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getViolatorDocumentTypes(name: name);
    }
  }

  Future<Iterable<DepartmentCode>> getDepartmentCodes(String name) async {
    if (name.isNotEmpty) {
      return await _dictionaryService.getDepartmentCodes(name: name);
    }
  }

  Future<Iterable<dynamic>> getViolators(int index, String name) async {
    final violatorType = state.report?.violation?.violators?.elementAt(index)?.type;
    if (name.isNotEmpty && violatorType != null) {
      if (violatorType.id == ViolatorTypeIds.legal) {
        return await _dictionaryService.getViolatorInfoLegals(name: name);
      } else if (violatorType.id == ViolatorTypeIds.official) {
        return await _dictionaryService.getViolatorInfoOfficials(name: name);
      } else if (violatorType.id == ViolatorTypeIds.private) {
        return await _dictionaryService.getViolatorInfoPrivates(name: name);
      } else if (violatorType.id == ViolatorTypeIds.ip) {
        return await _dictionaryService.getViolatorInfoIps(name: name);
      }
    }
  }

  @override
  Stream<TotalReportBlocState> mapEventToState(TotalReportBlocEvent event) async* {
    if (event is LoadEvent) {
      try {
        final loaded = await _dictionaryService.isLoaded();        
        if (!loaded) {
          yield LoadDictState(state.report, state.userLocation, state.violationLocation);
          await Future.delayed(Duration(seconds: 2));
          yield TotalReportBlocState(state.report, state.userLocation, state.violationLocation);
        } else {
          add(InitEvent(event.report));
        } 
      } catch (ex) {
        print(ex);
      }
    } else if (event is InitEvent) {
      final position = await Geolocator.getLastKnownPosition();
      if (position != null && position.latitude != 0 && position.longitude != 0) {
        yield UserLocationLoadedState(event.report, LatLng(position.latitude, position.longitude), state.violationLocation);
      }

      final address = state.report.violation?.violationAddress;
      if (address?.latitude != null && address?.longitude != null) {
        yield ViolationLocationLoadedState(event.report, null, LatLng(address.latitude, address.longitude));
      }
    } else if (event is SetViolationNotPresentEvent) {
      yield state.copyWith(
        report: state.report.copyWith(
          violationNotPresent: event.violationNotPresent,
          violation: state.report.violation ?? Violation.empty()
        ),
      );
    } else if (event is ChangeViolationEvent) {
      Violation violation = state.report.violation;
      if (event is SetViolationAreaEvent) {
        violation = violation.copyWith(
          violationAddress: Address(
            area: event.area,
          ),
        );
      } else if (event is SetViolationDistrictEvent) {
        violation = violation.copyWith(
          violationAddress: Address(
            district: event.district,
            area: violation.violationAddress.area,
          ),
        );
      } else if (event is SetViolationStreetEvent) {
        violation = violation.copyWith(
          violationAddress: Address(
            street: event.street,
            area: violation.violationAddress.area,
            district: violation.violationAddress.district,
          ),
        );
      } else if (event is SetViolationAddressEvent) {
        violation = violation.copyWith(
          violationAddress: violation.violationAddress.copyWith(
            specifiedAddress: event.address?.specifiedAddress,
            houseNum: event.address?.houseNum,
            constructionNum: event.address?.constructionNum,
            buildNum: event.address?.buildNum,
            id: event.address?.id
          ),
        );
      } else if (event is SetViolationOjbectCategoryEvent) {
        violation = violation.copyWith(
          objectCategory: event.objectCategory
        );
      } else if (event is SetViolationNormativeActEvent) {
        final articles = violation.normativeActArticles;
        articles[event.index] = NormativeActArticle(
          normativeActId: event.normativeAct?.id,
        );
        violation = violation.copyWith(
          normativeActArticles: articles
        );
      } else if (event is SetViolationNormativeActArticleEvent) {
        final articles = violation.normativeActArticles;
        articles[event.index] = event.normativeActArticle;
        violation = violation.copyWith(
          normativeActArticles: articles
        );
      } else if (event is SetViolationTypeEvent) {
        violation = violation.copyWith(
          violationType: event.violationType
        );
      } else if (event is AddViolationActEvent) {
        violation = violation.copyWith(
          normativeActArticles: violation.normativeActArticles..add(NormativeActArticle())
        );
      }
      yield state.copyWith(
        report: state.report.copyWith(
          violation: violation
        ),
      );
    } else if (event is ChangeViolatorEvent) { 
      final violators = state.report.violation.violators;
      Violator violator = violators[event.index];
      if (event is SetViolatorNotFoundEvent) {
        violator = violator.copyWith(
          violatorNotFound: event.violatorNotFound,
        );
      } else if (event is SetViolatorForeignEvent) {
        violator = violator.copyWith(
          foreign: event.foreign
        );
      } else if (event is SetViolatorTypeEvent) {
        ViolatorInfo violatorInfo;
        if (event.type != null) {
          if (event.type.id == ViolatorTypeIds.ip) {
            violatorInfo = ViolatorInfoIp();
          } else if (event.type.id == ViolatorTypeIds.private) {
            violatorInfo = ViolatorInfoPrivate();
          } else if (event.type.id == ViolatorTypeIds.official) {
            violatorInfo = ViolatorInfoOfficial();
          } else if (event.type.id == ViolatorTypeIds.legal) {
            violatorInfo = ViolatorInfoLegal();
          }
        }
        violator = Violator.empty().copyWith(
          type: event.type,
          violatorPerson: violatorInfo
        );
        // violator = violator.copyWith(
        //   type: event.type,
        //   violatorPerson: violatorInfo
        // );
      } else if (event is SetViolatorDepartmentCodeEvent) {
        violator = violator.copyWith(
          departmentCode: event.departmentCode
        );
      } else if (event is SetViolatorInfoEvent) {
        violator = violator.copyWith(
          violatorPerson: event.violatorPerson ?? ViolatorInfo()
        );
      } else if (event is SetViolatorDocumentTypeEvent) {
        final person = violator.violatorPerson;
        if (person is ViolatorInfoPrivate) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              docType: event.documentType
            ),
          );
        }
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
    } else if (event is SaveReportEvent) {
      final statuses = await _dictionaryService.getReportStatuses(id: event.status);
      final status = statuses.first;
      final photos = event.photos.map((e) => c.base64Encode(e)).map((e) => Photo(data: e)).toList();
      Report report = state.report;
      if (state.report.violationNotPresent) {
        report = report.copyWith(
          photos: photos
        );
      } else {
        final violation = state.report.violation;
        report = report.copyWith(
          reportStatus: status,
          reportDate: state.report.reportDate ?? DateTime.now(),
          reportNum: state.report.reportNum ?? Random().nextInt(1000000).toString(),
          violation: violation.copyWith(
            violators: event.violators,
            photos: photos,
            codexArticle: event.codexArticle,
            violationDescription: event.violationDescription,
            violationDate: violation.violationDate ?? DateTime.now(),
            violationAddress: violation.violationAddress.copyWith(
              specifiedAddress: event.specifiedAddress ,
              latitude: state.violationLocation?.latitude,
              longitude: state.violationLocation?.longitude
            ),
          ),
        );
      }
      try {
        final local = status.id == ReportStatusIds.new_ || status.id == ReportStatusIds.project;
        final res = await _reportsService.create(report, local: local);
        yield SuccessState(res, state.userLocation, state.violationLocation);
      } on ApiException catch (ex) {
        yield ErrorState(ex, state.report, state.userLocation, state.violationLocation);
      } catch (ex) {
        yield ErrorState(UnhandledException(ex.toString()), state.report, state.userLocation, state.violationLocation);
      }
    } else if (event is RemoveReportEvent) {
      await _reportsService.remove(state.report);
      yield DeletedState(state.report, state.userLocation, state.violationLocation); 
    } else if (event is SetViolationLocationEvent) {
      yield TotalReportBlocState(state.report, state.userLocation, event.location);
    } else if (event is FlushEvent) {
      yield TotalReportBlocState(state.report, state.userLocation, state.violationLocation);
    }
  } 
}