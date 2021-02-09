import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/event.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/dc_object_type.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/sqlite/sqlite_dictionary_service.dart';


class ControlFiltersBloc extends Bloc<ControlFiltersBlocEvent, ControlFiltersBlocState> {

  final _dictionarySevice = DictionaryService();

  ControlFiltersBloc()  : super(ControlFiltersBlocState()) {
  }

  Stream<ControlFiltersBlocState> changeDCObjectType(ChangeDCObjectTypeEvent event) async* {
    yield state.copyWith(
      dcObjectType: event.type
    );
    // await _dictionarySevice.load(
    //   keys: [DictionaryNames.dcObjectElements, DictionaryNames.dcObjectKinds, DictionaryNames.dcObjectTypes, DictionaryNames.dcViolationNames, DictionaryNames.dcViolationStatuses,]
    // );
  }

  Future<List<DCObjectType>> dcObjectTypes(String name) async {
    return await _dictionarySevice.getDCObjectTypes(name: name);
  }

  @override
  Stream<ControlFiltersBlocState> mapEventToState(ControlFiltersBlocEvent event) async* {
    yield * (
      event.map(
        changeDCObjectType: changeDCObjectType
      )
    );
  }
}
