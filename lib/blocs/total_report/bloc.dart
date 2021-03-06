import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/address_search.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_code.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/kladdr_address_object_type.dart';
import 'package:inspector/model/normative_act.dart';
import 'package:inspector/model/normative_act_article.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violation.dart';
import 'package:inspector/model/violation_type.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/model/violator_address.dart';
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
import 'package:inspector/services/api/datata_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/geo_service.dart';
import 'package:inspector/services/objectdb/objectdb_persistance_service.dart';
import 'package:inspector/services/reports_service.dart';

import 'package:latlong/latlong.dart';

import 'dart:convert' as c;

import 'package:uuid/uuid.dart';

class TotalReportDialogBloc extends Bloc<TotalReportDialogBlocEvent, TotalReportDialogBlocState> {
  TotalReportDialogBloc(initialState) : super(initialState);

  final _dadataService = DadataService();
  final _dictionaryService = DictionaryService();

  Future<Iterable<ViolatorAddress>> getAddressSubjects(int index, String name) async {
    if (name.isNotEmpty) {
      return await _dadataService.suggest(name, fromBound: 'region', toBound: 'region');
    }
    return null;
  }

  Future<Iterable<ViolatorAddress>> getAddressRegions(int index, String name) async {
    if (name.isNotEmpty) {
      return await _dadataService.suggest(name, locations: [{'region': state.address?.subjectName}], fromBound: 'area', toBound: 'area');
    }
    return null;
  }

  Future<Iterable<ViolatorAddress>> getAddressCities(int index, String name) async {
   if (name.isNotEmpty) {
      return await _dadataService.suggest(name, locations: [{'region': state.address?.subjectName}], fromBound: 'city', toBound: 'city');
    }
    return null;
  }

  Future<Iterable<ViolatorAddress>> getAddressSettlements(int index, String name) async {
    if (name.isNotEmpty) {
      return await _dadataService.suggest(name, locations: [{'area': state.address?.regionName, 'region': state.address?.subjectName}], fromBound: 'settlement', toBound: 'settlement');
    }
    return null;
  }

  Future<Iterable<ViolatorAddress>> getAddressStreets(int index, String name) async {
    if (name.isNotEmpty) {
      return await _dadataService.suggest(name, locations: [{'area': state.address?.regionName, 'region': state.address?.subjectName, 'city': state.address?.cityName, 'settlement': state.address?.placeName}], fromBound: 'street', toBound: 'street');
    }
    return null;
  }

  Future<Iterable<KladdrAddressObjectType>> getKladdrAddressType(String name, String level) async {
    return await _dictionaryService.getKladdAddressTypes(name: name, level: level);
  }

  @override
  Stream<TotalReportDialogBlocState> mapEventToState(TotalReportDialogBlocEvent event) async* {
    yield TotalReportDialogBlocState(event.address);
  }
}

class TotalReportBloc extends Bloc<TotalReportBlocEvent, TotalReportBlocState> {
  static const tinaoAreas = {3496271, 3496272};

  TotalReportBloc(initialState) : super(initialState);

  int violationIndex = 0;

  final _persistanceService = ObjectDbPersistanceService();
  final _dictionaryService = DictionaryService();
  final _reportsService = ReportsService();
  final _geoService = GeoService();

  Future<Iterable<AddressSearch>> getSearchAddresses(String name) async {
    return await _geoService.autocomplete(name);
  }

   Future<AddressSearch> getGeocoding(String name) async {
    return await _geoService.geocode(name);
  }

  Future<Iterable<Area>> getAreas(String name, bool tinao) async {
    final areas = await _dictionaryService.getAreas(name: name);
    if (tinao) {
      return areas.where((e) => tinaoAreas.contains(e.id));
    } else {
      return areas;
    }
  }

  Future<Iterable<District>> getDistricts(String name, bool tinao) async {
    final address = state.report.violation(violationIndex)?.violationAddress;
    final districts = await _dictionaryService.getDitricts(name: name, areaId: address?.area?.id);
    if (tinao) {
      return districts.where((e) => tinaoAreas.contains(e.areaId));
    } else {
      return districts;
    }
  }

  Future<Iterable<Street>> getStreets(String name) async {
    final address = state.report.violation(violationIndex)?.violationAddress;
    return await _dictionaryService.getStreets(name: name, districtId: address?.district?.id);
  }

  Future<Iterable<Address>> getAddresses(String houseNum) async {
    final address = state.report.violation(violationIndex)?.violationAddress;
    if (address?.street?.id != null) {
      return await _dictionaryService.getAddresses(houseNum: houseNum, streetId: address?.street?.id);
    }
    return null;
  }

