import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/address_bloc/bloc.dart';
import 'package:inspector/blocs/address_bloc/event.dart';
import 'package:inspector/blocs/address_bloc/state.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class AddressForm extends StatefulWidget {
  AddressForm({
    Key key,
    this.onConfirm,
    this.onCancel,
    this.dictionaryService,
    this.initialAddress,
  }) : super(key: key);

  final void Function(Address) onConfirm;
  final void Function() onCancel;
  final DictionaryService dictionaryService;
  final Address initialAddress;

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  TextEditingController _areaController;
  TextEditingController _districtController;
  TextEditingController _streetController;
  TextEditingController _houseController;

  @override
  void initState() {
    super.initState();
    _areaController = TextEditingController();
    _districtController = TextEditingController();
    _streetController = TextEditingController();
    _houseController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressFormBloc>(
      create: (context) => AddressFormBloc(address: widget.initialAddress),
      child: BlocConsumer<AddressFormBloc, AddressFormState>(
        listener: (context, state) {
          if (_areaController.text != state.area)
            _areaController.text = state.area;
          if (_districtController.text != state.district)
            _districtController.text = state.district;
          if (_streetController.text != state.street)
            _streetController.text = state.street;
          if (_houseController.text != state.house)
            _houseController.text = state.house;
        },
        builder: (context, state) {
          if (_areaController.text != state.area)
            _areaController.text = state.area;
          if (_districtController.text != state.district)
            _districtController.text = state.district;
          if (_streetController.text != state.street)
            _streetController.text = state.street;
          if (_houseController.text != state.house)
            _houseController.text = state.house;
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Адрес',
                      style: ProjectTextStyles.title
                          .apply(color: ProjectColors.blue),
                    ),
                  ),
                  _buildAutocomplete<Area>(
                    title: 'Административный округ',
                    hintText: 'Введите значение',
                    controller: _areaController,
                    formatter: (area) => area.name,
                    suggestionsCallback: (value) =>
                        widget.dictionaryService.getAreas(name: value),
                    onSuggestionSelected: (area) =>
                        BlocProvider.of<AddressFormBloc>(context)
                            .add(AddressFormEvent.setAreaValueEvent(area)),
                    onChanged: (area) =>
                        BlocProvider.of<AddressFormBloc>(context).add(
                            AddressFormEvent.setStringAreaValueEvent(area)),
                  ),
                  _buildAutocomplete<District>(
                    title: 'Район',
                    hintText: 'Введите значение',
                    controller: _districtController,
                    formatter: (district) => district.name,
                    suggestionsCallback: (value) =>
                        widget.dictionaryService.getDitricts(name: value, areaId: state.address.area?.id),
                    onSuggestionSelected: (district) =>
                        BlocProvider.of<AddressFormBloc>(context).add(
                            AddressFormEvent.setDistrictValueEvent(district)),
                    onChanged: (district) =>
                        BlocProvider.of<AddressFormBloc>(context).add(
                            AddressFormEvent.setStringDistrictValueEvent(
                                district)),
                  ),
                  _buildAutocomplete<Street>(
                    title: 'Улица',
                    hintText: 'Введите значение',
                    controller: _streetController,
                    formatter: (street) => street.name,
                    suggestionsCallback: (value) =>
                        widget.dictionaryService.getStreets(name: value, districtId: state.address.district?.id),
                    onSuggestionSelected: (street) =>
                        BlocProvider.of<AddressFormBloc>(context)
                            .add(AddressFormEvent.setStreetValueEvent(street)),
                    onChanged: (street) =>
                        BlocProvider.of<AddressFormBloc>(context).add(
                            AddressFormEvent.setStringStreetValueEvent(street)),
                  ),
                  _buildAutocomplete<Address>(
                    title: 'Дом, корпус, строение',
                    hintText: 'Введите значение',
                    controller: _houseController,
                    suggestionsCallback: (value) => widget.dictionaryService
                        .getAddresses(
                            houseNum: value,
                            streetId: state.address.street?.id ?? state.address.streetId,
                            areaId: state.address.area?.id ?? state.address.areaId,
                            districtId: state.address.district?.id ?? state.address.districtId,
                          ),
                    onSuggestionSelected: (address) =>
                        BlocProvider.of<AddressFormBloc>(context)
                            .add(AddressFormEvent.setAddressEvent(address)),
                    onChanged: (address) =>
                        BlocProvider.of<AddressFormBloc>(context).add(
                            AddressFormEvent.setStringHouseValueEvent(address)),
                  ),
                  Row(
                    children: [
                      Spacer(),
                      ProjectButton.buildOutlineButton('Отмена',
                          onPressed: widget.onCancel),
                      Padding(padding: const EdgeInsets.only(left: 20)),
                      ProjectButton.builtFlatButton(
                        'Сохранить',
                        onPressed: () => widget.onConfirm(state.address),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _areaController.dispose();
    _districtController.dispose();
    _streetController.dispose();
    _houseController.dispose();
    super.dispose();
  }

  Widget _buildAutocomplete<T>({
    String title = '',
    String hintText = '',
    TextEditingController controller,
    AutocompleteCallback<T> suggestionsCallback,
    void Function(T) onSuggestionSelected,
    String Function(T) formatter,
    String Function(String) validator,
    bool enabled = true,
    EdgeInsets padding = const EdgeInsets.only(top: 20),
    void Function(String) onChanged,
  }) {
    return Padding(
      padding: padding,
      child: ProjectAutocomplete<T>(
        title,
        controller: controller,
        hintText: hintText,
        suggestionsCallback: suggestionsCallback,
        onSuggestionSelected: onSuggestionSelected,
        validator: validator,
        formatter: formatter,
        enabled: enabled,
        onChanged: onChanged,
      ),
    );
  }
}
