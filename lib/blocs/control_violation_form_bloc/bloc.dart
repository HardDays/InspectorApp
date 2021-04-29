import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/event.dart';
import 'package:inspector/blocs/control_violation_form_bloc/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/geo_service.dart';
import 'package:inspector/services/location/location.dart';
import 'package:inspector/services/location/location_service.dart';
import 'package:inspector/extensions.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:inspector/style/colors.dart';

class ControlViolationFormBloc
    extends Bloc<ControlViolationFormEvent, CotnrolViolationFormState> {
  ControlViolationFormBloc(DCViolation initialViolation, this.onConfirm,
      this.locationService, this.dictionaryService, this.networkStatusService,
      {this.notificationBloc})
      : super(
          CotnrolViolationFormState(
            address: initialViolation?.btiAddress ?? Address(),
            contractor: initialViolation?.violator ?? Contractor(name: ''),
            critical: initialViolation?.critical ?? false,
            description: initialViolation?.description ?? '',
            objectElement:
                initialViolation?.objectElement ?? ObjectElement(name: ''),
            photos: initialViolation?.photos ?? <DCPhoto>[],
            setAddressByGeoLocation: false,
            targetLandmark: initialViolation?.address ?? '',
            violationAdditionalFeature:
                initialViolation?.additionalFeatures?.first ??
                    ViolationAdditionalFeature(name: ''),
            showClassificationField: initialViolation == null,
            violationClassification:
                initialViolation?.eknViolationClassification ??
                    ViolationClassification(
                      violationName: ViolationName(
                        name: '',
                      ),
                    ),
            violationClassificationNoEkn:
                initialViolation?.otherViolationClassification ??
                    ViolationClassification(
                      violationName: ViolationName(
                        name: '',
                      ),
                    ),
          ),
        ) {
    _violation = initialViolation ?? DCViolation();
    _locationStreamSubscription =
        locationService.subscribeToLocation.listen((location) {
      _location = location;
    });
  }
  final NotificationBloc notificationBloc;
  final LocationService locationService;
  final DictionaryService dictionaryService;
  final void Function(DCViolation) onConfirm;
  final NetworkStatusService networkStatusService;

  final _geoService = GeoService(); // TODO: fix it

  DCViolation _violation;

  Location _location;
  StreamSubscription<Location> _locationStreamSubscription;

  @override
  Stream<CotnrolViolationFormState> mapEventToState(
          ControlViolationFormEvent event) =>
      event.map(
        setAddressEvent: _onSetAddressEvent,
        setContractorEvent: _onSetContractorEvent,
        setContractorStringEvent: _onSetContractorStringEvent,
        setCriticalEvent: _onSetCriticalEvent,
        setDescriptionEvent: _onSetDescriptionEvent,
        setObjectElement: _onSetObjectElement,
        setObjectElementString: _onSetObjectElementString,
        setTargetLandmark: _onSetTargetLandmark,
        setViolationAdditionalFeatureEvent:
            _onSetViolationAdditionalFeatureEvent,
        setViolationAdditionalFeatureStringEvent:
            _onSetViolationAdditionalFeatureStringEvent,
        setUseGeoLocationForAddressEvent: _onSetUseGeoLocationForAddressEvent,
        addPhotoEvent: (event) async* {
          final location = await this.location;
          yield (state.copyWith(
            photos: List.from(state.photos)
              ..add(
                DCPhoto(
                  data: base64.encode(
                    event.photo,
                  ),
                  name: event.name,
                ).let(
                  (DCPhoto photo) => location.map(
                    (value) => photo.copyWith(
                      geometryX: value.latitude,
                      geometryY: value.longitude,
                    ),
                    noLocationProvided: (value) => photo,
                  ),
                ),
              ),
          ));
        },
        removePhotoEvent: (event) async* {
          yield (state.copyWith(
            photos: List.from(state.photos)..removeAt(event.index),
          ));
        },
        rotatePhotoEvent: (event) async* {
          final photo = state.photos[event.index];
          yield (state.copyWith(
            photos: List.from(state.photos)
              ..removeAt(event.index)
              ..insert(
                event.index,
                photo.copyWith(data: base64.encode(event.photo)),
              ),
          ));
        },
        setViolationClassifications: (event) async* {
          if (event.classification != null) {
            yield (state.copyWith(
              violationClassification: ViolationClassification(
                id: event.classification.id,
                violationName: event.classification.violationName,
              ),
            ));
          } else {
            add(SetViolationClassificationString(''));
          }
        },
        setViolationClassificationString: (event) async* {
          yield (state.copyWith(
            violationClassification: ViolationClassification(
              violationName: ViolationName(
                name: event.classification,
              ),
            ),
          ));
        },
        setViolationClassificationsNoEkn: (event) async* {
          if (event.classification != null) {
            yield (state.copyWith(
              violationClassificationNoEkn: ViolationClassification(
                id: event.classification.id,
                violationName: event.classification.violationName,
              ),
            ));
          } else {
            add(SetViolationClassificationStringNoEkn(''));
          }
        },
        setViolationClassificationNoEknString: (event) async* {
          yield (state.copyWith(
            violationClassificationNoEkn: ViolationClassification(
              violationName: ViolationName(
                name: event.classification,
              ),
            ),
          ));
        },
        saveEvent: (event) async* {
          final newState = _validate(state);
          if (newState.isValid()) {
            if (newState.photos.isEmpty) {
              ScaffoldMessenger.of(event.context).showSnackBar(
                SnackBar(
                  backgroundColor: ProjectColors.darkBlue,
                  content: Text(
                    'Необходимо загрузить хотя бы одну фотографию'
                  ),
                ),
              ); // TODO: fix it, use NotificationBloc
              // notificationBloc.add(SnackBarNotificationEvent(
              //     'Необходимо загрузить хотя бы одну фотографию'));
            } else {
              onConfirm(
                _violation.copyWith(
                  btiAddress: state.address,
                  address: state.targetLandmark,
                  objectElement: state.objectElement,
                  description: state.description,
                  eknViolationClassification: state
                          .violationClassification.violationName.name.isNotEmpty
                      ? state.violationClassification
                      : null,
                  otherViolationClassification: state
                          .violationClassificationNoEkn
                          .violationName
                          .name
                          .isNotEmpty
                      ? state.violationClassificationNoEkn
                      : null,
                  violator: state.contractor,
                  critical: state.critical,
                  additionalFeatures: [state.violationAdditionalFeature],
                  photos: state.photos,
                ),
              );
            }
          } else {
            yield newState;
          }
        },
      );

  Stream<CotnrolViolationFormState> _onSetAddressEvent(
      SetAddressEvent event) async* {
    yield (state.copyWith(
      address: event.address,
    ));
  }

  Stream<CotnrolViolationFormState> _onSetContractorEvent(
      SetContractorEvent event) async* {
    if (event.contractor != null) {
      yield (state.copyWith(
        contractor: event.contractor,
      ));
    } else {
      add(SetContractorStringEvent(''));
    }
  }

  Stream<CotnrolViolationFormState> _onSetContractorStringEvent(
      SetContractorStringEvent event) async* {
    yield (state.copyWith(
      contractor: Contractor(name: event.contractor),
    ));
  }

  Stream<CotnrolViolationFormState> _onSetCriticalEvent(
      SetCriticalEvent event) async* {
    yield (state.copyWith(critical: event.value));
  }

  Stream<CotnrolViolationFormState> _onSetUseGeoLocationForAddressEvent(
      SetUseGeoLocationForAddressEvent event) async* {
    if ((await networkStatusService.actual).connectionStatus !=
        ConnectionStatus.online) {
      notificationBloc.add(SnackBarNotificationEvent(
          'Невозможно определить адрес по местоположению без сети Интернет'));
    } else {
      yield* location.map<Stream<CotnrolViolationFormState>>(
        (location) async* {
          final res = await _geoService.reverseGeocode(
              location.latitude, location.longitude);
          Address address;
          if (res.street != null) {
            String street = res.street;
            final streets = <Street>[];
            while (streets.isEmpty) {
              final r = await dictionaryService.getStreets(name: res.street);
              streets.addAll(r);
              street = street.substring(0, street.lastIndexOf(' '));
            }
            if (res.house != null) {
              final addresses = await dictionaryService.getAddresses(
                  streetId: streets.first.id);
              if (addresses.isNotEmpty) {
                address = addresses[0];
              }
            }
            if (address == null) {
              address = (await dictionaryService.getAddresses(
                  streetId: streets.first.id))[0];
            }
          }
          if (address == null) {
            notificationBloc.add(SnackBarNotificationEvent(
                'Не удалось определить адрес по местоположению'));
          } else {
            notificationBloc.add(SnackBarNotificationEvent('Проверьте адрес'));
          }
          yield state.copyWith(
              setAddressByGeoLocation: event.value,
              address: address ?? state.address);
        },
        noLocationProvided: (_) async* {
          notificationBloc.add(SnackBarNotificationEvent(
              'Не удалось определить местоположение'));
        },
      );
    }
  }

  //yield (state.copyWith(setAddressByGeoLocation: event.value));
  // notificationBloc
  //     .add(SnackBarNotificationEvent('Этот функционал пока не реализован'));

  Stream<CotnrolViolationFormState> _onSetDescriptionEvent(
      SetDescriptionEvent event) async* {
    yield (state.copyWith(description: event.description));
  }

  Stream<CotnrolViolationFormState> _onSetObjectElement(
      SetObjectElement event) async* {
    if (event.objectElement != null) {
      yield (state.copyWith(
        objectElement: event.objectElement,
      ));
    } else {
      add(SetObjectElementString(''));
    }
  }

  Stream<CotnrolViolationFormState> _onSetObjectElementString(
      SetObjectElementString event) async* {
    yield (state.copyWith(
      objectElement: ObjectElement(
        name: event.objectElement,
      ),
    ));
  }

  Stream<CotnrolViolationFormState> _onSetTargetLandmark(
      SetTargetLandmark event) async* {
    yield (state.copyWith(
      targetLandmark: event.targetLandmark,
    ));
  }

  Stream<CotnrolViolationFormState> _onSetViolationAdditionalFeatureEvent(
      SetViolationAdditionalFeatureEvent event) async* {
    if (event.violationAdditionalFeature != null) {
      yield (state.copyWith(
        violationAdditionalFeature: event.violationAdditionalFeature,
      ));
    } else {
      add(SetViolationAdditionalFeatureStringEvent(''));
    }
  }

  Stream<CotnrolViolationFormState> _onSetViolationAdditionalFeatureStringEvent(
      SetViolationAdditionalFeatureStringEvent event) async* {
    yield (state.copyWith(
      violationAdditionalFeature: ViolationAdditionalFeature(
        name: event.violationAdditionalFeature,
      ),
    ));
  }

  CotnrolViolationFormState _validate(CotnrolViolationFormState state) =>
      state.copyWith(
        adressErrorString: _validateAddress(state),
        objectElementErrorString: _validateObjectElemet(state),
        descriptionErrorString: _validateDescription(state),
        violationClassificationErrorString:
            _validateViolationClassification(state),
        violationClassificationErrorStringNoEkn:
            _validateViolationClassification(state),
      );

  String _validateAddress(CotnrolViolationFormState state) {
    if (state.address.toLongString().isEmpty) {
      return 'Введите адрес';
    }
    return null;
  }

  String _validateDescription(CotnrolViolationFormState state) {
    if (state.description.isEmpty) {
      return 'Введите описание нарушения';
    }
    return null;
  }

  String _validateObjectElemet(CotnrolViolationFormState state) {
    if (state.objectElement.name.isEmpty) {
      return 'Введите элемент объекта';
    }
    return null;
  }

  String _validateViolationClassification(CotnrolViolationFormState state) {
    if (state.violationClassification.violationName.name.isEmpty &&
        state.violationClassificationNoEkn.violationName.name.isEmpty) {
      return 'Должно быть заполнено хотя бы одно поле классификации нарушения';
    }
    return null;
  }

  Future<void> close() async {
    super.close();
    await _locationStreamSubscription.cancel();
  }

  Location get location => _location ?? Location.noLocationProvided();

  //   adressErrorString == null &&
  //   targetLandmarkErrorString == null &&
  //   objectElementErrorString == null &&
  //   descriptionErrorString == null &&
  //   violationAdditionalFeatureErrorString == null &&
  //   contractorErrorString == null &&
  //   violationClassificationErrorString == null;
}