  Future<Iterable<ObjectCategory>> getObjectCategories(String name) async {
   // if (name.isNotEmpty) {
      return await _dictionaryService.getObjectCategories(name: name);
   // }
  }

  Future<Iterable<NormativeAct>> getNormativeActs(String name) async {
   // if (name.isNotEmpty) {
      return await _dictionaryService.getNormativeActs(name: name);
   // }
  }

  Future<Iterable<NormativeActArticle>> getNormativeActArticles(int index, String name) async {
    final act = state.report.violation(violationIndex)?.normativeActArticles[index];
    if (act?.normativeActId != null) {
      return await _dictionaryService.getNormativeActArticles(name: name, normativeActId: act.normativeActId);
    }
    return null;
  }

  Future<Iterable<ViolationType>> getViolationTypes(String name) async {
    //if (name.isNotEmpty) {
      return await _dictionaryService.getViolationTypes(name: name);
    //}
  }

  Future<Iterable<ViolatorType>> getViolatorTypes(String name) async {
    //if (name.isNotEmpty) {
      return await _dictionaryService.getViolatorTypes(name: name);
    //}
  }

  Future<Iterable<ViolatorDocumentType>> getViolatorDocumentTypes(String name) async {
    //if (name.isNotEmpty) {
      return await _dictionaryService.getViolatorDocumentTypes(name: name);
    //}
  }

  Future<Iterable<DepartmentCode>> getDepartmentCodes(String name) async {
    //if (name.isNotEmpty) {
      return await _dictionaryService.getDepartmentCodes(name: name);
    //}
  }

  Future<District> getDistrict(int id) async {
    final districts = await _dictionaryService.getDitrictsById(id: id);
    if (districts.isNotEmpty) {
      return districts.first;
    }
    return null;
  }

  Future<Area> getArea(int id) async {
    final areas = await _dictionaryService.getAreas(id: id);
    if (areas.isNotEmpty) {
      return areas.first;
    }
    return null;
  }


