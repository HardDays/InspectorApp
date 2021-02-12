import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/bloc.dart';
import 'package:inspector/blocs/control_filters/event.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/object_kind.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/checkbox.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';


class ControlFiltersWidget extends StatelessWidget {
  final _cameras = ['Да', 'Нет'];

  final _externalIdController = TextEditingController();
  final _objectNameController = TextEditingController();
  final _balanceOwnerController = TextEditingController();
  final _daysFromLastSurveyController = TextEditingController();
  final _searchRadiusController = TextEditingController();
  final _dcObjectTypeController = TextEditingController();
  final _dcObjectKindController = TextEditingController();
  final _areaController = TextEditingController();
  final _districtController = TextEditingController();
  final _addressController = TextEditingController();
  final _dcObjectElementController = TextEditingController();
  final _dcViolationNameController = TextEditingController();
  final _dcViolationStatusController = TextEditingController();
  final _dcViolationSourceController = TextEditingController();

  final ControlFiltersBlocState state;

  ControlFiltersWidget(this.state) {
    _initControllers(state);
  }

  void _initControllers(ControlFiltersBlocState state) {
    _externalIdController.clear();
    _objectNameController.clear();
    _balanceOwnerController.clear();
    _daysFromLastSurveyController.clear();
    _searchRadiusController.clear();
    _dcObjectTypeController.clear();
    _dcObjectKindController.clear();
    _areaController.clear();
    _districtController.clear();
    _addressController.clear();
    _dcObjectElementController.clear();
    _dcViolationNameController.clear();
    _dcViolationStatusController.clear();
    _dcViolationSourceController.clear();

    _externalIdController.text = state.externalId?.toString();
    _objectNameController.text = state.objectName;
    _balanceOwnerController.text = state.balanceOwner?.toString();
    _daysFromLastSurveyController.text = state.daysFromLastSurvey?.toString();
    _searchRadiusController.text = state.searchRadius?.toString();
    _dcObjectTypeController.text = state.dcObjectType?.name;
    _dcObjectKindController.text = state.dcObjectKind?.name;
    _areaController.text = state.area?.name;
    _districtController.text = state.district?.name;
    _addressController.text = state.address?.toLongString();
    _dcObjectElementController.text = state.objectElement?.name;
    _dcViolationNameController.text = state.violationName?.name;
    _dcViolationStatusController.text = state.violationStatus?.name;
    _dcViolationSourceController.text = state.source?.name;
  }

