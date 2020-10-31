import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/control_list/event.dart';
import 'package:inspector/blocs/control_list/state.dart';
import 'package:inspector/model/user.dart';
import 'package:inspector/providers/exceptions/api_exception.dart';
import 'package:inspector/services/api/dictionary_service.dart';
import 'package:inspector/services/dictionary_service.dart';
import 'package:inspector/services/instructions_service.dart';
import 'package:inspector/services/persistance_service.dart';

class ControlListBloc extends Bloc<ControlListBlocEvent, ControlListBlocState> {
  final InstructionsService _instructionsService;
  final PersistanceService _persistanceService;
  final DictionaryService _dictionaryService = DictionaryService();
  final ApiDictionaryService _apiDictionaryService = ApiDictionaryService();
  User _user;
  

  ControlListBloc(
    this._instructionsService,
    this._persistanceService,
  ) : super(LoadingState()) {
    add(LoadControlListEvent());
  }

  @override
  Stream<ControlListBlocState> mapEventToState(
      ControlListBlocEvent event) async* {
    if (event is LoadControlListEvent) {
      try {
        final objects = await _apiDictionaryService.getControlObjects(0, 500);
        print('');
      } on ApiException catch (e) {
        print(e.message);
        print(e.details);
      }
    }
  }


}