  Future<Iterable<dynamic>> getViolators(int index, String name) async {
    final violatorType = state.report?.violation(violationIndex)?.violators?.elementAt(index)?.type;
    if (violatorType != null) {
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
    return null;
  }

  @override
  Stream<TotalReportBlocState> mapEventToState(TotalReportBlocEvent event) async* {
    if (event is LoadEvent) {
      try {
        final loaded = await _dictionaryService.isLoaded();        
        if (!loaded) {
          yield LoadDictState(state.report, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo);
          await Future.delayed(Duration(seconds: 2));
          yield TotalReportBlocState(state.report, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo);
        } else {
          add(InitEvent(event.violationIndex, event.report));
        } 
      } catch (ex) {
        print(ex);
      }
    } else if (event is InitEvent) {
      violationIndex = event.violationIndex;
      final position = await Geolocator.getLastKnownPosition();
      if(await _persistanceService.getDataSendingState()) {
        if(!state.report.isNew) {
          final reportStatusInfo = await _reportsService.getReportStatusInfo(state.report);
          yield(state.copyWith(reportStatusInfo: reportStatusInfo));
        }
      }
      if (position != null && position.latitude != 0 && position.longitude != 0) {
        yield UserLocationLoadedState(event.report, LatLng(position.latitude, position.longitude), state.violationLocation, reportStatusInfo: state.reportStatusInfo);
      }
      final address = state.report.violation(violationIndex)?.violationAddress;
      if (address?.latitude != null && address?.longitude != null) {
        yield ViolationLocationLoadedState(event.report, state.userLocation, LatLng(address.latitude, address.longitude), reportStatusInfo: state.reportStatusInfo);
      }
    } else if (event is SetViolationNotPresentEvent) {
      yield state.copyWith(
        report: state.report.copyWith(
          violationNotPresent: event.violationNotPresent,
          violations: event.violationNotPresent ? (state.report.violations) : [Violation.empty()]
        ),
      );
    } else if (event is ChangeViolationEvent) {
      Violation violation = state.report.violation(violationIndex);
      if (event is SearchAddressByLocation) {
        if (state.userLocation != null) {
          final res = await _geoService.reverseGeocode(state.userLocation.latitude, state.userLocation.longitude);
          if (res != null) {
            Area area;
            District district;
            Street street;
            Address address;
            if (res.district != null) {
              final name = res.district.split(' ').last;
              final districts = await _dictionaryService.getDitrictsByName(name: name);
              if (districts.isNotEmpty) {
                district = districts.first;
                final areas = await _dictionaryService.getAreas(id: district.areaId);
                if (areas.isNotEmpty) {
                  area = areas.first;
                }
              }
            }
            if (district != null && res.street != null) {
              for (final token in res.street.split(' ')) {
                final streets = await _dictionaryService.getStreets(name: token, districtId: district.id);
                if (streets.isNotEmpty) {
                  street = streets.first;
                  break;
                }
              }
            }
            if (street != null && res.house != null) {
              final addresses = await _dictionaryService.getAddresses(houseNum: res.house, streetId: street.id);
              if (addresses.isNotEmpty) {
                address = addresses.first;
              }
            }
            violation = violation.copyWith(
              violationAddress: Address(
                area: area,
                district: district,
                street: street,
                specifiedAddress: address?.specifiedAddress,
                houseNum: address?.houseNum,
                constructionNum: address?.constructionNum,
                buildNum: address?.buildNum,
                id: address?.id,
                latitude: state.userLocation.latitude,
                longitude: state.userLocation.longitude
              ),
            );
            final violations = state.report.violations;
            violations[violationIndex] = violation;
            yield AddressFromLocationState(state.report.copyWith(violations: violations), state.userLocation, LatLng(state.userLocation.latitude, state.userLocation.longitude), reportStatusInfo: state.reportStatusInfo);
          }
        }
      } else if (event is SetViolationAreaEvent) {
        violation = violation.copyWith(
          violationAddress: Address(
            area: event.area,
          ),
        );
      } else if (event is SetViolationDistrictEvent) {
        final area = event.district != null ? await getArea(event.district?.areaId) : violation.violationAddress.area;
        violation = violation.copyWith(
          violationAddress: Address(
            district: event.district,
            area: area
          ),
        );
      } else if (event is SetViolationStreetEvent) {
        final area =  event.street != null ? await getArea(event.street?.areaId) : violation.violationAddress.area;
        final district = event.street != null ? await getDistrict(event.street.districtId) : violation.violationAddress.district;
        violation = violation.copyWith(
          violationAddress: Address(
            street: event.street,
            area: area,
            district: district,
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
      } else if (event is DeleteViolationNormativeActEvent) {
        final articles = violation.normativeActArticles;
        articles.removeAt(event.index);
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
      if (!(event is SearchAddressByLocation)) { 
        final violations = state.report.violations;
        violations[violationIndex] = violation;
        yield state.copyWith(
          report: state.report.copyWith(
            violations: violations
          ),
        );
      }
      if (event is SetViolationAddressEvent) {
        final resLocation = await _geoService.geocode(event.address.toSearchString());
        await Future.delayed(const Duration(milliseconds: 300));
        if (resLocation != null) {
          yield AddressFromLocationState(state.report, null, LatLng(resLocation.lat, resLocation.lng), reportStatusInfo: state.reportStatusInfo);
        }
      }
    } else if (event is ChangeViolatorEvent) { 
      final violators = state.report.violation(violationIndex).violators;
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
        violator = Violator.empty(violatorNotFound: violator?.violatorNotFound ?? false).copyWith(
          type: event.type,
          violatorPerson: violatorInfo
        );
      } else if (event is SetViolatorDepartmentCodeEvent) {
        violator = violator.copyWith(
          departmentCode: event.departmentCode
        );
      } else if (event is SetViolatorInfoEvent) {
        ViolatorInfo violatorInfo = violator?.violatorPerson;
        if (violator?.type?.id == ViolatorTypeIds.ip) {
          violatorInfo = ViolatorInfoIp();
        } else if (violator?.type?.id== ViolatorTypeIds.private) {
          violatorInfo = ViolatorInfoPrivate();
        } else if (violator?.type?.id == ViolatorTypeIds.official) {
          violatorInfo = ViolatorInfoOfficial();
        } else if (violator?.type?.id == ViolatorTypeIds.legal) {
          violatorInfo = ViolatorInfoLegal();
        }
        violator = violator.copyWith(
          violatorPerson: event.violatorPerson ?? violatorInfo
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
      } else if (event is SetViolatorRegistrationAddressEvent) {
        final person = violator.violatorPerson;
        if (person is ViolatorInfoPrivate) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              registrationAddress: event.address
            ),
          );
        } else if (person is ViolatorInfoIp) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              registrationAddress: event.address
            ),
          );
        }
      } else if (event is SetViolatorLegalAddressEvent) {
        final person = violator.violatorPerson;
        if (person is ViolatorInfoOfficial) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              orgLegalAddress: event.address
            ),
          );
        } else if (person is ViolatorInfoLegal) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              legalAddress: event.address
            ),
          );
        }
      } else if (event is SetViolatorPostalAddressEvent) {
        final person = violator.violatorPerson;
        if (person is ViolatorInfoOfficial) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              orgPostalAddress: event.address
            ),
          );
        } else if (person is ViolatorInfoLegal) {
          violator = violator.copyWith(
            violatorPerson: person.copyWith(
              postalAddress: event.address
            ),
          );
        }
      }
      if (event is DeleteViolatorEvent) {
        violators.removeAt(event.index);
      } else {
        violators[event.index] = violator;
      }
      final violations = state.report.violations;
      violations[violationIndex] = state.report.violation(violationIndex).copyWith(
        violators: violators
      );
      yield state.copyWith(
        report: state.report.copyWith(
          violations: violations
        ),
      );
    } else if (event is AddViolatorEvent) {
      final violations = state.report.violations;
      final violation = state.report.violation(violationIndex);
      violations[violationIndex] =  violation.copyWith(
        violators: violation.violators..add(Violator.empty())
      );
      yield state.copyWith(
        report: state.report.copyWith(
          violations: violations
        ),
      );
    } else if (event is SaveReportEvent) {
      final statuses = await _dictionaryService.getReportStatuses(id: event.status);
      final status = statuses.first;
      final photosBase64 = event.photos.map((e) => c.base64Encode(e)).toList();
      final photos = List.generate(photosBase64.length, (i) => Photo(data: photosBase64[i], name: event.photoNames[i]));
      final user = await _persistanceService.getUser();
      final local = status.id == ReportStatusIds.new_ || status.id == ReportStatusIds.project;
      final date = state.report.reportDate ?? DateTime.now();
      final lastNum = await _reportsService.lastNumber();
      // final number = state.report.reportNum ?? '$lastNum ${DateFormat('dd.MM.yyyy').format(date)}';
      if (state.report.reportNum == null) {
        await _reportsService.updateLastNumber();
      }
      final number = state.report.reportNum ?? '$lastNum';
      final localId = state.report.localId ?? Uuid().v1();

      Report report = state.report;
      if (state.report.violationNotPresent) {
        report = report.copyWith(
          userId: user?.id,
          localId: localId,
          reportStatus: status,
          reportDate: date,
          reportNum: number,
          reportAuthor: user,
          photos: photos,
          violations: []
        );
      } else {
        final violation = state.report.violation(violationIndex);

        LatLng location = state.violationLocation;
        if (location == null) {
          final resLocation = await _geoService.geocode(violation.violationAddress.toSearchString());
          if (resLocation != null) {
            location = LatLng(resLocation.lat, resLocation.lng);
          }
        }
                
        final violations = state.report.violations;
        violations[violationIndex] = violation.copyWith(
          violators: event.violators,
          photos: photos,
          codexArticle: event.codexArticle,
          violationDescription: event.violationDescription,
          violationDate: violation.violationDate ?? date.subtract(Duration(minutes: 5)),
          violationAddress: violation.violationAddress.copyWith(
            specifiedAddress: event.specifiedAddress ,
            latitude: location?.latitude,
            longitude: location?.longitude
          ),
        );

        report = report.copyWith(
          userId: user?.id,
          localId: localId,
          reportStatus: status,
          reportDate: date,
          reportNum: number,
          reportAuthor: user,
          violations: violations,
        );
      }
      try {
        final res = await _reportsService.create(report, local: local);
        yield SuccessState(res, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo);
      } on ApiException catch (ex) {
        //final status = await _dictionaryService.getReportStatuses(id: ReportStatusIds.new_);
        final res = await _reportsService.create(report, error: '${ex.message} ${ex.details}', local: true);
        yield ErrorState(ex, res, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo);
      } catch (ex) {
        yield ErrorState(UnhandledException(ex.toString()), state.report, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo);
      }
    } else if (event is RemoveReportEvent) {
      await _reportsService.remove(state.report);
         DeletedState(state.report, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo); 
    } else if (event is SetViolationLocationEvent) {
      yield TotalReportBlocState(state.report, state.userLocation, event.location, reportStatusInfo: state.reportStatusInfo);
    } else if (event is FlushEvent) {
      yield TotalReportBlocState(state.report, state.userLocation, state.violationLocation, reportStatusInfo: state.reportStatusInfo);
    }
  } 
}