import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_object/bloc.dart';
import 'package:inspector/blocs/control_object/event.dart';
import 'package:inspector/blocs/control_object/state.dart';
import 'package:inspector/blocs/control_object_filters/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/dcviolation.dart';
import 'package:inspector/model/department_control/dcviolation_kind.dart';
import 'package:inspector/model/department_control/dcviolation_type.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/model/department_control/violation_short_search_result.dart';
import 'package:inspector/pages/control_violation_form_page.dart';
import 'package:inspector/pages/control_violation_page.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:inspector/style/appbar.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/control_object_info.dart';
import 'package:inspector/widgets/control/control_object/perform_control_form.dart';
import 'package:inspector/widgets/control/control_object/search_result/search_result_widget.dart';
import 'package:inspector/widgets/control/control_object/violation/filters.dart';
import 'package:inspector/widgets/control/control_object/violation/violation_search_result_widget.dart';
import 'package:inspector/widgets/control/control_object/violation/violation_short_search_result_widget.dart';
import 'package:intl/intl.dart';
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
        networkStatusService:
            Provider.of<NetworkStatusService>(context, listen: false),
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
                  .stream
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ControlObjectInfo(
                          controlObject: _controlObject,
                        ),
                      ),
                      _buildFiltersSection(context, state.filters),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30, top: 15),
                        child: state.maybeMap(
                          loadedWithListState: (state) => _buildSearchResults(
                              state.controlSearchResults,
                              context,
                              _refreshKey.currentContext),
                          orElse: () => Container(), //_buildViolationsList(
                          //state.object.violations, context),
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

  Widget _buildIcon(Widget icon, String title, Future<void> Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                title,
                style:
                    ProjectTextStyles.small.apply(color: ProjectColors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFiltersSection(
      BuildContext context, ControlObjectFilters filters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // _buildIcon(
        //     ProjectIcons.sortIcon(color: ProjectColors.blue), 'По статусу'),
        // Padding(padding: const EdgeInsets.only(left: 15)),
        _buildIcon(
          ProjectIcons.filterIcon(color: ProjectColors.blue),
          'Фильтр',
          () async => _openFilters(context, filters),
        ),
      ],
    );
  }

  Widget _buildSearchResults(List<ControlResultSearchResult> searchResults,
      BuildContext context, BuildContext blocContext) {
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
                            },
                            onCancel: () {},
                            violationNum: searchResult.violation.violationNum,
                            performControl: PerformControl(
                              factDate: DateTime.now(),
                              photos: <DCPhoto>[],
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
                            },
                            onCancel: () {},
                            violationNum: searchResult.violation.violationNum,
                            performControl: PerformControl(
                              factDate: DateTime.now(),
                              photos: <DCPhoto>[],
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
                    //TODO: 1566
                    onEdit: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ControlViolationFormPage(
                            controlObject: _controlObject,
                            violation: DCViolation(
                              id: searchResult.violation.id,
                              violator: searchResult.violation.violator,
                              address: searchResult.violation.address,
                              additionalFeatures:
                                  searchResult.violation.additionalFeatures,
                              btiAddress: searchResult.violation.btiAddress,
                              controlDate: searchResult.violation.controlDate,
                              critical: searchResult.violation.critical,
                              btiRefAddress:
                                  searchResult.violation.btiRefAddress,
                              description: searchResult.violation.description,
                              detectionDate:
                                  searchResult.violation.detectionDate,
                              eknViolationClassification: searchResult
                                  .violation.eknViolationClassification,
                              objectElement:
                                  searchResult.violation.objectElement,
                              otherViolationClassification: searchResult
                                  .violation.otherViolationClassification,
                              photos: searchResult.violation.photos,
                              refAddressTinao:
                                  searchResult.violation.refAddressTinao,
                              resolveDate: searchResult.violation.resolveDate,
                            ),
                            onConfirm: (result) {
                              BlocProvider.of<ControlListBloc>(context).add(
                                  ControlListBlocEvent.updateControlResultEvent(
                                      _controlObject,
                                      searchResult.id,
                                      result,
                                      BlocProvider.of<ControlObjectBloc>(
                                          blocContext),
                                      searchResult.violation.performControls !=
                                          null));
                            },
                            violationNum:
                                'Нарушение №${searchResult.violation.violationNum} от ${DateFormat("dd.MM.yyyy")}',
                          ),
                        ),
                      );
                    },
                  )
                : SearchResultWidget(
                    searchResult: searchResult,
                    onRemove: searchResult.violation?.cafapAssigmentId == null
                        ? () {
                            BlocProvider.of<ControlListBloc>(context).add(
                              ControlListBlocEvent.removeViolationEvent(
                                  _controlObject, searchResult.id),
                            );
                          }
                        : null,
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
                        },
                        onCancel: () {},
                        violationNum: violation.violationNum,
                        performControl: PerformControl(
                          factDate: DateTime.now(),
                          photos: <DCPhoto>[],
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
                          //TODO: перенести реализацию проверки отправки в ЦАФАП в блок

                          BlocProvider.of<ControlListBloc>(context).add(
                            ControlListBlocEvent.registerPerformControlEvent(
                              performControl,
                              _controlObject,
                              violation.id,
                            ),
                          );
                        },
                        onCancel: () {},
                        violationNum: violation.violationNum,
                        performControl: PerformControl(
                          factDate: DateTime.now(),
                          photos: <DCPhoto>[],
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

  void _openFilters(BuildContext context, ControlObjectFilters filters) async {
    final dictionaryService =
        Provider.of<DictionaryService>(context, listen: false);
    final statuses = await dictionaryService.getDCViolationStatuses();
    final types = [
      DCViolationType(id: 1, name: 'Простое'),
      DCViolationType(id: 2, name: 'Грубое'),
    ];
    final kinds = [
      DCViolationKind(id: 1, name: 'Устранимое'),
      DCViolationKind(id: 1, name: 'Неустранимое'),
    ];
    final sources = (await dictionaryService.getDCSources())
        .where((element) => ['ОАТИ', 'ЦАФАП'].contains(element.name))
        .toList();
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return Material(
          child: ViolationFilters(
            initialFilters: filters,
            statuses: statuses,
            sources: sources,
            violationTypes: types,
            violationKinds: kinds,
            onConfirm: (filters) async {
              BlocProvider.of<ControlObjectBloc>(context)
                  .add(ControlObjectBlocEvent.changeFitersEvent(filters));
            },
          ),
        );
      },
    );
  }
}
