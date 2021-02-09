import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/pages/control_object_page.dart';
import 'package:inspector/pages/control_violation_form_page.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/switch.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/filter_appbar.dart';
import 'package:inspector/widgets/control/control_object_list.dart';
import 'package:inspector/widgets/control/control_object_map.dart';
import 'package:inspector/widgets/control/control_objects_paginated_list.dart';

typedef Future RefreshFunction();

class ControlListPage extends StatefulWidget {
  @override
  _ControlListPageState createState() => _ControlListPageState();
}

class _ControlListPageState extends State<ControlListPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControlListBloc, ControlListBlocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: FilterAppbar(
            'Ведомственный контроль',
            '',
            '',
            '',
            onUpdate: () {
              _refreshIndicatorKey.currentState?.show();
            },
          ),
          body: _buildBody(context, state),
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

  Widget _buildBody(BuildContext context, ControlListBlocState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildSwitchIcon(
                Icon(Icons.format_list_bulleted, color: ProjectColors.darkBlue),
                'Списком',
              ),
              ProjectSwitch(
                checked: state.showMap,
                onChanged: _onMapChanged(context),
              ),
              _buildSwitchIcon(
                ProjectIcons.pinIcon(color: ProjectColors.darkBlue),
                'На карте',
              ),
            ],
          ),
        ),
        if (state.showMap)
          state.map(
          (normalState) => normalState.listState.map(
            emptyListLoadedState: (emptyListLoadedState) =>
                _buildEmptyObjectsList(),
            loadedAllListState: (loadedAllListState) =>
              ControlObjectMap(
                controlObjects: loadedAllListState.objects,
                openControlObject: _onOpenControlObject(context),
                selectObject: _onSelectControlObject(context),
                hasNotViolations: _onHasNotViolations(context),
                hasViolation: _onHasViolations(context),
              ),
              loadingListState: (loadingListState) => Center(
                child: CircularProgressIndicator(),
              ),
              loadedListState: (loadedListState) =>
                ControlObjectMap(
                  controlObjects: loadedListState.objects,
                  openControlObject: _onOpenControlObject(context),
                  selectObject: _onSelectControlObject(context),
                  hasNotViolations: _onHasNotViolations(context),
                  hasViolation: _onHasViolations(context),
              ),
            ),
            cantWorkInThisModeState: (cantWorkInThisModeState) =>
                _cantWorkInThisMode(),
          )
          
        else
          Expanded(
            child: RefreshIndicator(
              onRefresh: _onRefreshList(context),
              key: _refreshIndicatorKey,
              child: state.map(
                (normalState) => normalState.listState.map(
                  emptyListLoadedState: (emptyListLoadedState) =>
                      _buildEmptyObjectsList(),
                  loadedAllListState: (loadedAllListState) =>
                      ControlObjectsLoadedList(
                    controlObjects: loadedAllListState.objects,
                    hasNotViolation: _onHasNotViolations(context),
                    hasViolation: _onHasViolations(context),
                    open: _onOpenControlObject(context),
                    showInMap: _onShowInMap(context),
                  ),
                  loadingListState: (loadingListState) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  loadedListState: (loadedListState) =>
                      ControlObjectsPaginatedList(
                    controlObjects: loadedListState.objects,
                    hasNotViolation: _onHasNotViolations(context),
                    hasViolation: _onHasViolations(context),
                    open: _onOpenControlObject(context),
                    showInMap: _onShowInMap(context),
                    loadNextPage: _onLoadNextPage(context),
                  ),
                ),
                cantWorkInThisModeState: (cantWorkInThisModeState) =>
                    _cantWorkInThisMode(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEmptyObjectsList() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  'Поблизости не найдено объектов ведомственного контроля. Попробуйте отключить поиск по местоположению.',
                  textAlign: TextAlign.center,
                  style: ProjectTextStyles.mediumBold,
                ),
              ),
            ],
          ),
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

  void Function(ControlObject) _onOpenControlObject(BuildContext context) =>
      (ControlObject object) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ControlObjectPage(object)),
        );
      };

  void Function(ControlObject) _onSelectControlObject(BuildContext context) =>
      (ControlObject object) {};

  void Function(ControlObject) _onHasNotViolations(BuildContext context) =>
      (ControlObject object) {};

  void Function(ControlObject) _onHasViolations(BuildContext context) =>
      (ControlObject object) async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ControlViolationFormPage(
              controlObject: object,
            ),
          ),
        );
      };

  void Function(ControlObject) _onShowInMap(BuildContext context) =>
      (ControlObject object) {
        BlocProvider.of<ControlListBloc>(context)
            .add(ControlListBlocEvent.openInMapEvent(object));
      };

  void Function(bool) _onMapChanged(BuildContext context) => (bool value) {
        BlocProvider.of<ControlListBloc>(context)
            .add(ControlListBlocEvent.changeShowMapEvent(value));
      };

  void Function() _onLoadNextPage(BuildContext context) =>
      () => BlocProvider.of<ControlListBloc>(context)
          .add(ControlListBlocEvent.loadNextPageControlListEvent());

  RefreshFunction _onRefreshList(BuildContext context) => () async {
        BlocProvider.of<ControlListBloc>(context)
            .add(ControlListBlocEvent.refreshControlListEvent());
        return BlocProvider.of<ControlListBloc>(context)
            .firstWhere((state) => !state.listState.refresh);
      };
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
