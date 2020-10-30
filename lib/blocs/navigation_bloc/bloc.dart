import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/screens.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBloc(initialState) : super(initialState);

  static const platform =
      const MethodChannel('com.example.inspector/mainChannel');

  @override
  Stream<NavigationBlocState> mapEventToState(
      NavigationBlocEvent event) async* {
    if (event is ChangeScreen) {
      if (event.screen == Screens.MapScreen)
        _openMap();
      else if (event.screen == Screens.VKScreen) 
        _openControl();
      else
        yield (BottomNavigationStateChanged(event.screen));
    }
  }

  Future<void> _openMap() async {
    if (await canLaunch('yandexmaps://')) {
      await launch('yandexmaps://');
    } else if (Platform.isAndroid) {
      await platform.invokeMethod('openYandexMap');
    }
  }

  Future<void> _openControl() async {
    if (await canLaunch('https://212.46.14.26:9929/oati-insp-mobile/')) {
      await launch('https://212.46.14.26:9929/oati-insp-mobile/');
    }
  }
}