  Future<Iterable<ObjectType>> _onDCObjectTypeSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCObjectTypes(name);
  }

  void _onDCObjectTypeSelect(ControlFiltersBloc bloc, ObjectType type) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(dcObjectType: type)));
    _dcObjectTypeController.text = type?.name;
  }

  Future<Iterable<ObjectKind>> _onDCObjectKindSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCObjectKinds(name);
  }

  void _onDCObjectKindSelect(ControlFiltersBloc bloc, ObjectKind kind) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(dcObjectKind: kind)));
    _dcObjectKindController.text = kind?.name;
  }

  Future<Iterable<Area>> _onAreaSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getAreas(name);
  }

  void _onAreaSelect(ControlFiltersBloc bloc, Area area) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(area: area)));
    _areaController.text = area?.name;
  }

  Future<Iterable<District>> _onDistrictSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDistricts(name);
  }

  void _onDistrictSelect(ControlFiltersBloc bloc, District district) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(district: district)));
    _districtController.text = district?.name;
  }

  Future<Iterable<Address>> _onAddressSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getAddresses(name);
  }

  void _onAddressSelect(ControlFiltersBloc bloc, Address address) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(address: address)));
    _addressController.text = address?.toString();
  }

  void _onLastSurveyDate(ControlFiltersBloc bloc, List<DateTime> values) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(lastSurveyDates: values)));
  }

  void _onCamera(ControlFiltersBloc bloc, String value) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(camerasExist: value == _cameras.first)));
  }

  Future<Iterable<ObjectElement>> _onDCObjectElementSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCObjectElements(name);
  }

  void _onDCObjectElementSelect(ControlFiltersBloc bloc, ObjectElement element) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(objectElement: element)));
    _dcObjectElementController.text = element?.name;
  }

  Future<Iterable<ViolationName>> _onDCViolationNameSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCViolationNames(name);
  }

  void _onDCViolationNameSelect(ControlFiltersBloc bloc, ViolationName name) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(violationName: name)));
    _dcViolationNameController.text = name?.name;
  }

  void _onIgnore(ControlFiltersBloc bloc, bool value) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(ignoreViolations: value)));
  }

  Future<Iterable<ViolationStatus>> _onDCViolationStatusSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCViolationStatuses(name);
  }

  void _onDCViolationStatusSelect(ControlFiltersBloc bloc, ViolationStatus status) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(violationStatus: status)));
    _dcViolationStatusController.text = status?.name;
  }

  void _onControlDate(ControlFiltersBloc bloc, List<DateTime> values) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(controlDates: values)));
  }

  void _onDetectionDate(ControlFiltersBloc bloc, List<DateTime> values) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(detectionDates: values)));
  }

  Future<Iterable<Source>> _onDCSourceSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCSources(name);
  }

  void _onDCSourceSelect(ControlFiltersBloc bloc, Source source) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(source: source)));
    _dcViolationSourceController.text = source?.name;
  }

  void _onClear(ControlFiltersBloc bloc) {
    print(int.tryParse('fd'));
    final state = ControlFiltersBlocState(searchRadius: 500, daysFromLastSurvey: 7);
    bloc.add(CopyStateEvent(state));
    _initControllers(state);
  }

  void _onFind(BuildContext context, ControlFiltersBloc bloc) {
    final objectName = _objectNameController.text;
    final ownerName = _balanceOwnerController.text;
    Navigator.pop(context,
      bloc.state.copyWith(
        externalId: int.tryParse(_externalIdController.text),
        objectName: objectName.isEmpty ? null : objectName,
        searchRadius: int.tryParse(_searchRadiusController.text) ?? 500,
        balanceOwner: ownerName.isEmpty ? null : ownerName,
        daysFromLastSurvey: int.tryParse(_daysFromLastSurveyController.text) ?? 7,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ControlFiltersBloc(state),
      child: BlocBuilder<ControlFiltersBloc, ControlFiltersBlocState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<ControlFiltersBloc>(context);
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: ProjectAutocomplete('Тип объекта',
                          hintText: 'Все',
                          enabled: true,
                          suggestionsCallback: (text)=> _onDCObjectTypeSearch(context, text),
                          onSuggestionSelected: (value)=> _onDCObjectTypeSelect(bloc, value),
                          formatter: (value) => '${value.code} ${value.name}',
                          controller: _dcObjectTypeController,
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(left: 35)),
                      Flexible(
                        child: ProjectAutocomplete('Вид объекта',
                          hintText: 'Все',
                          enabled: true,
                          suggestionsCallback: (text)=> _onDCObjectKindSearch(context, text),
                          onSuggestionSelected: (value)=> _onDCObjectKindSelect(bloc, value),
                          formatter: (value) => '${value.name}',
                          controller: _dcObjectKindController,
                        ),
                      ),
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectTextField(
                            title: 'ID объекта',
                            hintText: 'Введите данные',
                            controller: _externalIdController,
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectTextField(
                            title: 'Наименование объекта',
                            hintText: 'Введите данные',
                            controller: _objectNameController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectAutocomplete('Округ',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onAreaSearch(context, text),
                            onSuggestionSelected: (value)=> _onAreaSelect(bloc, value),
                            controller: _areaController,
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectAutocomplete('Район',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onDistrictSearch(context, text),
                            onSuggestionSelected: (value)=> _onDistrictSelect(bloc, value),
                            controller: _districtController,
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectAutocomplete('Адрес',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onAddressSearch(context, text),
                            onSuggestionSelected: (value)=> _onAddressSelect(bloc, value),
                            controller: _addressController,
                            formatter: (value) => '${value.toSearchString()}',
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectTextField(
                            title: 'Радиус поиска, м',
                            hintText: 'Введите данные',
                            inputType: TextInputType.number,
                            controller: _searchRadiusController,
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectTextField(
                            title: 'Балансодержатель',
                            hintText: 'Введите данные',
                            controller: _balanceOwnerController,
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectTextField(
                            title: 'Дней с последней проверки, более',
                            hintText: 'Введите данные',
                            inputType: TextInputType.number,
                            controller: _daysFromLastSurveyController,
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectDatePicker(
                            title: 'Дата последней проверки',
                            hintText: 'Выберите дату или период',
                            values: state.lastSurveyDates,
                            onChanged: (value)=> _onLastSurveyDate(bloc, value ?? []),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectSelect(
                            _cameras.length, 
                            (state.camerasExist ?? true) ? _cameras[0] : _cameras[1], 
                            (index)=> _cameras[index],
                            (index)=> _cameras[index],
                            title: 'Наличие камер',
                            hintText: 'Введите данные',
                            onChanged: (value)=> _onCamera(bloc, value),
                          ),
                        ),
                      ]
                    ),
                  ),
                  ProjectTitle('Поиск нарушений'),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      children: [
                        ProjectCheckbox(
                          value: state.ignoreViolations ?? false,
                          onChanged: (value)=> _onIgnore(bloc, value),
                        ),
                        Flexible(
                          child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                            child: Text('Скрыть нарушения',
                              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectAutocomplete('Элемент объекта',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onDCObjectElementSearch(context, text),
                            onSuggestionSelected: (value)=> _onDCObjectElementSelect(bloc, value),
                            controller: _dcObjectElementController,
                            formatter: (value) => '${value.name}',
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectAutocomplete('Наименование нарушения',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onDCViolationNameSearch(context, text),
                            onSuggestionSelected: (value)=> _onDCViolationNameSelect(bloc, value),
                            controller: _dcViolationNameController,
                            formatter: (value) => '${value.name}',
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectAutocomplete('Статус нарушения',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onDCViolationStatusSearch(context, text),
                            onSuggestionSelected: (value)=> _onDCViolationStatusSelect(bloc, value),
                            controller: _dcViolationStatusController,
                            formatter: (value) => '${value.name}',
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectAutocomplete('Источник данных',
                            hintText: 'Все',
                            enabled: true,
                            suggestionsCallback: (text)=> _onDCSourceSearch(context, text),
                            onSuggestionSelected: (value)=> _onDCSourceSelect(bloc, value),
                            controller: _dcViolationSourceController,
                            formatter: (value) => '${value.name}',
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: ProjectDatePicker(
                            title: 'Дата обследования',
                            hintText: 'Выберите дату или период',
                            values: state.detectionDates,
                            onChanged: (value)=> _onDetectionDate(bloc, value ?? []),
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: ProjectDatePicker(
                            title: 'Контрольный срок устранения',
                            hintText: 'Выберите дату или период',
                            values: state.controlDates,
                            onChanged: (value)=> _onControlDate(bloc, value ?? []),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ProjectButton.buildOutlineButton('Сбросить',
                          onPressed: ()=> _onClear(bloc)
                        ),
                        Padding(padding: const EdgeInsets.only(left: 20)), 
                        ProjectButton.builtFlatButton('Найти',
                          onPressed: ()=> _onFind(context, bloc)
                        )
                      ],
                    ),
                  ),
                ],
              )
            ),
          );
        }
      )
    );
  }
}
