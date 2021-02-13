import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/event.dart';
import 'package:inspector/blocs/control_violation_form_bloc/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/image_picker.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/common/address_form.dart';
import 'package:provider/provider.dart';

class ViolationFormWidget extends StatefulWidget {
  ViolationFormWidget({
    Key key,
    this.onConfirm,
    this.onCancel,
    this.dictionaryService,
    this.initialViolation,
  }) : super(key: key);

  final DCViolation initialViolation;
  final void Function(DCViolation) onConfirm;
  final void Function() onCancel;
  final DictionaryService dictionaryService;

  @override
  _ViolationFormWidgetState createState() => _ViolationFormWidgetState();
}

class _ViolationFormWidgetState extends State<ViolationFormWidget> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _targetMarkController = TextEditingController();
  TextEditingController _objectElementController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _additionalFeatureController = TextEditingController();
  TextEditingController _contractorController = TextEditingController();
  TextEditingController _violationClassificationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ControlViolationFormBloc>(
      create: (context) => ControlViolationFormBloc(
        CotnrolViolationFormState(
          address: widget.initialViolation?.btiAddress ?? Address(),
          contractor: widget.initialViolation?.violator ?? Contractor(name: ''),
          critical: widget.initialViolation?.critical ?? false,
          description: widget.initialViolation?.description ?? '',
          objectElement:
              widget.initialViolation?.objectElement ?? ObjectElement(name: ''),
          photos: widget.initialViolation?.photos ?? List<DCPhoto>(),
          setAddressByGeoLocation: false,
          targetLandmark: widget.initialViolation?.address ?? '',
          violationAdditionalFeature:
              widget.initialViolation?.additionalFeatures?.first ??
                  ViolationAdditionalFeature(name: ''),
          showClassificationField: widget.initialViolation == null,
          violationClassification:
              widget.initialViolation?.eknViolationClassification ??
                  widget.initialViolation?.otherViolationClassification ??
                  ViolationClassification(
                    violationName: ViolationName(
                      name: '',
                    ),
                  ),
        ),
        notificationBloc: BlocProvider.of<NotificationBloc>(context),
      ),
      child: BlocConsumer<ControlViolationFormBloc, CotnrolViolationFormState>(
        listener: (context, state) {
          _addressController.text = state.address.toLongString();
          _targetMarkController.text = state.targetLandmark;
          _objectElementController.text = state.objectElement.name;
          _descriptionController.text = state.description;
          _additionalFeatureController.text =
              state.violationAdditionalFeature.name;
          _contractorController.text = state.contractor.name;
        },
        builder: (context, state) => Column(
          children: [
            Form(
              child: Row(
                children: [
                  Checkbox(
                    value: state.setAddressByGeoLocation,
                    onChanged: (value) =>
                        BlocProvider.of<ControlViolationFormBloc>(context).add(
                            ControlViolationFormEvent
                                .setUseGeoLocationForAddressEvent(value)),
                  ),
                  Text(
                    'Определить адрес по местоположению',
                    style: ProjectTextStyles.base.apply(
                      color: ProjectColors.black,
                    ),
                  ),
                  Spacer(),
                  Checkbox(
                    value: state.critical,
                    onChanged: (value) =>
                        BlocProvider.of<ControlViolationFormBloc>(context).add(
                            ControlViolationFormEvent.setCriticalEvent(value)),
                  ),
                  Text(
                    'Критичность',
                    style: ProjectTextStyles.base.apply(
                      color: ProjectColors.black,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: !state.setAddressByGeoLocation
                  ? () async {
                      final ctx = context;
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => Material(
                          color: Colors.transparent,
                          child: AddressForm(
                            dictionaryService: Provider.of<DictionaryService>(
                                context,
                                listen: false),
                            onCancel: () {
                              Navigator.of(context).pop();
                            },
                            initialAddress: state.address,
                            onConfirm: (address) {
                              Navigator.of(context).pop();
                              BlocProvider.of<ControlViolationFormBloc>(ctx)
                                  .add(
                                      ControlViolationFormEvent.setAddressEvent(
                                          address));
                            },
                          ),
                        ),
                      );
                    }
                  : null,
              child: IgnorePointer(
                child: ProjectTextField(
                  title: 'Адрес',
                  hintText: 'Выберите значение',
                  controller: _addressController,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ProjectTextField(
              title: 'Адресный ориентир',
              controller: _targetMarkController,
              hintText: 'Введите данные',
              onChanged: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context)
                      .add(ControlViolationFormEvent.setTargetLandmark(value)),
            ),
            SizedBox(
              height: 20,
            ),
            ProjectAutocomplete<ObjectElement>(
              'Элемент объекта',
              controller: _objectElementController,
              hintText: 'Выберите значение',
              enabled: true,
              formatter: (objectElement) => objectElement.name,
              onChanged: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent.setObjectElementString(value)),
              onSuggestionSelected: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context)
                      .add(ControlViolationFormEvent.setObjectElement(value)),
              suggestionsCallback: (value) =>
                  widget.dictionaryService.getDCObjectElements(name: value),
            ),
            if (state.showClassificationField)
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ProjectAutocomplete<ViolationClassificationSearchResult>(
                  'Наименование нарушения по ЕКН',
                  controller: _violationClassificationController,
                  hintText: 'Введите данные',
                  enabled: true,
                  formatter: (value) => value.violationName.name,
                  onChanged: (value) =>
                      BlocProvider.of<ControlViolationFormBloc>(context).add(
                          ControlViolationFormEvent
                              .setViolationClassificationString(value)),
                  onSuggestionSelected: (value) =>
                      BlocProvider.of<ControlViolationFormBloc>(context).add(
                          ControlViolationFormEvent
                              .setViolationClassifications(value)),
                  suggestionsCallback: (value) => widget.dictionaryService
                      .getViolationClassificationSearchResults(name: value, objectElement: state.objectElement),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            ProjectTextField(
              title: 'Описание нарушения',
              controller: _descriptionController,
              hintText: 'Введите данные',
              onChanged: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent.setDescriptionEvent(value)),
            ),
            SizedBox(
              height: 20,
            ),
            ProjectAutocomplete<ViolationAdditionalFeature>(
              'Дополнительный признак',
              controller: _additionalFeatureController,
              hintText: 'Введите данные',
              enabled: true,
              formatter: (additionalFeature) => additionalFeature.name,
              onChanged: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent
                          .setViolationAdditionalFeatureStringEvent(value)),
              onSuggestionSelected: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent
                          .setViolationAdditionalFeatureEvent(value)),
              suggestionsCallback: (value) => widget.dictionaryService
                  .getViolationAdditionalFeatures(name: value),
            ),
            SizedBox(
              height: 20,
            ),
            ProjectAutocomplete<Contractor>(
              'Подрядчик',
              controller: _contractorController,
              hintText: 'Выберите значение',
              enabled: true,
              formatter: (contractor) => contractor.name,
              onChanged: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent.setContractorStringEvent(
                          value)),
              onSuggestionSelected: (value) =>
                  BlocProvider.of<ControlViolationFormBloc>(context)
                      .add(ControlViolationFormEvent.setContractorEvent(value)),
              suggestionsCallback: (value) =>
                  widget.dictionaryService.getContractors(name: value),
            ),
            SizedBox(
              height: 20,
            ),
            ImagePicker(
              images: state.photos.map((e) => base64.decode(e.data)).toList(),
              names: state.photos.map((e) => e.name ?? '').toList(),
              enabled: true,
              onRotated: (index, image) {
                BlocProvider.of<ControlViolationFormBloc>(context).add(
                    ControlViolationFormEvent.rotatePhotoEvent(index, image));
              },
              onPicked: (file) {
                BlocProvider.of<ControlViolationFormBloc>(context).add(
                    ControlViolationFormEvent.addPhotoEvent(
                        file.readAsBytesSync()));
              },
              onRemoved: (index) {
                BlocProvider.of<ControlViolationFormBloc>(context)
                    .add(ControlViolationFormEvent.removePhotoEvent(index));
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Spacer(),
                ProjectButton.buildOutlineButton(
                  'Отменить',
                  onPressed: widget.onCancel,
                ),
                SizedBox(
                  width: 20,
                ),
                ProjectButton.builtFlatButton(
                  'Сохранить',
                  onPressed: () {
                    final violation =
                        (widget.initialViolation ?? DCViolation()).copyWith(
                      btiAddress: state.address,
                      address: state.targetLandmark,
                      objectElement: state.objectElement,
                      description: state.description,
                      eknViolationClassification: state.violationClassification,
                      violator: state.contractor,
                      critical: state.critical,
                      additionalFeatures: [state.violationAdditionalFeature],
                      photos: state.photos,
                    );
                    widget.onConfirm(violation);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _addressController.dispose();
    _targetMarkController.dispose();
    _objectElementController.dispose();
    _descriptionController.dispose();
    _additionalFeatureController.dispose();
    _contractorController.dispose();
  }
}
