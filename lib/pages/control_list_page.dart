import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/pages/control_page.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/status.dart';
import 'package:inspector/widgets/control/task.dart';
import 'package:inspector/widgets/filter_appbar.dart';
import 'package:intl/intl.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class ControlListPage extends StatefulWidget {

  const ControlListPage();

  @override
  ControlListPageState createState() => ControlListPageState();
}


class ControlListPageState extends State<ControlListPage> {

  bool mapContent = true;

  void _onControl() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ControlPage()));
  }

  void _onMap(bool value) {
    setState(() {
      mapContent = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppbar('Ведомственный контроль'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildSwitchIcon(Icon(Icons.format_list_bulleted, color: ProjectColors.darkBlue), 'Списком'),
                CupertinoSwitch(
                  value: mapContent, 
                  activeColor: ProjectColors.darkBlue,
                  trackColor: ProjectColors.darkBlue,
                  onChanged: _onMap,
                ),
                _buildSwitchIcon(ProjectIcons.pinIcon(color: ProjectColors.darkBlue), 'На карте'),     
              ],
            ),
          ),
          Expanded(
            child: mapContent ? 
            Stack(
              alignment: Alignment.bottomCenter,
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
                    PolygonLayerOptions(
                      polygons: [
                        Polygon(
                          color: ProjectColors.red.withOpacity(0.5),
                          borderColor: ProjectColors.blue,
                          borderStrokeWidth: 1,
                          points: [
                            LatLng(55.7479487, 37.6207602),
                            LatLng(55.7481479, 37.6206958),
                            LatLng(55.7479849, 37.6194942),
                            LatLng(55.7459921, 37.6205993),
                            LatLng(55.7461612, 37.6208138),
                            LatLng(55.7477554, 37.6199126),
                            LatLng(55.7477192, 37.6202667),
                            LatLng(55.7478581, 37.620374),
                            LatLng(55.7479849, 37.620728),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          _buildInfo(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                            child: Row(
                              children: [
                                ProjectButton.buildOutlineButton('Нарушений не выявлено', color: ProjectColors.green, onPressed: ()=>{}),
                                Padding(padding: const EdgeInsets.only(left: 20)),
                                ProjectButton.buildOutlineButton('Зафиксировать нарушение', color: ProjectColors.red, onPressed: ()=>{})
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ) :
            ListView(
              padding: const EdgeInsets.only(top: 20),
              children: [
                _buildControl(context),
                _buildControl(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchIcon(Widget icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(title,
              style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo() {
    return InkWell(
      onTap: _onControl,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      ControlStatusWidget('ОДХ', '1995126'),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text('Проспект Мира, 81',
                            style: ProjectTextStyles.base.apply(color: ProjectColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Останкинский / СВАО',
                  style: ProjectTextStyles.base.apply(color: ProjectColors.darkBlue),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text('ГБУ “Жилищник Останкинского района”',
                style: ProjectTextStyles.base.apply(color: ProjectColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  _buildIcon(ProjectIcons.cameraIcon(), '2'),
                  _buildIcon(ProjectIcons.alertIcon(), '2'),
                  _buildIcon(ProjectIcons.calendarIcon(), DateFormat('dd.MM.yyyy').format(DateTime.now()) + ' (2 дня)'),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControl(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ProjectColors.lightBlue, 
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ClipRect(
            child: Slidable(
              actionExtentRatio: 0.15,
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: [
                _buildAction(
                  context,
                  ProjectIcons.thumbUpIcon(
                    padding: const EdgeInsets.only(bottom: 7)
                  ),
                  'Нарушений\nне выявлено',
                ),
                _buildAction(
                  context,
                  ProjectIcons.thumbDownIcon(
                    padding: const EdgeInsets.only(bottom: 3)
                  ),
                  'Выявлено\nнарушение',
                ),
                _buildAction(
                  context,
                  ProjectIcons.pinIcon(
                    padding: const EdgeInsets.only(bottom: 5)
                  ),
                  'Показать на\nкарте',
                ),
                _buildAction(
                  context,
                  ProjectIcons.viewIcon(color: ProjectColors.darkBlue,),
                  'Просмотр\nобъекта',
                ),
              ],
              child: _buildInfo()
            ),
          ),
          Column(
            children: [
              ControlTaskWidget(),
              ControlTaskWidget()
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIcon(Widget icon, String title) {
    return Row(
      children: [
        icon,
         Padding(
          padding: const EdgeInsets.only(left: 7, right: 15),
          child: Text(title,
            style: ProjectTextStyles.base.apply(color: ProjectColors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildAction(BuildContext context, Widget icon, String text) {
    return InkWell(
      //onTap: ()=> _onAddressReport(context, status),
      child: Container(
        decoration: BoxDecoration(
          color: ProjectColors.grey,
          border: Border(right: BorderSide(color: ProjectColors.lightBlue))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 34,
              child: icon,
            ),
            Text(text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction.apply(color: ProjectColors.black),
            ),
          ],
        ),
      ),
    );
  }

}

class ControlSreen extends StatelessWidget {
  const ControlSreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(name: 'vknavigator',);
  }
}