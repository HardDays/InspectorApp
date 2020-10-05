import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/instruction_list/events.dart';
import 'package:inspector/blocs/instruction_list/states.dart';
import 'package:inspector/services/instruction_service.dart';


class InstructionListBloc extends Bloc<InstructionListBlocEvent, InstructionListBlocState> {
  InstructionListBloc(initialState) : super(initialState);

  final service = InstructionService();

  @override
  Stream<InstructionListBlocState> mapEventToState(InstructionListBlocEvent event) async* {
    if (event is LoadEvent) {
      service.getAll();
    }
  }


}
