import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/bloc.dart';
import 'package:inspector/blocs/control_filters/event.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/dc_object_kind.dart';
import 'package:inspector/model/dc_object_type.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/violator_address.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';


class ControlFiltersWidget extends StatelessWidget {
  final _cameras = ['Да', 'Нет'];

  final _dcObjectTypeController = TextEditingController();
  final _dcObjectKindController = TextEditingController();
  final _areaController = TextEditingController();
  final _districtController = TextEditingController();
  final _addressController = TextEditingController();

  Future<Iterable<DCObjectType>> _onDCObjectTypeSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCObjectTypes(name);
  }

  void _onDCObjectTypeSelect(ControlFiltersBloc bloc, DCObjectType type) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(dcObjectType: type)));
    _dcObjectTypeController.text = type?.name;
  }

  Future<Iterable<DCObjectKind>> _onDCObjectKindSearch(BuildContext context, String name) async  {
    return await BlocProvider.of<ControlFiltersBloc>(context).getDCObjectKinds(name);
  }

  void _onDCObjectKindSelect(ControlFiltersBloc bloc, DCObjectKind kind) {
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

  Future<Iterable<ViolatorAddress>> _onAddressSearch(BuildContext context, String name) async  {
    // return await BlocProvider.of<ControlFiltersBloc>(context).getAddresses(name);
  }

  void _onAddressSelect(ControlFiltersBloc bloc, ViolatorAddress address) {
    bloc.add(CopyStateEvent(bloc.state.copyWith(address: address)));
    _addressController.text = address?.toString();
  }

  void _onLastCheckDate() {
    
  }

  void _onCamera(ControlFiltersBloc, String value) {

  }

  void _onClear(BuildContext context) {
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ControlFiltersBloc(),
      child: BlocBuilder<ControlFiltersBloc, ControlFiltersBlocState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<ControlFiltersBloc>(context);
          return Column(
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
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectTextField(
                        title: 'Наименование объекта',
                        hintText: 'Введите данные',
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
                        controller: _areaController,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectTextField(
                        title: 'Радиус поиска, м',
                        hintText: 'Введите данные',
                        inputType: TextInputType.number,
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
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectTextField(
                        title: 'Дней с последней проверки, более',
                        hintText: 'Введите данные',
                        inputType: TextInputType.number,
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
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectSelect(
                        _cameras.length, 
                        'Да', 
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
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProjectButton.buildOutlineButton('Сбросить',
                      onPressed: ()=> _onClear(context)
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20)), 
                    ProjectButton.builtFlatButton('Найти',
                    )
                  ],
                ),
              ),
            ],
          
          );
        }
      )
    );
  }
}
