import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/instruction_list/bloc.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/model/instruction.dart';
import 'package:inspector/style/filter_appbar.dart';
import 'package:inspector/widgets/instruction/instruction.dart';


class InstructionListPage extends StatefulWidget {

  @override
  InstructionListPageState createState() => InstructionListPageState();
}

class InstructionListPageState extends State<InstructionListPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: FilterAppbar('Поручения'),
      body: BlocProvider(
        create: (context)=> InstructionListBloc(LoadingState())..add(LoadEvent()),
        child: BlocBuilder<InstructionListBloc, InstructionListBlocState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return _buildLoader();
            } else if (state is LoadedState) { 
              return _buildList(state.instructions);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return const Center(
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildList(List<Instruction> instructions) {
     return ListView(
      padding: const EdgeInsets.only(top: 20),
      children: List.generate(instructions.length, (index) => InstructionWidget(instructions[index]))
    );
  }
}
