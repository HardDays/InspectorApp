import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:inspector/blocs/total_report/bloc.dart';
import 'package:inspector/blocs/total_report/events.dart';
import 'package:inspector/blocs/total_report/states.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/checkbox.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/title.dart';
import 'package:latlong/latlong.dart';
import 'package:inspector/widgets/image_picker.dart';

class TotalReportPage extends StatefulWidget {

  //todo: make according api model
  final String status;

  TotalReportPage(this.status);

  @override
  TotalReportPageState createState() => TotalReportPageState();
}


class TotalReportPageState extends State<TotalReportPage> with SingleTickerProviderStateMixin {

  String status;

  void initState() {
    super.initState();

    status = widget.status;
  }

  void _onStatus(String value) {
    setState(() {
      status = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context)=> TotalReportBloc(TotalReportBlocState())..add(LoadEvent()),
      child: BlocBuilder<TotalReportBloc, TotalReportBlocState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: ProjectAppbar('Рапорт'),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    _buildCheckBox('Данные, указывающие на наличие события нарушения, не установлены', padding: EdgeInsets.zero, style: ProjectTextStyles.baseBold),
                    _buildMap(),
                    _buildTextField('Ручной поиск по карте', 'Введите или выберите значение'),
                    _buildTitle('Адрес нарушения'),
                    Row(
                      children: [
                        Flexible(
                          child: _buildCheckBox('Определить адрес по местоположению'),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: _buildCheckBox('ТиНАО'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: _buildSelect('Улица', 'Выберите значение', 
                            null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].toString()
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: _buildSelect('Дом, корпус, строение', 'Выберите значение', 
                            null, state.addresses.length, (index)=> state.addresses[index].id, (index)=> state.addresses[index].toShortString()
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: _buildSelect('Округ', 'Выберите значение', 
                            null, state.areas.length, (index)=> state.areas[index].id, (index)=> state.areas[index].toString()
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(left: 35)),
                        Flexible(
                          child: _buildSelect('Район', 'Выберите значение', 
                            null, state.districts.length, (index)=> state.districts[index].id, (index)=> state.districts[index].toString()
                          ),
                        ),
                      ],
                    ),
                    _buildTextField('Адресный ориентир', 'Введите данные'),
                    _buildTitle('Нарушение'),
                    _buildSelect('Код объекта контроля', 'Выберите значение', 
                      null, state.specialObjects.length, (index)=> state.specialObjects[index].id, (index)=> state.specialObjects[index].toString()
                    ),
                    _buildTextField('Описание нарушения', 'Введите данные'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Column(
                            children: [
                              _buildSelect('Нормативно-правовой акт', 'Выберите значение', 
                                null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name, 
                                padding: const EdgeInsets.only(right: 30)
                              ),
                              _buildSelect('Пункт', 'Выберите значение', 
                                null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name,
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
                          child: _buildSelect('Код нарушения', 'Выберите значение', 
                            null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name
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
                    _buildCheckBox('Нарушитель не выявлен'),
                    _buildSelect('Тип нарушителя', 'Выберите значение', 
                      null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name
                    ),
                    _buildSelect('Организация', 'Выберите значение', 
                      null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name
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
                          child: _buildCheckBox('Иностранное Юрлицо', padding: const EdgeInsets.only(top: 40)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: _buildSelect('Код ведомства', 'Выберите значение', 
                            null, state.streets.length, (index)=> state.streets[index].id, (index)=> state.streets[index].name
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
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
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
                    ),
                    Container(
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
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      )
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

  Widget _buildCheckBox(String title, {TextStyle style, EdgeInsets padding = const EdgeInsets.only(top: 20)}) {
    return Padding(
      padding: padding,
      child: Row(
        children: [

          ProjectCheckbox(
            value: true,
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

  Widget _buildSelect(String title, String hintText, int value, int count, Function(int) itemValue, Function(int) itemTitle, {EdgeInsets padding = const EdgeInsets.only(top: 20)}) {
    return Padding(
      padding: padding,
      child: ProjectSelect<int>(
        count,
        value,
        itemValue,
        itemTitle,
        title: title,
        hintText: hintText,
        onChanged: (t) {},
      ),
    );
  }

  Widget _buildTitle(String title) {
    return ProjectTitle(title);
  }
}
