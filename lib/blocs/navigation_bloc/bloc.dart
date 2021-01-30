import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/screens.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBloc(initialState, this._persistanceService) : super(initialState);

  static const platform =
      const MethodChannel('com.example.inspector/mainChannel');

  final PersistanceService _persistanceService;

  @override
  Stream<NavigationBlocState> mapEventToState(
      NavigationBlocEvent event) async* {
    if (event is ChangeScreen) {
      if (event.screen == Screens.MapScreen)
        yield* (_openMap());
      else if (event.screen == Screens.VKScreen &&
          await _persistanceService.useWebVersionOfVK()) {
        var connectivityResult = await Connectivity().checkConnectivity();
        if (connectivityResult == ConnectivityResult.none) {
          yield (OpenControlPageErrorState(state.currentScreen));
        } else {
          yield (BottomNavigationStateChanged(Screens.VKWebScreen));
        }
      } //_openControl();
      else
        yield (BottomNavigationStateChanged(event.screen));
    }
  }

  Stream<NavigationBlocState> _openMap() async* {
    if (await canLaunch('yandexmaps://')) {
      await launch('yandexmaps://');
    } else {
      yield (OpenMapsErrorState(state.currentScreen));
    }
  }

  Future<void> _openControl() async {
    if (await canLaunch('https://212.46.14.26:9929/oati-insp-mobile/')) {
      await launch('https://212.46.14.26:9929/oati-insp-mobile/');
    }
  }
}
