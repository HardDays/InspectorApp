import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/model/address.dart';
import 'package:inspector/model/oati_department.dart';
import 'package:inspector/model/object_category.dart';
import 'package:inspector/model/special_object.dart';
import 'package:inspector/model/violation.dart';

class ControlListBloc extends Bloc<ControlListBlocEvent, ControlListBlocState> {
  ControlListBloc() : super(LoadingState()) {
    add(LoadControlListEvent());
  }

  @override
  Stream<ControlListBlocState> mapEventToState(ControlListBlocEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}

class ControlListObject {
  final SpecialObject type;
  final ObjectCategory category;
  final OatiDepartment department;
  final Address address;
  final int cameras;
  final List<Violation> violations;
  final DateTime checkDate;

  ControlListObject({
    @required this.type,
    @required this.category,
    @required this.department,
    @required this.address,
    @required this.cameras,
    @required this.violations,
    @required this.checkDate,
  });
}
