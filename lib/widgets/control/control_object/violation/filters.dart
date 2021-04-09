import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_object_filters/bloc.dart';
import 'package:inspector/blocs/control_object_filters/event.dart';
import 'package:inspector/blocs/control_object_filters/state.dart';
import 'package:inspector/model/department_control/dcviolation_kind.dart';
import 'package:inspector/model/department_control/dcviolation_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';
import 'package:inspector/extensions.dart';

class ViolationFilters extends StatelessWidget {
  ViolationFilters({
    Key key,
    @required this.statuses,
    @required this.sources,
    @required this.violationTypes,
    @required this.violationKinds,
    @required this.onConfirm,
    this.initialFilters,
  }) : super(key: key);

  static const _searchResults = {
    null: 'Все',
    false: 'Нарушений не выявлено',
    true: 'Выявлено нарушение',
  };

  final List<ViolationStatus> statuses;
  final List<Source> sources;
  final List<DCViolationType> violationTypes;
  final List<DCViolationKind> violationKinds;

  final ControlObjectFilters initialFilters;

  final _violationNumController = TextEditingController();

  final Future<void> Function(ControlObjectFilters) onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ControlObjectFiltersBloc>(
      create: (_) => ControlObjectFiltersBloc(state: initialFilters),
      child: BlocBuilder<ControlObjectFiltersBloc, ControlObjectFilters>(
        builder: (context, state) {
          (state.violationNum ?? '').let((s) {
            if (_violationNumController.text != s) {
              _violationNumController.text = s;
            }
          });
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProjectDatePicker(
                    title: 'Дата обследования',
                    hintText: 'Выберите дату',
                    values: [
                      if (state.surveyDateFrom != null) state.surveyDateFrom,
                      if (state.surveyDateTo != null) state.surveyDateTo,
                    ],
                    onChanged: (value) {
                      DateTime dateFrom;
                      DateTime dateTo;
                      if (value.length > 0) {
                        dateFrom = value[0];
                      }
                      if (value.length > 1) {
                        dateTo = value[1];
                      }
                      BlocProvider.of<ControlObjectFiltersBloc>(context)
                          .add(ChangeDatesEvent(
                        startDate: dateFrom,
                        finishDate: dateTo,
                      ));
                    },
                  ),
                  _buildSelect<bool>(
                    list: _searchResults.keys.toList(),
                    formatter: (item) => _searchResults[item],
                    title: 'Результат обследования',
                    onChanged: (item) =>
                        BlocProvider.of<ControlObjectFiltersBloc>(context).add(
                      ChangeViolationExistsEvent(
                        result: item,
                      ),
                    ),
                    value: state.violationExists,
                  ),
                  ProjectTextField(
                    title: 'Номер нарушения',
                    controller: _violationNumController,
                    hintText: 'Введите номер нарушения',
                    enabled: true,
                    onChanged: (value) =>
                        BlocProvider.of<ControlObjectFiltersBloc>(context).add(
                      ChangeViolationNumEvent(
                        value,
                      ),
                    ),
                  ),
                  _buildSelect<ViolationStatus>(
                    list: List.from(statuses)
                      ..insert(0, ViolationStatus(id: null, name: 'Все')),
                    formatter: (item) => item.name,
                    title: 'Статус нарушения',
                    onChanged: (item) =>
                        BlocProvider.of<ControlObjectFiltersBloc>(context).add(
                      ChangeViolationStatusEvent(item),
                    ),
                    value: state.violationStatus,
                  ),
                  _buildSelect<DCViolationType>(
                    list: List.from(violationTypes)
                      ..insert(0, DCViolationType(id: null, name: 'Все')),
                    formatter: (item) => item.name,
                    title: 'Тип нарушения',
                    onChanged: (item) =>
                        BlocProvider.of<ControlObjectFiltersBloc>(context).add(
                      ChangeViolationTypeEvent(item),
                    ),
                    value: state.dcViolationType,
                  ),
                  _buildSelect<DCViolationKind>(
                    list: List.from(violationKinds)
                      ..insert(0, DCViolationKind(id: null, name: 'Все')),
                    formatter: (item) => item.name,
                    title: 'Вид нарушения',
                    onChanged: (item) =>
                        BlocProvider.of<ControlObjectFiltersBloc>(context).add(
                      ChangeViolationKindEvent(item),
                    ),
                    value: state.dcViolationKind,
                  ),
                  _buildSelect<Source>(
                    list: List.from(sources)
                      ..insert(0, Source(id: null, name: 'Все')),
                    formatter: (item) => item.name,
                    title: 'Источник данных',
                    onChanged: (item) =>
                        BlocProvider.of<ControlObjectFiltersBloc>(context).add(
                      ChangeSourceEvent(item),
                    ),
                    value: state.source,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ProjectButton.buildOutlineButton(
                      'Отменить',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ProjectButton.builtFlatButton(
                      'Сохранить',
                      onPressed: () async {
                        await onConfirm(state);
                        Navigator.of(context).pop();
                      },
                    ),
                  ]),
                ]
                    .map(
                      (e) => Padding(
                        child: e,
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSelect<T>({
    List<T> list,
    String Function(T) formatter,
    String title,
    void Function(T) onChanged,
    T value,
  }) {
    return ProjectSelect(
      list.length,
      value ?? list[0],
      (index) => list[index],
      (index) => formatter(list[index]),
      onChanged: (item) => onChanged(item),
      hintText: 'Введите данные',
      title: title,
    );
  }
}
