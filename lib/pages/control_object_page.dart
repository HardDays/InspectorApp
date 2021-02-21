import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_object/bloc.dart';
import 'package:inspector/blocs/control_object/event.dart';
import 'package:inspector/blocs/control_object/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/violation_short_search_result.dart';
import 'package:inspector/pages/control_violation_page.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/style/appbar.dart';

//import 'package:inspector/style/colors.dart';
import 'package:inspector/style/dialog.dart';

//import 'package:inspector/style/icons.dart';
//import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/control_object_info.dart';
import 'package:inspector/widgets/control/control_object/perform_control_form.dart';
import 'package:inspector/widgets/control/control_object/search_result/search_result_widget.dart';
import 'package:inspector/widgets/control/control_object/violation/violation_search_result_widget.dart';
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
              BlocProvider.of<ControlObjectBloc>(_refreshKey.currentContext)
                  .add(ControlObjectBlocEvent.loadEvent());
              await BlocProvider.of<ControlObjectBloc>(
                      _refreshKey.currentContext)
                  .firstWhere((e) => e is! LoadingState);
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: BlocBuilder<ControlObjectBloc, ControlObjectBlocState>(
                builder: (context, state) {
                  if (state is LoadedState && state.needRefresh)
                    _refreshKey.currentState?.show();
                  return Column(
                    children: [
                      ControlObjectInfo(
                        controlObject: _controlObject,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: state.maybeMap(
                          loadedWithListState: (state) => _buildSearchResults(
                              state.controlSearchResults, context),
                          orElse: () => _buildViolationsList(
                              state.object.violations, context),
                        ),
                      ),
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

  // Widget _buildIcon(Widget icon, String title) {
  //   return Row(
  //     children: [
  //       icon,
  //       Padding(
  //         padding: const EdgeInsets.only(left: 10),
  //         child: Text(
  //           title,
  //           style: ProjectTextStyles.small.apply(color: ProjectColors.black),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // Widget _buildFiltersSection() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 30),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         _buildIcon(
  //             ProjectIcons.sortIcon(color: ProjectColors.blue), 'По статусу'),
  //         Padding(padding: const EdgeInsets.only(left: 15)),
  //         _buildIcon(
  //             ProjectIcons.filterIcon(color: ProjectColors.blue), 'Фильтр'),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildSearchResults(
      List<ControlResultSearchResult> searchResults, BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: searchResults
          .map(
            (searchResult) => searchResult.violationExists
                ? ViolationSearchResultWidget(
                    searchResult: searchResult,
                    onClick: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ControlViolationPage(
                              controlObject: _controlObject,
                              searchResult: searchResult,
                            ),
                          ));
                    },
                    onCompleted: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext ctx) => ProjectDialog(
                          child: PerformControlFormWidget(
                            onConfirm: (performControl) {
                              BlocProvider.of<ControlListBloc>(context).add(
                                  ControlListBlocEvent
                                      .registerPerformControlEvent(
                                          performControl,
                                          _controlObject,
                                          searchResult.id));
                              Navigator.of(ctx).pop();
                            },
                            onCancel: () {
                              Navigator.of(ctx).pop();
                            },
                            violationNum: searchResult.violation.violationNum,
                            performControl: PerformControl(
                              factDate: DateTime.now(),
                              photos: List<DCPhoto>(),
                              planDate: DateTime.now(),
                              resolved: true,
                            ),
                          ),
                        ),
                      );
                    },
                    onNotCompleted: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext ctx) => ProjectDialog(
                          child: PerformControlFormWidget(
                            onConfirm: (performControl) {
                              BlocProvider.of<ControlListBloc>(context).add(
                                ControlListBlocEvent
                                    .registerPerformControlEvent(
                                  performControl,
                                  _controlObject,
                                  searchResult.id,
                                ),
                              );
                              Navigator.of(ctx).pop();
                            },
                            onCancel: () {
                              Navigator.of(ctx).pop();
                            },
                            violationNum: searchResult.violation.violationNum,
                            performControl: PerformControl(
                              factDate: DateTime.now(),
                              photos: List<DCPhoto>(),
                              planDate: DateTime.now(),
                              resolved: false,
                            ),
                          ),
                        ),
                      );
                    },
                    onRemove: () {
                      BlocProvider.of<ControlListBloc>(context).add(
                        ControlListBlocEvent.removeViolationEvent(
                          _controlObject,
                          searchResult.id,
                        ),
                      );
                    },
                  )
                : SearchResultWidget(
                    searchResult: searchResult,
                    onRemove: searchResult.violation?.cafapAssigmentId == null ? () {
                      BlocProvider.of<ControlListBloc>(context).add(
                          ControlListBlocEvent.removeViolationEvent(_controlObject, searchResult.id),
                      );
                    } : null,
                  ),
          )
          .toList(),
    );
  }

  Widget _buildViolationsList(
      List<ViolationShortSearchResult> violations, BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: violations
          .map((violation) => ViolationShortSearchResultWidget(
                violation: violation,
                onClick: () {},
                onCompleted: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext ctx) => ProjectDialog(
                      child: PerformControlFormWidget(
                        onConfirm: (performControl) {
                          BlocProvider.of<ControlListBloc>(context).add(
                            ControlListBlocEvent.registerPerformControlEvent(
                              performControl,
                              _controlObject,
                              violation.id,
                            ),
                          );
                          Navigator.of(ctx).pop();
                        },
                        onCancel: () {
                          Navigator.of(ctx).pop();
                        },
                        violationNum: violation.violationNum,
                        performControl: PerformControl(
                          factDate: DateTime.now(),
                          photos: List<DCPhoto>(),
                          planDate: DateTime.now(),
                          resolved: true,
                        ),
                      ),
                    ),
                  );
                },
                onNotCompleted: () async {
                  await showDialog(
                    context: context,
                    builder: (BuildContext ctx) => ProjectDialog(
                      child: PerformControlFormWidget(
                        onConfirm: (performControl) {
                          BlocProvider.of<ControlListBloc>(context).add(
                            ControlListBlocEvent.registerPerformControlEvent(
                              performControl,
                              _controlObject,
                              violation.id,
                            ),
                          );
                          Navigator.of(ctx).pop();
                        },
                        onCancel: () {
                          Navigator.of(ctx).pop();
                        },
                        violationNum: violation.violationNum,
                        performControl: PerformControl(
                          factDate: DateTime.now(),
                          photos: List<DCPhoto>(),
                          planDate: DateTime.now(),
                          resolved: false,
                        ),
                      ),
                    ),
                  );
                },
                onRemove: () {
                  BlocProvider.of<ControlListBloc>(context).add(
                      ControlListBlocEvent.removeViolationEvent(
                          _controlObject, violation.id));
                },
              ))
          .toList(),
    );
  }
}
