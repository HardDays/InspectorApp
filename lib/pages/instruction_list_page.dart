import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/instruction_list/bloc.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/model/instruction_status.dart';
import 'package:inspector/pages/instruction_page.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/filter_appbar.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/top_dialog.dart';
import 'package:inspector/widgets/instruction/filters.dart';
import 'package:inspector/widgets/instruction/instruction.dart';
import 'package:inspector/widgets/sort_dialog.dart';
import 'package:intl/intl.dart';


class InstructionListPage extends StatefulWidget {

  @override
  InstructionListPageState createState() => InstructionListPageState();
}

class InstructionListPageState extends State<InstructionListPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  void _onTap(BuildContext context, Instruction instruction) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) => InstructionPage(instruction)));
    BlocProvider.of<InstructionListBloc>(context).add(LoadSilentEvent());
  }

  Future _onUpdate(BuildContext context) async {
    BlocProvider.of<InstructionListBloc>(context).add(RefreshEvent());  
    _showSnackBar('Данные обновляются...', ProjectColors.darkBlue);
    return Completer().complete();
  }

  Future _onSort(BuildContext context, String value) async {
    final sort = await showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      builder: (context) => SortDialog(
        value ?? InstructionSortStrings.instructionStatus,
        InstructionSortStrings.all,
        InstructionSortStrings.all,
      ),
    );

    if (sort != null) {
      BlocProvider.of<InstructionListBloc>(context).add(SortEvent(sort));  
    }
  }

  Future _onFilter(BuildContext context, InstructionFilters filters) async {
    final result = await showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 100),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.transparent,
      pageBuilder: (context, animation1, animation2) {
        return ProjectTopDialog(
          child: InstructionFiltersWidget(
            filters
          ),
        );
      },
    );

    if (result != null) {
      BlocProvider.of<InstructionListBloc>(context).add(FilterEvent(result));  
    }
  }

  void _flush(BuildContext context) {
    BlocProvider.of<InstructionListBloc>(context).add(FlushEvent()); 
  }

  void _showSnackBar(String title, Color color) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            backgroundColor: ProjectColors.darkBlue,
            duration: Duration(seconds: 2),
            content: Text(title),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context)=> InstructionListBloc(LoadingState())..add(LoadEvent()),
      child: BlocBuilder<InstructionListBloc, InstructionListBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: FilterAppbar('Поручения', 
              state.date != null ? DateFormat('dd.MM.yyyy HH:mm').format(state.date) : 'Не обновлялось',
              state.sort ?? InstructionSortStrings.instructionStatus,
              state.order ?? SortOrder.asc,
              titleIcon: _buildIcons(state),
              onUpdate: ()=> _onUpdate(context),
              onSort: ()=> _onSort(context, state.sort),
              onFilter: ()=> _onFilter(context, state.filters),
            ),
            body: RefreshIndicator(
              onRefresh: ()=> _onUpdate(context),
              child: _buildBody(context, state)  
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, InstructionListBlocState state) {
    if (state is NewDataState) { 
      _showSnackBar('Данные успешно обновлены', ProjectColors.green);
      _flush(context);
    } else if (state is OldDataState) {
      _showSnackBar('Не удалось обновить данные. ${state.exception.message}  ${state.exception.details}', ProjectColors.yellow);
      _flush(context);
    } 
    if (state is LoadingState) {
      return _buildLoader();
    } else if (state is DataState) { 
      return _buildList(context, state.instructions);
    }  else {
      return Container();
    }
  }

  Widget _buildIcons(InstructionListBlocState state) {
    int totalCount = 0;
    int newCount = 0;
    if (state is DataState) {
      totalCount = state.instructions.length;
      newCount = state.instructions.where((e) => e.instructionStatus.id == InstructionStatusIds.assigned).length;
    }
    return Container(
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ProjectColors.blue
      ),  
      margin: const EdgeInsets.only(left: 5, top: 3),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ProjectColors.cyan
            ),
            height: 25,
            width: 25,
            alignment: Alignment.center,
            child: Text('$newCount',
              style: ProjectTextStyles.smallBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 7),
            child: Text('$totalCount',
              style: ProjectTextStyles.smallBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildList(BuildContext context, List<Instruction> instructions) {
    if (instructions.isNotEmpty) {
      return ListView(
        padding: const EdgeInsets.only(top: 20),
        children: List.generate(instructions.length, 
          (index) => InkWell(
            onTap: ()=> _onTap(context, instructions[index]),
            child: InstructionWidget(instructions[index]),
          ),
        ),
      );
    } else {
      return Center(
        child: Text('Поручения не найдены',
          style: ProjectTextStyles.base.apply(color: ProjectColors.black),
        ),
      );
    }
  }
}
