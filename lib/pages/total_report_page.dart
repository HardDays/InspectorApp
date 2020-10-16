import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:inspector/blocs/total_report/bloc.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/model/report.dart';
import 'package:inspector/model/street.dart';
import 'package:inspector/model/violator.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/autocomplete.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/checkbox.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
import 'package:inspector/widgets/dictionary_dialog.dart';
import 'package:latlong/latlong.dart';
import 'package:inspector/widgets/image_picker.dart';

class TotalReportPage extends StatefulWidget {

  final bool violationNotPresent;

  TotalReportPage({this.violationNotPresent});

  @override
  TotalReportPageState createState() => TotalReportPageState();
}


class TotalReportPageState extends State<TotalReportPage> with SingleTickerProviderStateMixin {

  final areaController = TextEditingController();
  final streetController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();

  void initState() {
    super.initState();
  }

  void _onViolationNotPresent(BuildContext context, bool value) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolationNotPresentEvent(value));  
  }

  void _onViolatorNotFound(BuildContext context, bool value, int index) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorNotFoundEvent(index, value));  
  }

  void _onViolatorForeign(BuildContext context, bool value, int index) {
    BlocProvider.of<TotalReportBloc>(context).add(SetViolatorForeignEvent(index, value));  
  }

  void _onAddViolator(BuildContext context) {
    BlocProvider.of<TotalReportBloc>(context).add(AddViolatorEvent());  
  }

  void _onAreaSelect(BuildContext context, Area value) {
    areaController.text = value.toString();
  }

  void _onDistrictSelect(BuildContext context, District value) {
    districtController.text = value.toString();
  }

  void _onStreetSelect(BuildContext context, Street value) {
    streetController.text = value.toString();
  }

  void _onAddressSelect(BuildContext context, Address value) {
    addressController.text = value.toString();
  }

  Future<Iterable<Area>> _onAreaSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getAreas(name);
  }

  Future<Iterable<District>> _onDistrictSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getDistricts(name);
  }

  Future<Iterable<Street>> _onStreetSearch(BuildContext context, String name) async {
    return await BlocProvider.of<TotalReportBloc>(context).getStreets(name);
  }

  Future<Iterable<Address>> _onAddressSearch(BuildContext context, String houseNum) async {
    return await BlocProvider.of<TotalReportBloc>(context).getAddresses(houseNum);
  }

  void _loadDict(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          child: DictionaryDialog()
        );
        BlocProvider.of<TotalReportBloc>(context).add(InitEvent(widget.violationNotPresent));  
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> TotalReportBloc(TotalReportBlocState(report: Report.empty(false)))..add(LoadEvent(widget.violationNotPresent)),
      child: BlocBuilder<TotalReportBloc, TotalReportBlocState>(
        builder: (context, state) {
          if (state is LoadDictState) {
            _loadDict(context);
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ProjectAppbar('Рапорт'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    _buildCheckBox(
                      'Данные, указывающие на наличие события нарушения, не установлены', 
                      state.report.violationNotPresent,
                      (value)=> _onViolationNotPresent(context, value),
                      padding: EdgeInsets.zero, 
                      style: ProjectTextStyles.baseBold,
                    ),
                    state.report.violationNotPresent ? _buildViolationNotPresent() : _buildViolationPresent(context, state),
                  ],
                ),
              ),
            ),
          );
        }
      )
    );  
  }

  Widget _buildViolationNotPresent() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImagePicker(),
          _buildButtons(),
        ],
      ),
    );
  }
  
  Widget _buildViolationPresent(BuildContext context, TotalReportBlocState state) {
    return Column(
      children: [
        _buildMap(),
        _buildTextField('Ручной поиск по карте', 'Введите или выберите значение'),
        _buildTitle('Адрес нарушения'),
        Row(
          children: [
            Flexible(
              child: _buildCheckBox(
                'Определить адрес по местоположению', 
                state.report.violationNotPresent,
                (value)=> _onViolationNotPresent(context, value),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildCheckBox(
                'ТиНАО', 
                state.report.violationNotPresent,
                (value)=> _onViolationNotPresent(context, value),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildAutocomplete(
                'Округ', 
                'Выберите значение', 
                areaController,
                (value)=> _onAreaSearch(context, value), 
                (value)=> _onAreaSelect(context, value),
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildAutocomplete(
                'Район', 
                'Выберите значение', 
                districtController,
                (value)=> _onDistrictSearch(context, value), 
                (value)=> _onDistrictSelect(context, value)
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildAutocomplete(
                'Улица', 
                'Выберите значение', 
                streetController,
                (value)=> _onStreetSearch(context, value), 
                (value)=> _onStreetSelect(context, value)
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildAutocomplete(
                'Дом, корпус, строение', 
                'Выберите значение', 
                addressController,
                (value)=> _onAddressSearch(context, value), 
                (value)=> _onAddressSelect(context, value)
              ),
            ),
          ],
        ),
        _buildTextField('Адресный ориентир', 'Введите данные'),
        _buildTitle('Нарушение'),
        _buildAutocomplete(
          'Код объекта контроля', 
          'Выберите значение', 
          null,
          (v) {}, 
          (v) {},
        ),
        _buildTextField('Описание нарушения', 'Введите данные'),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                children: [
                  _buildAutocomplete(
                    'Нормативно-правовой акт', 
                    'Выберите значение', 
                    null,
                    (v) {}, 
                    (v) {},
                    //null, state.normativeActs.length, (index)=> state.normativeActs[index].id, (index)=> state.normativeActs[index].toString(), 
                    padding: const EdgeInsets.only(right: 30)
                  ),
                  _buildAutocomplete(
                    'Пункт', 
                    'Выберите значение', 
                    null,
                    (v) {}, (v) {},
                    //null, state.normativeActArticles.length, (index)=> state.normativeActArticles[index].id, (index)=> state.normativeActArticles[index].toString(),
                    padding: const EdgeInsets.only(top: 20, right: 30)
                  ),
                ],
              ),
              _buildConnector(),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: _buildAutocomplete(
                'Код нарушения', 
                'Выберите значение', 
                null,
                (v) {}, (v) {},
                //null, state.violationTypes.length, (index)=> state.violationTypes[index].id, (index)=> state.violationTypes[index].toString()
              ),
            ),
            Padding(padding: const EdgeInsets.only(left: 35)),
            Flexible(
              child: _buildTextField('Статья КоАП', 'Введите данные'),
            ),
          ],
        ),
        _buildTitle('Фотоматериалы нарушения'),
        ImagePicker(),
        _buildTitle('Нарушители'),
        Column(
          children: List.generate(state.report.violation.violators.length, 
            (index) => _buildViolator(context, state, index),
          ),
        ),
        _buildAddViolator(context),
        _buildButtons(),
      ],
    );
  }

  Widget _buildViolator(BuildContext context, TotalReportBlocState state, int index) {
    final violator = state.report.violation.violators[index];
    return Column(
      children: [
        _buildCheckBox(
          'Нарушитель не выявлен', 
          violator.violatorNotFound,
          (value)=> _onViolatorNotFound(context, value, index),
        ),
        violator.violatorNotFound ? Container() :
        Column(
          children: [
            _buildAutocomplete('Тип нарушителя', 'Выберите значение',  null,
              (v) {}, (v) {},
              //null, state.violatorTypes.length, (index)=> state.violatorTypes[index].id, (index)=> state.violatorTypes[index].toString()
            ),
            _buildAutocomplete('Организация', 'Выберите значение',  null,
             (v) {}, (v) {},
              //null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: _buildTextField('ИНН', 'Введите данные'),
                ),
                Padding(padding: const EdgeInsets.only(left: 20)),
                Flexible(
                  child: _buildTextField('ОГРН', 'Введите данные'),
                ),
                Padding(padding: const EdgeInsets.only(left: 20)),
                Flexible(
                  child: _buildTextField('КПП', 'Введите данные'),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: _buildTextField('Дата регистрации', 'Введите дату значение'),
                ),
                Padding(padding: const EdgeInsets.only(left: 35)),
                Flexible(
                  child: _buildCheckBox(
                    'Иностранное Юрлицо', 
                    violator.foreign,
                    (value)=> _onViolatorForeign(context, value, index),
                    padding: const EdgeInsets.only(top: 40),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  child: _buildAutocomplete(
                    'Код ведомства', 
                    'Выберите значение',  
                    null,
                    (v) {}, (v) {},
                    //null, state.departmentCodes.length, (index)=> state.departmentCodes[index].id, (index)=> state.departmentCodes[index].toString()
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 35)),
                Flexible(
                  child: _buildTextField('Телефон', 'Введите данные'),
                ),
              ],
            ),
            _buildTextField('Фактический адрес', 'Введите данные'),
            _buildTextField('Юридический адрес', 'Введите данные'),
          ],
        ),
      ],
    );
  }

  Widget _buildAddViolator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: ()=> _onAddViolator(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.add_circle,
                color: ProjectColors.green,
                size: 20,
              ),
            ),
            Text('Добавить нарушителя',
              style: ProjectTextStyles.baseBold.apply(color: ProjectColors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ProjectButton.builtFlatButton('Сохранить проект',
            onPressed: () {}
          ),
          ProjectButton.builtFlatButton('Сохранить',
            onPressed: () {}
          ),
          ProjectButton.builtFlatButton('На согласование',
            onPressed: () {}
          ),
          ProjectButton.builtFlatButton('Удалить', 
            color: ProjectColors.red,
            onPressed: () {}
          ),
        ],
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: const EdgeInsets.only(top: 24),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(55.746875, 37.6200),
              zoom: 16.5  ,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c']
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              //alignment: Alignment.topRight,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 20, right: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildPinButton(Icons.add, ProjectColors.green),
                  _buildPinButton(Icons.close, ProjectColors.red),
                  _buildPinButton(Icons.play_arrow, ProjectColors.cyan)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPinButton(IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        //crossAxisAlignment: CrossAxisAlignment.end,
        alignment: Alignment.bottomRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(Icons.location_on,
              color: ProjectColors.darkBlue,
              size: 22,
            ),
          ),
          Icon(icon,
            size: 12,
            color: color,
          ),
        ],
      ),
    );
  }

  Widget _buildConnector() {
    return Stack(
      children: [
        Container(
          width: 20,
          height: 95,
          margin: const EdgeInsets.only(top: 47, right: 10),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: ProjectColors.lightBlue), right: BorderSide(color: ProjectColors.lightBlue), bottom: BorderSide(color: ProjectColors.lightBlue),)
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 85),
          child: Icon(Icons.add_circle,
            color: ProjectColors.green,
            size: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckBox(
    String title, 
    bool value, 
    Function(bool) onChanged, {
      TextStyle style, 
      EdgeInsets padding = const EdgeInsets.only(top: 20)
    }
  ) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          ProjectCheckbox(
            value: value,
            onChanged: onChanged,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title,
              style: (style ?? ProjectTextStyles.base).apply(color: ProjectColors.black),
            ),
          ),
        ],
      ),
    );
  } 

  Widget _buildTextField(String title, String hintText, {EdgeInsets padding = const EdgeInsets.only(top: 20)}) {
    return Padding(
      padding: padding,
      child: ProjectTextField(
        title: title,
        hintText: hintText, 
      )
    );
  }

  Widget _buildAutocomplete(String title, 
    String hintText, 
    TextEditingController controller,
    AutocompleteCallback suggestionsCallback, 
    Function(dynamic) onSuggestionSelected, {
    EdgeInsets padding = const EdgeInsets.only(top: 20),
  }) {
    return Padding(
      padding: padding,
      child: ProjectAutocomplete(title,
        controller: controller,
        hintText: hintText,
        suggestionsCallback: suggestionsCallback,
        onSuggestionSelected: onSuggestionSelected,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return ProjectTitle(title);
  }
}
