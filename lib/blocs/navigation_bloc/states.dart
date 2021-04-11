import 'package:inspector/blocs/navigation_bloc/screens.dart';

abstract class NavigationBlocState {
  Screens get currentScreen;
}

class InitialNavigationBlocState extends NavigationBlocState{
  @override
  Screens get currentScreen => Screens.AssignmentsScreen;
}

class BottomNavigationStateChanged extends NavigationBlocState {
  final Screens currentScreen;

  BottomNavigationStateChanged(this.currentScreen);

}

class OpenMapsErrorState extends NavigationBlocState {
  final Screens currentScreen;

  OpenMapsErrorState(this.currentScreen);
}

class OpenControlPageErrorState extends NavigationBlocState {
  final Screens currentScreen;

  OpenControlPageErrorState(this.currentScreen);
}