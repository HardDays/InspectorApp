import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/instruction_filters/bloc.dart';
import 'package:inspector/blocs/instruction_filters/states.dart';
import 'package:inspector/blocs/instruction_filters/events.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';

class InstructionFiltersWidget extends StatefulWidget {

  final InstructionFilters filters;


  InstructionFiltersWidget(this.filters);

  @override
  _InstructionFiltersWidgetState createState() => _InstructionFiltersWidgetState();
}

class _InstructionFiltersWidgetState extends State<InstructionFiltersWidget> {
  TextEditingController _instructionNumController;

  void initState() {
    super.initState();
    _instructionNumController = TextEditingController(text: widget.filters?.instructionNum);
  }

  void dispose() {
    super.dispose();
    _instructionNumController.dispose();
  }

  void _onFind(BuildContext context, InstructionFilters filters) {
    final newFilters = filters.copyWith(
      instructionDateTo: filters.instructionDateTo,
      instructionDateFrom: filters.instructionDateFrom,
      checkDateTo: filters.checkDateTo,
      checkDateFrom: filters.checkDateFrom,
      instructionNum: _instructionNumController.text,
    );
    BlocProvider.of<InstructionFiltersBloc>(context).add(SaveEvent(newFilters));  
    Navigator.pop(context, newFilters);
  }

  void _onClear(BuildContext context) {
    _instructionNumController.clear();
    BlocProvider.of<InstructionFiltersBloc>(context).add(
      SaveEvent(
        InstructionFilters(
          instructionDateFrom: DateTime(DateTime.now().year), 
          instructionDateTo: DateTime.now(),
          checkDateFrom: DateTime(DateTime.now().year), 
          checkDateTo: DateTime.now(),
        ),
      ),
    );  
  }

  void _onStatus(BuildContext context, int status) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SetInstructionStatusEvent(status));  
  }

  void _onInstructionDateFrom(BuildContext context, List<DateTime> dates) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SetInstructionDateFromEvent(dates.isNotEmpty ? dates[0] : null)); 
  }

  void _onInstructionDateTo(BuildContext context, List<DateTime> dates) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SetInstructionDateToEvent(dates.isNotEmpty ? dates[0] : null));
  }

  void _onCheckDateFrom(BuildContext context, List<DateTime> dates) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SetCheckDateFromEvent(dates.isNotEmpty ? dates[0] : null)); 
  }

  void _onCheckDateTo(BuildContext context, List<DateTime> dates) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SetCheckDateToEvent(dates.isNotEmpty ? dates[0] : null));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InstructionFiltersBloc(InstructionFiltersBlocState([], widget.filters))..add(LoadEvent()),
      child: BlocBuilder<InstructionFiltersBloc, InstructionFiltersBlocState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ProjectTextField(
                      title: 'Номер поручения',
                      hintText: 'Введите данные',
                      controller: _instructionNumController,
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left: 35)),
                  Flexible(
                    child: ProjectSelect(
                      state.statuses.length,
                      state.filters.instructionStatus,
                      (index) => state.statuses[index].id,
                      (index) => state.statuses[index].name,
                      title: 'Статус поручения',
                      hintText: 'Все',
                      onChanged: (status)=> _onStatus(context, status),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ProjectDatePicker(
                        title: 'Дата поручения с',
                        hintText: 'Выберите дату',
                        singleDate: true,
                        clearEnabled: true,
                        values: [state.filters.instructionDateFrom],
                        onChanged: (date) => _onInstructionDateFrom(context, date),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectDatePicker(
                        title: 'Дата поручения по',
                        hintText: 'Выберите дату',
                        singleDate: true,
                        clearEnabled: true,
                        values: [state.filters.instructionDateTo],
                        onChanged: (date) => _onInstructionDateTo(context, date),
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: ProjectDatePicker(
                        title: 'Дата обследования с',
                        hintText: 'Выберите дату',
                        singleDate: true,
                        clearEnabled: true,
                        values: [state.filters.checkDateFrom],
                        onChanged: (date) => _onCheckDateFrom(context, date),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectDatePicker(
                        title: 'Дата обследования по',
                        hintText: 'Выберите дату',
                        singleDate: true,
                        clearEnabled: true,
                        values: [state.filters.checkDateTo],
                        onChanged: (date) => _onCheckDateTo(context, date),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ProjectButton.buildOutlineButton('Сбросить',
                      onPressed: ()=> _onClear(context)
                    ),
                    Padding(padding: const EdgeInsets.only(left: 20)), 
                    ProjectButton.builtFlatButton('Найти',
                      onPressed: ()=> _onFind(context, state.filters)
                    )
                  ],
                ),
              ),
            ],
          );
        }
      )
    );
  }
}
