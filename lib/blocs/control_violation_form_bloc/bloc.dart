import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/event.dart';
import 'package:inspector/blocs/control_violation_form_bloc/state.dart';

class ControlViolationFormBloc
    extends Bloc<ControlViolationFormEvent, CotnrolViolationFormState> {
  ControlViolationFormBloc(CotnrolViolationFormState initialState)
      : super(initialState);

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
      contractor: ContractorFormField.object(
        contractor: event.contractor,
      ),
    ));
  }

  Stream<CotnrolViolationFormState> _onSetContractorStringEvent(
      SetContractorStringEvent event) async* {
    yield (state.copyWith(
      contractor: ContractorFormField.string(
        contractor: event.contractor,
      ),
    ));
  }

  Stream<CotnrolViolationFormState> _onSetCriticalEvent(
      SetCriticalEvent event) async* {
    yield (state.copyWith(critical: event.value));
  }

  Stream<CotnrolViolationFormState> _onSetDescriptionEvent(
      SetDescriptionEvent event) async* {
    yield (state.copyWith(description: event.description));
  }

  Stream<CotnrolViolationFormState> _onSetObjectElement(
      SetObjectElement event) async* {
    yield (state.copyWith(
      objectElement: ObjectElementFormField.object(
        objectElement: event.objectElement,
      ),
    ));
  }

  Stream<CotnrolViolationFormState> _onSetObjectElementString(
      SetObjectElementString event) async* {
    yield (state.copyWith(
      objectElement: ObjectElementFormField.string(
        objectElement: event.objectElement,
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
      violationAdditionalFeature: ViolationAdditionalFeatureFormField.object(
        violationAdditionalFeature: event.violationAdditionalFeature,
      ),
    ));
  }

  Stream<CotnrolViolationFormState> _onSetViolationAdditionalFeatureStringEvent(
      SetViolationAdditionalFeatureStringEvent event) async* {
    yield (state.copyWith(
      violationAdditionalFeature: ViolationAdditionalFeatureFormField.string(
        violationAdditionalFeature: event.violationAdditionalFeature,
      ),
    ));
  }
}