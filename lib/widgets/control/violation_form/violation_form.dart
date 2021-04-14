import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/bloc.dart';
import 'package:inspector/blocs/control_violation_form_bloc/event.dart';
import 'package:inspector/blocs/control_violation_form_bloc/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/model/department_control/contractor.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/violation_additional_feature.dart';
import 'package:inspector/model/department_control/violation_classification_search_result.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/location/location_service.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/image_picker.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
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
  TextEditingController _violationClassificationControllerNoEkn =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ControlViolationFormBloc>(
      create: (context) => ControlViolationFormBloc(
        widget.initialViolation,
        widget.onConfirm,
        Provider.of<LocationService>(context, listen: false),
        Provider.of<DictionaryService>(context, listen: false),
        Provider.of<NetworkStatusService>(context, listen: false),
        notificationBloc: BlocProvider.of<NotificationBloc>(context),
      ),
      child: BlocConsumer<ControlViolationFormBloc, CotnrolViolationFormState>(
        listener: (context, state) {
          _fillControllers(state);
        },
        builder: (context, state) {
          _fillControllers(state);
          return Column(
            children: [
              Row(
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
                                    .add(ControlViolationFormEvent
                                        .setAddressEvent(address));
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
                    validator: (_) => state.adressErrorString,
                    autoValidate: true,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProjectTextField(
                title: 'Адресный ориентир',
                controller: _targetMarkController,
                autoValidate: true,
                validator: (_) => state.targetLandmarkErrorString,
                hintText: 'Введите данные',
                onChanged: (value) =>
                    BlocProvider.of<ControlViolationFormBloc>(context).add(
                        ControlViolationFormEvent.setTargetLandmark(value)),
              ),
              SizedBox(
                height: 20,
              ),
              ProjectAutocomplete<ObjectElement>(
                'Элемент объекта',
                controller: _objectElementController,
                hintText: 'Выберите значение',
                enabled: true,
                autoValidate: true,
                validator: (_) => state.objectElementErrorString,
                formatter: (objectElement) => objectElement.name,
                onChanged: (value) =>
                    BlocProvider.of<ControlViolationFormBloc>(context).add(
                        ControlViolationFormEvent.setObjectElementString(
                            value)),
                onSuggestionSelected: (value) =>
                    BlocProvider.of<ControlViolationFormBloc>(context)
                        .add(ControlViolationFormEvent.setObjectElement(value)),
                suggestionsCallback: (value) =>
                    widget.dictionaryService.getDCObjectElements(name: value),
              ),
              if (state.showClassificationField)
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:
                      ProjectAutocomplete<ViolationClassificationSearchResult>(
                    'Наименование нарушения по ЕКН',
                    controller: _violationClassificationController,
                    hintText: 'Введите данные',
                    enabled: state.objectElement.id != null,
                    formatter: (value) =>
                        '${value.id?.toString()} ${value.violationName.name} ${value.violationType?.name} ${value.violationKind?.name}',
                    autoValidate: true,
                    validator: (_) => state.violationClassificationErrorString,
                    onChanged: (value) =>
                        BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent
                          .setViolationClassificationString(value),
                    ),
                    onSuggestionSelected: (value) =>
                        BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent.setViolationClassifications(
                          value),
                    ),
                    suggestionsCallback: (value) => widget.dictionaryService
                        .getViolationClassificationSearchResults(
                      name: value,
                      objectElement: state.objectElement,
                      ekn: true,
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: ProjectAutocomplete<ViolationClassificationSearchResult>(
                  'Нарушения, не входящие в ЕКН',
                  controller: _violationClassificationControllerNoEkn,
                  hintText: 'Введите данные',
                  enabled: state.objectElement.id != null,
                  formatter: (value) =>
                      '${value.id?.toString()} ${value.violationName.name} ${value.violationType?.name} ${value.violationKind?.name}',
                  validator: (_) =>
                      state.violationClassificationErrorStringNoEkn,
                  autoValidate: true,
                  onChanged: (value) =>
                      BlocProvider.of<ControlViolationFormBloc>(context).add(
                    ControlViolationFormEvent
                        .setViolationClassificationNoEknString(value),
                  ),
                  onSuggestionSelected: (value) =>
                      BlocProvider.of<ControlViolationFormBloc>(context).add(
                    ControlViolationFormEvent.setViolationClassificationsNoEkn(
                        value),
                  ),
                  suggestionsCallback: (value) => widget.dictionaryService
                      .getViolationClassificationSearchResults(
                    name: value,
                    objectElement: state.objectElement,
                    ekn: false,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProjectTextField(
                title: 'Описание нарушения',
                controller: _descriptionController,
                hintText: 'Введите данные',
                autoValidate: true,
                validator: (_) => state.descriptionErrorString,
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
                autoValidate: true,
                validator: (_) => state.violationAdditionalFeatureErrorString,
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
                validator: (_) => state.contractorErrorString,
                autoValidate: true,
                formatter: (contractor) => contractor.name,
                onChanged: (value) =>
                    BlocProvider.of<ControlViolationFormBloc>(context).add(
                        ControlViolationFormEvent.setContractorStringEvent(
                            value)),
                onSuggestionSelected: (value) =>
                    BlocProvider.of<ControlViolationFormBloc>(context).add(
                        ControlViolationFormEvent.setContractorEvent(value)),
                suggestionsCallback: (value) =>
                    widget.dictionaryService.getContractors(name: value),
              ),
              ProjectTitle('Подтверждающие материалы'),
              ImagePicker(
                buttonTitle: 'Добавить фото нарушения',
                images: state.photos.map((e) => base64.decode(e.data)).toList(),
                names: state.photos.map((e) => e.name ?? '').toList(),
                enabled: true,
                onRotated: (index, image) {
                  BlocProvider.of<ControlViolationFormBloc>(context).add(
                      ControlViolationFormEvent.rotatePhotoEvent(index, image));
                },
                onPicked: (file) {
                  BlocProvider.of<ControlViolationFormBloc>(context)
                      .add(ControlViolationFormEvent.addPhotoEvent(
                    file.readAsBytesSync(),
                    file.path,
                  ));
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
                      BlocProvider.of<ControlViolationFormBloc>(context)
                          .add(ControlViolationFormEvent.saveEvent());
                    },
                  ),
                ],
              ),
            ],
          );
        },
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

  void _fillControllers(CotnrolViolationFormState state) {
    if (_addressController.text != state.address.toLongString())
      _addressController.text = state.address.toLongString();
    if (_targetMarkController.text != state.targetLandmark)
      _targetMarkController.text = state.targetLandmark;
    if (_objectElementController.text != state.objectElement.name)
      _objectElementController.text = state.objectElement.name;
    if (_descriptionController.text != state.description)
      _descriptionController.text = state.description;
    if (_additionalFeatureController.text !=
        state.violationAdditionalFeature.name)
      _additionalFeatureController.text = state.violationAdditionalFeature.name;
    if (_contractorController.text != state.contractor.name)
      _contractorController.text = state.contractor.name;
    if (_violationClassificationController.text !=
        state.violationClassification.violationName.name)
      _violationClassificationController.text =
          state.violationClassification.violationName.name;
    if (_violationClassificationControllerNoEkn.text !=
        state.violationClassificationNoEkn.violationName.name)
      _violationClassificationControllerNoEkn.text =
          state.violationClassificationNoEkn.violationName.name;
  }
}
