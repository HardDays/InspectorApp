import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/filter_state.dart';
import 'package:inspector/blocs/control_list/map_state.dart';
import 'package:inspector/blocs/control_list/sort_state.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/services/department_control/department_control_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/network_status_service/network_status.dart';
import 'package:inspector/services/network_status_service/network_status_service.dart';
import 'package:inspector/services/persistance_service.dart';

class ControlListBloc extends Bloc<ControlListBlocEvent, ControlListBlocState> {
  final InstructionsService _instructionsService;
  final PersistanceService _persistanceService;
  final DictionaryService _dictionaryService = DictionaryService();
  final ApiDictionaryService _apiDictionaryService = ApiDictionaryService();
  StreamSubscription<NetworkStatus> _networkStatusStreamSubscription;
  User _user;

  final DepartmentControlService _departmentControlService;

  ControlObjectsFilterState _filterState = ControlObjectsFilterState();
  ControlObjectsMapState _mapState = ControlObjectsMapState();
  ControlObjectsSortState _sortState = ControlObjectsSortState();
  bool showMap = false;
  NetworkStatus _networkStatus;

  ControlListBloc(
    this._instructionsService,
    this._persistanceService,
    this._departmentControlService,
    NetworkStatusService networkStatusService,
  ) : super(LoadingState()) {
    add(ControlListBlocEvent.loadControlListEvent());
    _networkStatusStreamSubscription =
        networkStatusService.listenNetworkStatus.listen((value) {
      _networkStatus = value;
      if (value.connectionStatus == ConnectionStatus.offline ||
          value.dataSendingMode == DataSendingMode.manual) {
        add(ControlListBlocEvent.cantWorkInThisModeEvent());
      } else {
        add(ControlListBlocEvent.loadControlListEvent());
      }
    });
  }

  @override
  Stream<ControlListBlocState> mapEventToState(
      ControlListBlocEvent event) async* {
    yield* (event.map(
      cantWorkInThisModeEvent: (event) async* {
        try {
          final objects = await _apiDictionaryService.getControlObjects(
            0,
            500,
            sort: 'violationCount',
          );
          yield (LoadedState(
            objects: objects,
            filtersState: _filterState,
            mapState: _mapState,
            sortState: _sortState,
            showMap: showMap,
          ));
        } on ApiException catch (e) {
          print(e.message);
          print(e.details);
        }
      },
      loadControlListEvent: (event) async* {
        yield (CantWorkInThisModeState(
          filtersState: _filterState,
          mapState: _mapState,
          sortState: _sortState,
          showMap: showMap,
        ));
      },
    ));
  }

  @override
  Future<void> close() async {
    await super.close();
    _networkStatusStreamSubscription.cancel();
  }
}
