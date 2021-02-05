import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/model/control_object.dart';
import 'package:inspector/pages/control_object_page.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/switch.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/status.dart';
import 'package:inspector/widgets/control/violation.dart';
import 'package:inspector/style/filter_appbar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong/latlong.dart';

class ControlListPage extends StatefulWidget {
  const ControlListPage();

  @override
  ControlListPageState createState() => ControlListPageState();
}

class ControlListPageState extends State<ControlListPage> {
  bool mapContent = false;

  void _onControl(ControlObject object) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ControlObjectPage(object)),
    );
  }

  void _onMap(bool value) {
    setState(() {
      mapContent = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlListBloc, ControlListBlocState>(
      builder: (context, state) {
        Widget body = Center(
          child: CircularProgressIndicator(),
        );
        if (state is LoadedState) {
          body = _buildLoadedBody(context, state);
        }
        if (state is CantWorkInThisModeState) {
          body = _cantWorkInThisMode();
        }
        if (state is LoadedEmptyState) {
          body = Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                'Поблизости не найдено объектов ведомственного контроля. Попробуйте отключить поиск по местоположению.',
                textAlign: TextAlign.center,
                style: ProjectTextStyles.mediumBold,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: FilterAppbar(
            'Ведомственный контроль',
            '',
            '',
            '',
            onUpdate: () {
              BlocProvider.of<ControlListBloc>(context)
                  .add(ControlListBlocEvent.refreshControlListEvent());
            },
          ),
          body: body,
        );
      },
    );
  }

  Widget _cantWorkInThisMode() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(
          'На данный момент работа в разделе "Ведомственный контроль" в ручном режиме передачи данных или режиме offline не поддерживается',
          textAlign: TextAlign.center,
          style: ProjectTextStyles.mediumBold,
        ),
      ),
    );
  }

  Widget _buildLoadedBody(BuildContext context, LoadedState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildSwitchIcon(
                  Icon(Icons.format_list_bulleted,
                      color: ProjectColors.darkBlue),
                  'Списком'),
              ProjectSwitch(
                checked: mapContent,
                onChanged: _onMap,
              ),
              _buildSwitchIcon(
                  ProjectIcons.pinIcon(color: ProjectColors.darkBlue),
                  'На карте'),
            ],
          ),
        ),
        Expanded(
          child: mapContent
              ? Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        center: LatLng(55.746875, 37.6200),
                        zoom: 16.5,
                      ),
                      layers: [
                        TileLayerOptions(
                            urlTemplate:
                                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                            subdomains: ['a', 'b', 'c']),
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
                              _buildInfo(state.objects.first),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 20, left: 20, bottom: 10),
                                child: Row(
                                  children: [
                                    ProjectButton.buildOutlineButton(
                                        'Нарушений не выявлено',
                                        color: ProjectColors.green,
                                        onPressed: () => {}),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20)),
                                    ProjectButton.buildOutlineButton(
                                        'Зафиксировать нарушение',
                                        color: ProjectColors.red,
                                        onPressed: () => {})
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : _buildList(state, context),
        ),
      ],
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
            child: Text(
              title,
              style: ProjectTextStyles.medium.apply(color: ProjectColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(LoadedState state, BuildContext context) {
    if(state is LoadedAllState) {
      return ListView(
          children: state.objects
              .map((e) => _buildControl(context, e))
              .toList(),
          );
    } else {
      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            BlocProvider.of<ControlListBloc>(context).add(ControlListBlocEvent.loadNextPageControlListEvent());
          }
          return true;
        },
        child: ListView(
          children: [
            ...state.objects
              .map((e) => _buildControl(context, e))
              .toList(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildInfo(ControlObject object) {
    return InkWell(
      onTap: () => _onControl(object),
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
                      ControlStatusWidget(
                          object.type.name, object.id.toString()),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            object.address ?? '',
                            style: ProjectTextStyles.base
                                .apply(color: ProjectColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  object.area ?? '',
                  style: ProjectTextStyles.base
                      .apply(color: ProjectColors.darkBlue),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Text(
                object.balanceOwner ?? '',
                style: ProjectTextStyles.base.apply(color: ProjectColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  _buildIcon(
                      ProjectIcons.cameraIcon(), object.cameraCount.toString()),
                  _buildIcon(
                      ProjectIcons.alertIcon(), object.violationsCount ?? '0'),
                  if (object.lastSurveyDate != null)
                    _buildDate(object.lastSurveyDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDate(DateTime date) {
    String daysText = '';
    int days = DateTime.now().difference(date).inDays;
    switch(days){
      case 0:
        daysText = '';
        break;
      case 1:
        daysText = '1 день';
        break;
      case 2:
      case 3:
      case 4:
        daysText = '2 дня';
        break;
      default:
        daysText = '$days дней';
    }
    return Row(
      children: [
        _buildIcon(
          ProjectIcons.calendarIcon(),
          '${DateFormat("dd.MM.yyyy").format(date)} ($daysText)',
        ), 
      ],
    );
  }

  Widget _buildControl(BuildContext context, ControlObject object) {
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
                        padding: const EdgeInsets.only(bottom: 7)),
                    'Нарушений\nне выявлено',
                  ),
                  _buildAction(
                    context,
                    ProjectIcons.thumbDownIcon(
                        padding: const EdgeInsets.only(bottom: 3)),
                    'Выявлено\nнарушение',
                  ),
                  _buildAction(
                    context,
                    ProjectIcons.pinIcon(
                        padding: const EdgeInsets.only(bottom: 5)),
                    'Показать на\nкарте',
                  ),
                  _buildAction(
                    context,
                    ProjectIcons.viewIcon(
                      color: ProjectColors.darkBlue,
                    ),
                    'Просмотр\nобъекта',
                  ),
                ],
                child: _buildInfo(object)),
          ),
          Column(
            children: object.violations
                .map((e) => ControlViolationWidget(
                      violation: e,
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _buildIcon(Widget icon, Object title) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 7, right: 15),
          child: Text(
            title.toString(),
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
            border: Border(right: BorderSide(color: ProjectColors.lightBlue))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 34,
              child: icon,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: ProjectTextStyles.smallAction
                  .apply(color: ProjectColors.black),
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
    return ExtendedNavigator(
      name: 'vknavigator',
    );
  }
}
