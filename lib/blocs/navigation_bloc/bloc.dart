import 'package:bloc/bloc.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {

  NavigationBloc(initialState) : super(initialState);

  @override
  Stream<NavigationBlocState> mapEventToState(NavigationBlocEvent event) async* {
    if(event is ChangeScreen)
      yield(BottomNavigationStateChanged(event.screen));
  }

}