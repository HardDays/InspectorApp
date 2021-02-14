import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_object/bloc.dart';
import 'package:inspector/blocs/control_object/event.dart';
import 'package:inspector/blocs/control_object/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/control_object_info.dart';
import 'package:inspector/widgets/control/control_object/violation/violation_short_search_result_widget.dart';
import 'package:provider/provider.dart';

class ControlObjectPage extends StatelessWidget {
  ControlObjectPage(this._controlObject);

  final ControlObject _controlObject;
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ControlObjectBloc>(
      create: (context) => ControlObjectBloc(
        object: _controlObject,
        departmentControlService:
            Provider.of<DepartmentControlService>(context, listen: false),
        notificationBloc: BlocProvider.of<NotificationBloc>(context),
      ),
      child: Scaffold(
        appBar: ProjectAppbar('Объект ведомственного контроля'),
        body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: RefreshIndicator(
            key: _refreshKey,
            onRefresh: () async {
              BlocProvider.of<ControlObjectBloc>(context)
                  .add(ControlObjectBlocEvent.loadEvent());
              await BlocProvider.of<ControlObjectBloc>(context)
                  .firstWhere((e) => e is! LoadingState);
            },
            child: SingleChildScrollView(
              child: BlocBuilder<ControlObjectBloc, ControlObjectBlocState>(
                builder: (context, state) {
                  _refreshKey.currentState?.show();
                  return Column(
                    children: [
                      ControlObjectInfo(
                        controlObject: _controlObject,
                      ),
                      if (_controlObject.violations?.isNotEmpty)
                        _buildViolationsSection(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(Widget icon, String title) {
    return Row(
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            title,
            style: ProjectTextStyles.small.apply(color: ProjectColors.black),
          ),
        )
      ],
    );
  }

  Widget _buildFiltersSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildIcon(
              ProjectIcons.sortIcon(color: ProjectColors.blue), 'По статусу'),
          Padding(padding: const EdgeInsets.only(left: 15)),
          _buildIcon(
              ProjectIcons.filterIcon(color: ProjectColors.blue), 'Фильтр'),
        ],
      ),
    );
  }

  Widget _buildViolationsSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //_buildFiltersSection(),
        _buildViolationsList(),
      ],
    );
  }

  Widget _buildViolationsList() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ProjectColors.lightBlue),
      ),
      child: ListView(
        shrinkWrap: true,
        children: _controlObject.violations
            .map((violation) => ViolationShortSearchResultWidget(
                  violation: violation,
                  onClick: () {},
                  onCompleted: () {},
                  onNotCompleted: () {},
                  onRemove: () {},
                ))
            .toList(),
      ),
    );
  }
}
