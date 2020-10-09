import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ProjectColors.darkBlue,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            'Рапорт',
            style: ProjectTextStyles.title.apply(
              color: ProjectColors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            children: [
              _buildCheckBox('Данные, указывающие на наличие события нарушения, не установлены', padding: EdgeInsets.zero, style: ProjectTextStyles.baseBold),
              Container(
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
              ),
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
                    child: _buildSelect('Улица', 'Выберите значение'),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildSelect('Дом, корпус, строение', 'Выберите значение'),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: _buildSelect('Округ', 'Выберите значение'),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildSelect('Район', 'Выберите значение'),
                  ),
                ],
              ),
              _buildTextField('Адресный ориентир', 'Введите данные'),
              _buildTitle('Нарушение'),
              _buildSelect('Код объекта контроля', 'Выберите значение'),
              _buildTextField('Описание нарушения', 'Введите данные'),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Column(
                      children: [
                        _buildSelect('Нормативно-правовой акт', 'Выберите значение', padding: const EdgeInsets.only(right: 30)),
                        _buildSelect('Пункт', 'Выберите значение', padding: const EdgeInsets.only(top: 20, right: 30)),
                      ],
                    ),
                    Container(
                      width: 20,
                      height: 95,
                      margin: const EdgeInsets.only(top: 47, right: 10),
                      decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: ProjectColors.lightBlue), right: BorderSide(color: ProjectColors.lightBlue), bottom: BorderSide(color: ProjectColors.lightBlue),)
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 85),
                      child: Icon(Icons.add_circle,
                        color: ProjectColors.green,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: _buildSelect('Код нарушения', 'Выберите значение'),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: _buildTextField('Статья КоАП', 'Введите данные'),
                  ),
                ],
              ),
              _buildTitle('Фотоматериалы нарушения'),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ImagePicker(),
              ),
              _buildTitle('Нарушители'),
              _buildCheckBox('Нарушитель не выявлен'),
              _buildSelect('Тип нарушителя', 'Выберите значение'),
              _buildSelect('Организация', 'Выберите значение'),
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
                    child: _buildSelect('Код ведомства', 'Выберите значение'),
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

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: ProjectColors.lightBlue,
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

  Widget _buildCheckBox(String title, {TextStyle style, EdgeInsets padding = const EdgeInsets.only(top: 20)}) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 10),
            child: Checkbox(value: false, onChanged: null),
          ),
          Text(title,
            style: (style ?? ProjectTextStyles.base).apply(color: ProjectColors.black),
          )
        ],
      ),
    );
  } 

  Widget _buildTextField(String title, String hint, {EdgeInsets padding = const EdgeInsets.only(top: 20)}) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              style: ProjectTextStyles.base.apply(color: ProjectColors.black),
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.only(left: 10, top: 15, right: 10),
                hintStyle: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: ProjectColors.lightBlue)
                ),
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: ProjectColors.lightBlue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: ProjectColors.lightBlue)
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelect(String title, String hint, {EdgeInsets padding = const EdgeInsets.only(top: 20)}) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ProjectColors.lightBlue)
            ),
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
            child: DropdownButton(
              isExpanded: true,
              isDense: true,
              underline: Container(),
              style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
              hint: Text(hint,
                style: ProjectTextStyles.medium.apply(color: ProjectColors.darkBlue),
              ),
              icon: const Icon(Icons.keyboard_arrow_down, color: ProjectColors.darkBlue),
              items: [
                DropdownMenuItem(
                  value: '1',
                  child: Text('1',
                  ),
                ),
                DropdownMenuItem(
                  value: '2',
                  child: Text('2',
                  ),
                )
              ],
              onChanged: (value) {}
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(String title, {EdgeInsets padding = const EdgeInsets.only(top: 24)}) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
            style: ProjectTextStyles.subTitle.apply(color: ProjectColors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: _buildDivider(),
          ),
        ],
      ),
    );
  }
}
