import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_filters/event.dart';
import 'package:inspector/blocs/control_filters/state.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/area.dart';
import 'package:inspector/model/department_control/object_element.dart';
import 'package:inspector/model/department_control/object_kind.dart';
import 'package:inspector/model/department_control/object_type.dart';
import 'package:inspector/model/department_control/source.dart';
import 'package:inspector/model/department_control/violation_name.dart';
import 'package:inspector/model/department_control/violation_status.dart';
import 'package:inspector/model/district.dart';
import 'package:inspector/services/dictionary_service.dart';

class ControlFiltersBloc extends Bloc<ControlFiltersBlocEvent, ControlFiltersBlocState> {

  final _dictionarySevice = DictionaryService();

  ControlFiltersBloc(ControlFiltersBlocState state)  : super(state);

  Future<List<ObjectType>> getDCObjectTypes(String name) async {
    return await _dictionarySevice.getDCObjectTypes(name: name);
  }

  Future<List<ObjectKind>> getDCObjectKinds(String name) async {
    return await _dictionarySevice.getDCObjectKinds(name: name);
  }

  Future<List<Area>> getAreas(String name) async {
    return await _dictionarySevice.getAreas(name: name);
  }

  Future<List<District>> getDistricts(String name) async {
    return await _dictionarySevice.getDitricts(name: name, areaId: state.area?.id);
  }

  Future<List<Address>> getAddresses(String name) async {
    return await _dictionarySevice.getAddresses(houseNum: name, districtId: state.district?.id, areaId: state.area?.id);
  }

  Future<List<ViolationName>> getDCViolationNames(String name) async {
    return await _dictionarySevice.getDCViolationNames(name: name);
  }

  Future<List<ObjectElement>> getDCObjectElements(String name) async {
    return await _dictionarySevice.getDCObjectElements(name: name);
  }

  Future<List<ViolationStatus>> getDCViolationStatuses(String name) async {
    return await _dictionarySevice.getDCViolationStatuses(name: name);
  }

  Future<List<Source>> getDCSources(String name) async {
    return await _dictionarySevice.getDCSources(name: name);
  }

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
