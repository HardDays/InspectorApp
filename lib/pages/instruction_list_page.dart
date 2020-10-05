import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/instruction_list/bloc.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/style/filter_appbar.dart';
import 'package:inspector/widgets/assignment/assignment.dart';

class InstructionListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FilterAppbar('Поручения'),
      body: BlocProvider(
        create: (context)=> InstructionListBloc(LoadingState())..add(LoadEvent()),
        child: BlocBuilder<InstructionListBloc, InstructionListBlocState>(
          builder: (context, state) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      // body: ListView(
      //   padding: const EdgeInsets.only(top: 20),
      //   children: [
      //     AssignmentWidget(
      //       'Назначено',
      //       [
      //         {
      //           'task': 'task task taks',
      //           'addresses': ['address addr', 'addrress']
      //         },
      //         {
      //           'task': 'task task taks',
      //           'addresses': ['address addr']
      //         }
      //       ]
      //     ),
      //     AssignmentWidget(
      //       'На исполнении',
      //       [
      //         {
      //           'task': 'task task taks',
      //           'addresses': ['address addr']
      //         }
      //       ]
      //     ),
      //   ],
      //),
    );
  }

}
