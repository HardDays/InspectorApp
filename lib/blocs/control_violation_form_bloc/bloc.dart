import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/event.dart';
import 'package:inspector/blocs/control_violation_form_bloc/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/events.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';
import 'package:inspector/model/department_control/violation_name.dart';

class ControlViolationFormBloc
    extends Bloc<ControlViolationFormEvent, CotnrolViolationFormState> {
  ControlViolationFormBloc(CotnrolViolationFormState initialState,
      {this.notificationBloc})
      : super(initialState);

  final NotificationBloc notificationBloc;

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
          yield (state.copyWith(
            photos: List.from(state.photos)
              ..add(
                DCPhoto(
                  data: base64.encode(
                    event.photo,
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
          yield (state.copyWith(
            photos: List.from(state.photos)
              ..removeAt(event.index)
              ..insert(
                event.index,
                DCPhoto(
                  data: base64.encode(
                    event.photo,
                  ),
                ),
              ),
          ));
        },
        setViolationClassifications: (event) async* {
          yield (state.copyWith(
            violationClassification: ViolationClassification(
              id: event.classification.id,
              violationName: event.classification.violationName,
            ),
          ));
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
      );

  Stream<CotnrolViolationFormState> _onSetAddressEvent(
      SetAddressEvent event) async* {
    yield (state.copyWith(
      address: event.address,
    ));
  }

  Stream<CotnrolViolationFormState> _onSetContractorEvent(
      SetContractorEvent event) async* {
    yield (state.copyWith(
      contractor: event.contractor,
    ));
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
    //yield (state.copyWith(setAddressByGeoLocation: event.value));
    notificationBloc
        .add(SnackBarNotificationEvent('Этот функционал пока не реализован'));
  }

  Stream<CotnrolViolationFormState> _onSetDescriptionEvent(
      SetDescriptionEvent event) async* {
    yield (state.copyWith(description: event.description));
  }

  Stream<CotnrolViolationFormState> _onSetObjectElement(
      SetObjectElement event) async* {
    yield (state.copyWith(
      objectElement: event.objectElement,
    ));
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
    yield (state.copyWith(
      violationAdditionalFeature: event.violationAdditionalFeature,
    ));
  }

  Stream<CotnrolViolationFormState> _onSetViolationAdditionalFeatureStringEvent(
      SetViolationAdditionalFeatureStringEvent event) async* {
    yield (state.copyWith(
      violationAdditionalFeature: ViolationAdditionalFeature(
        name: event.violationAdditionalFeature,
      ),
    ));
  }
}
