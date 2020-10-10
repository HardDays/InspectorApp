import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/instruction_filters/bloc.dart';
import 'package:inspector/blocs/instruction_filters/states.dart';
import 'package:inspector/blocs/instruction_filters/events.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/date_range.dart';
import 'package:inspector/style/select.dart';
import 'package:inspector/style/text_field.dart';

class InstructionFiltersWidget extends StatelessWidget {

  final InstructionFilters filters;

  TextEditingController _instructionNumController;

  InstructionFiltersWidget(this.filters) {
    _instructionNumController = TextEditingController(text: filters.instructionNum);
  }

  void _onFind(BuildContext context, InstructionFilters filters) {
    Navigator.pop(context, 
      InstructionFilters(
        instructionNum: _instructionNumController.text,
        checkDates: filters.checkDates,
        instructionDates: filters.instructionDates,
        instructionStatus: filters.instructionStatus
      ),
    );
  }

  void _onClear(BuildContext context) {
    Navigator.pop(context, InstructionFilters());
  }

  void _onStatus(BuildContext context, String status) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(ChangeInstructionStatusEvent(status));  
  }

  void _onCheckDates(BuildContext context, List<DateTime> dates) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(ChangeCheckDatesEvent(dates));  
  }

  void _onInstructionDates(BuildContext context, List<DateTime> dates) {
    BlocProvider.of<InstructionFiltersBloc>(context).add(ChangeInstructionDatesEvent(dates));  
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> InstructionFiltersBloc(InstructionFiltersBlocState(filters))..add(LoadEvent()),
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
                      state.filters.instructionStatus,
                      InstructionStatusStrings.all,
                      InstructionStatusStrings.all,
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
                      child: ProjectDateRange(
                        title: 'Дата поручения',
                        hintText: 'Выберите дату или период',
                        values: state.filters.instructionDates,
                        onChanged: (dates)=> _onInstructionDates(context, dates),
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(left: 35)),
                    Flexible(
                      child: ProjectDateRange(
                        title: 'Дата обследования',
                        hintText: 'Выберите дату или период',
                        values: state.filters.checkDates,
                        onChanged: (dates)=> _onCheckDates(context, dates),
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
