import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_violation_page/bloc.dart';
import 'package:inspector/blocs/control_violation_page/event.dart';
import 'package:inspector/blocs/control_violation_page/state.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/model/department_control/control_object.dart';
import 'package:inspector/model/department_control/control_result_search_result.dart';
import 'package:inspector/model/department_control/dcphoto.dart';
import 'package:inspector/model/department_control/perform_control.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/section.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/control/control_object/control_object_info.dart';
import 'package:inspector/widgets/control/control_object/perform_control_form.dart';
import 'package:inspector/widgets/control/control_object/violation/extension_period_form.dart';
import 'package:inspector/widgets/control/control_object/violation/page/has_date.dart';
import 'package:inspector/widgets/control/control_object/violation/page/perform_control.dart';
import 'package:inspector/widgets/control/control_object/violation/page/perform_mark.dart';
import 'package:inspector/widgets/control/control_object/violation/page/violation_extension_period_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ControlViolationPage extends StatelessWidget {
  ControlViolationPage({
    this.controlObject,
    this.searchResult,
    Key key,
  }) : super(key: key);

  final ControlObject controlObject;
  final ControlResultSearchResult searchResult;
  final _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ControlViolationPageBloc>(
      create: (context) => ControlViolationPageBloc(
        controlObject,
        searchResult,
        Provider.of<DepartmentControlService>(context, listen: false),
        BlocProvider.of<NotificationBloc>(context),
        Provider.of<NetworkStatusService>(context, listen: false),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: ProjectColors.darkBlue,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              'Нарушение ${searchResult.violation.violationNum ?? ""} от ${DateFormat("dd.MM.yyyy").format(searchResult.surveyDate)}',
              style: ProjectTextStyles.title.apply(
                color: ProjectColors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async {
            BlocProvider.of<ControlViolationPageBloc>(
                    _refreshKey.currentContext)
                .add(ControlViolationPageBlocEvent.refresh());
            await BlocProvider.of<ControlViolationPageBloc>(
                    _refreshKey.currentContext)
                .stream
                .firstWhere((state) => !state.refresh);
          },
          child: BlocListener<ControlViolationPageBloc,
              ControlViolationPageBlocState>(
            listener: (context, state) {
              if (state is InitialControlViolationPageBlocState) {
                _refreshKey.currentState?.show();
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Column(
                  children: [
                    ProjectSection(
                      'Статус нарушения',
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: ProjectColors.cyan),
                          ),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 4),
                          child: Text(
                            searchResult.violation.violationStatus?.name ??
                                'Сохранено локально',
                            style: ProjectTextStyles.smallBold
                                .apply(color: ProjectColors.cyan),
                          ),
                        ),
                      ),
                    ),
                    ControlObjectInfo(
                      controlObject: controlObject,
                    ),
                    _buildPropsSection(),
                    ProjectSection(
                      'Срок устранения',
                      description: _resolveDate,
                      child: _buildExtensionButton(),
                    ),
                    _buildDivider(),
                    _buildDescriptionSection(),
                    if (searchResult.violation.photos != null &&
                        searchResult.violation.photos.isNotEmpty)
                      ..._buildSectionTitle('Фотоматериалы'),
                    if (searchResult.violation.photos != null &&
                        searchResult.violation.photos.isNotEmpty)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: searchResult.violation.photos
                              .map(
                                (photo) => Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      SizedBox(
                                        width: 210,
                                        height: 140,
                                        child: Image(
                                          image: MemoryImage(
                                              base64.decode(photo.data)),
                                        ),
                                      ),
                                      if (photo.geometryX != null &&
                                          photo.geometryY != null)
                                        Container(
                                          width: 35,
                                          height: 35,
                                          color: ProjectColors.darkBlue,
                                          child: const Icon(
                                            Icons.my_location,
                                            color: Colors.white,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              )
                              .cast<Widget>()
                              .toList()
                                ..add((5 - 2) % 3 == 0
                                    ? SizedBox(width: 210)
                                    : Container()),
                        ),
                      ),
                    _buildPerformControl(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title, {Widget rightWidget}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        rightWidget != null
            ? Row(
                children: [
                  Text(
                    title ?? '',
                    style: ProjectTextStyles.subTitle
                        .apply(color: ProjectColors.black),
                  ),
                  Spacer(),
                  rightWidget,
                ],
              )
            : Text(
                title ?? '',
                style: ProjectTextStyles.subTitle
                    .apply(color: ProjectColors.black),
              ),
        Padding(
          padding: const EdgeInsets.only(top: 7),
          child: _buildDivider(),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      color: ProjectColors.lightBlue,
    );
  }

  Widget _buildPerformControl() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 5),
      child:
          BlocBuilder<ControlViolationPageBloc, ControlViolationPageBlocState>(
        builder: (context, state) {
          return state.map(
            initialState: (state) => Column(
              children: [
                _buildTitle(
                  'Контроль устранения нарушения',
                  rightWidget: CircularProgressIndicator(),
                ),
                _buildPerformControlsList(state.searchResult, context),
              ],
            ),
            loadedState: (state) => Column(
              children: [
                _buildTitle(
                  'Контроль устранения нарушения',
                  rightWidget: !state.editable
                      ? FlatButton(
                          child: Row(
                            children: [
                              ProjectIcons.addIcon(),
                              SizedBox(width: 10),
                              Text('Добавить',
                                  style: ProjectTextStyles.baseBold),
                            ],
                          ),
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext ctx) => ProjectDialog(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ProjectButton.buildOutlineButton(
                                      'Устранено',
                                      color: ProjectColors.green,
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (_) => ProjectDialog(
                                            child: PerformControlFormWidget(
                                              onConfirm: (performControl) {
                                                BlocProvider.of<
                                                            ControlViolationPageBloc>(
                                                        context)
                                                    .add(
                                                  ControlViolationPageBlocEvent
                                                      .createPerformControl(
                                                    performControl:
                                                        performControl,
                                                  ),
                                                );
                                              },
                                              onCancel: () {},
                                              violationNum: state.searchResult
                                                  .violation.violationNum,
                                              performControl: PerformControl(
                                                factDate: DateTime.now(),
                                                photos: <DCPhoto>[],
                                                planDate: DateTime.now(),
                                                resolved: true,
                                              ),
                                            ),
                                          ),
                                        );
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                    ),
                                    ProjectButton.buildOutlineButton(
                                      'Не устранено',
                                      color: ProjectColors.red,
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (_) => ProjectDialog(
                                            child: PerformControlFormWidget(
                                              onConfirm: (performControl) {
                                                BlocProvider.of<
                                                            ControlViolationPageBloc>(
                                                        context)
                                                    .add(
                                                  ControlViolationPageBlocEvent
                                                      .createPerformControl(
                                                    performControl:
                                                        performControl,
                                                  ),
                                                );
                                              },
                                              onCancel: () {},
                                              violationNum: state.searchResult
                                                  .violation.violationNum,
                                              performControl: PerformControl(
                                                factDate: DateTime.now(),
                                                photos: <DCPhoto>[],
                                                planDate: DateTime.now(),
                                                resolved: false,
                                              ),
                                            ),
                                          ),
                                        );
                                        Navigator.of(ctx).pop();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : null,
                ),
                _buildPerformControlsList(state.searchResult, context),
                if (state.hasUnsavedChanges)
                  Row(
                    children: [
                      Spacer(),
                      ProjectButton.buildOutlineButton(
                        'Отменить',
                        onPressed: () {
                          BlocProvider.of<ControlViolationPageBloc>(context)
                              .add(ControlViolationPageBlocEvent
                                  .discardChanges());
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ProjectButton.builtFlatButton(
                        'Сохранить',
                        onPressed: () {
                          BlocProvider.of<ControlViolationPageBloc>(context)
                              .add(ControlViolationPageBlocEvent.saveChanges());
                        },
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPerformControlsList(
      ControlResultSearchResult searchResult, BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <HasDate>[
        if (searchResult.violation.performControls != null &&
            searchResult.violation.performControls.isNotEmpty)
          ...searchResult.violation.performControls.map(
            (e) => PerformControlWidget(
              performControl: e,
              onRemove: (performControl) =>
                  BlocProvider.of<ControlViolationPageBloc>(context).add(
                ControlViolationPageBlocEvent.removePerformControl(
                  performControl: performControl,
                ),
              ),
              onResolveChanged: (performControl) =>
                  BlocProvider.of<ControlViolationPageBloc>(context).add(
                ControlViolationPageBlocEvent.editPerformControl(
                  performControl: performControl,
                ),
              ),
            ),
          ),
        if (searchResult.violation.performMarks != null &&
            searchResult.violation.performMarks.isNotEmpty)
          ...searchResult.violation.performMarks.map(
            (e) => PerformMarkWidget(
              performMark: e,
            ),
          ),
        if (searchResult.violation.extensionPeriods != null &&
            searchResult.violation.extensionPeriods.isNotEmpty)
          ...searchResult.violation.extensionPeriods.map(
            (e) => ViolationExtensionPeriodCard(
              violationExtensionPeriod: e,
            ),
          ),
      ]..sort((a, b) => a.date.compareTo(b.date)),
    );
  }

  List<Widget> _buildEknClassification() {
    return _buildNullableField(
      'Наименование нарушения по ЕКН',
      searchResult.violation.eknViolationClassification?.violationName?.name,
    );
  }

  List<Widget> _buildNullableField(String title, String value,
      {Widget widget}) {
    if (value != null && value.isNotEmpty) {
      return [
        ProjectSection(
          title,
          description: value,
          child: widget,
        ),
        _buildDivider(),
      ];
    } else {
      return [];
    }
  }

  Widget _buildExtensionButton() {
    return Builder(
      builder: (context) => IconButton(
        icon: ProjectIcons.editIcon(),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (ctx) => ProjectDialog(
              child: ExtensionPeriodForm(
                onCancel: () {
                  Navigator.of(ctx).pop();
                },
                onConfirm: (value) {
                  BlocProvider.of<ControlViolationPageBloc>(context).add(
                      ControlViolationPageBlocEvent.extendPeriod(
                          extensionPeriod: value));
                  Navigator.of(ctx).pop();
                },
                dictionaryService: Provider.of<DictionaryService>(
                  context,
                  listen: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildSectionTitle(String title) {
    return [
      Padding(
        padding: const EdgeInsets.only(top: 35, bottom: 10),
        child: _buildTitle(title),
      ),
    ];
  }

  Widget _buildSection({String title, Map<String, String> fields}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSectionTitle(title),
        ...fields.entries
            .map((field) => _buildNullableField(field.key, field.value))
            .toList(),
      ].expand((element) => element).toList(),
    );
  }

  String get _resolveDate => searchResult.violation.resolveDate != null
      ? DateFormat("dd.MM.yyyy").format(searchResult.violation.resolveDate)
      : '';

  Widget _buildPropsSection() => _buildSection(
        title: 'Реквизиты нарушения',
        fields: {
          'Номер ЦАФАП':
              searchResult.violation.cafapPrescriptionNum?.toString(),
          'Адрес нарушения': searchResult.violation.btiAddress?.toLongString(),
          'Адресный ориентир': searchResult.violation.address,
        },
      );

  Widget _buildDescriptionSection() => _buildSection(
        title: 'Описание нарушения',
        fields: {
          'Элемент объекта': searchResult.violation.objectElement.name,
          'Наименование нарушения по ЕКН': searchResult
              .violation.eknViolationClassification?.violationName?.name,
          'Нарушение, не входящее в ЕКН': searchResult
              .violation.otherViolationClassification?.violationName?.name,
          'Описание нарушения': searchResult.violation.description,
          'Критичность':
              searchResult.violation.critical ?? false ? 'Критично' : '',
          'Дополнительный признак': searchResult.violation.additionalFeatures
              .map((e) => e.name)
              .join(', '),
        },
      );
}
