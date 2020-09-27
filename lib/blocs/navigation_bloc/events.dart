import 'package:inspector/blocs/navigation_bloc/screens.dart';

abstract class NavigationBlocEvent {}

class ChangeScreen extends NavigationBlocEvent {
  final Screens screen;

  ChangeScreen({this.screen});
}