import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/instruction_filters/bloc.dart';
import 'package:inspector/blocs/instruction_filters/states.dart';
import 'package:inspector/blocs/instruction_filters/events.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_picker.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';

class InstructionFiltersWidget extends StatelessWidget {

  final InstructionFilters filters;

  TextEditingController _instructionNumController;

  InstructionFiltersWidget(this.filters) {
    _instructionNumController = TextEditingController(text: filters.instructionNum);
  }

  void _onFind(BuildContext context, InstructionFilters filters) {
    final newFilters = InstructionFilters(
      instructionNum: _instructionNumController.text,
      minDate: filters.minDate,
      maxDate: filters.maxDate,
      instructionStatus: filters.instructionStatus
    );
    BlocProvider.of<InstructionFiltersBloc>(context).add(SaveEvent(newFilters));  
    Navigator.pop(context, newFilters);
  }

  void _onClear(BuildContext context) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SaveEvent(InstructionFilters(minDate: DateTime(DateTime.now().year), maxDate: DateTime.now())));  
  }

  void _onStatus(BuildContext context, int status) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(SetInstructionStatusEvent(status));  
  }

  void _onMinDate(BuildContext context, DateTime date) {
    if (date != null) {
      BlocProvider.of<InstructionFiltersBloc>(context).add(SetMinDateEvent(date)); 
    } 
  }

  void _onMaxDate(BuildContext context, DateTime date) {
    if (date != null) {
      BlocProvider.of<InstructionFiltersBloc>(context).add(SetMinDateEvent(date));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InstructionFiltersBloc(InstructionFiltersBlocState([], filters))..add(LoadEvent()),
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
                        title: 'С',
                        hintText: 'Выберите дату',
                        singleDate: true,
                        values: [state.filters.minDate],
                        onChanged: (date) => _onMaxDate(context, date[0]),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectDatePicker(
                        title: 'По',
                        hintText: 'Выберите дату',
                        singleDate: true,
                        values: [state.filters.maxDate],
                        onChanged: (date) => _onMinDate(context, date[0]),
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
