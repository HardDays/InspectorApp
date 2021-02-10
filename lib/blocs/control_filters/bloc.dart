import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/event.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/dc_object_kind.dart';
import 'package:inspector/model/dc_object_type.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/sqlite/sqlite_dictionary_service.dart';


class ControlFiltersBloc extends Bloc<ControlFiltersBlocEvent, ControlFiltersBlocState> {

  final _dictionarySevice = DictionaryService();

  ControlFiltersBloc()  : super(ControlFiltersBlocState()) {
  }

  Future<List<DCObjectType>> getDCObjectTypes(String name) async {
    return await _dictionarySevice.getDCObjectTypes(name: name);
  }

  Future<List<DCObjectKind>> getDCObjectKinds(String name) async {
    return await _dictionarySevice.getDCObjectKinds(name: name);
  }

  Future<List<Area>> getAreas(String name) async {
    return await _dictionarySevice.getAreas(name: name);
  }

  Future<List<District>> getDistricts(String name) async {
    return await _dictionarySevice.getDitricts(name: name, areaId: state.area?.id);
  }

  // Future<List<District>> getAddresses(String name) async {
  //   return await _dictionarySevice.getAddresses(name: name, areaId: state.area?.id);
  // }


  @override
  Stream<ControlFiltersBlocState> mapEventToState(ControlFiltersBlocEvent event) async* {
    yield * (
      event.map(
        copyState: (event) async* {
          yield event.state.copyWith();
        }
      )
    );
  }
}
