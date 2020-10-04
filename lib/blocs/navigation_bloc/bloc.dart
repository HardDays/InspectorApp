import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/screens.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBloc(initialState) : super(initialState);

  static const platform = const MethodChannel('com.example.inspector/map');

  @override
  Stream<NavigationBlocState> mapEventToState(
      NavigationBlocEvent event) async* {
    if (event is ChangeScreen) {
      if (event.screen == Screens.MapScreen)
        _openMap();
      else
        yield (BottomNavigationStateChanged(event.screen));
    }
  }

  Future<void> _openMap() async {
    await platform.invokeMethod('openYandexMap');
  }
}
