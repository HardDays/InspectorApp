import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/navigation_bloc/bloc.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/screens.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/widgets/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  final _pagesMap = {
    Screens.AssignmentsScreen: MainPageRoutes.instructionListPage,
    Screens.MapScreen: MainPageRoutes.mapPage,
    Screens.VKScreen: MainPageRoutes.controlSreen,
    Screens.ProfileScreen: MainPageRoutes.profilePage,
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (BuildContext context) =>
          NavigationBloc(InitialNavigationBlocState()),
      child: Scaffold(
        body: BlocListener<NavigationBloc, NavigationBlocState>(
          // им надо чтобы оно возвращало в рут при нажатии на таб внизу
          //listenWhen: (prev, next) => prev.currentScreen != next.currentScreen,
          listener: (context, state) {
            if (state is OpenMapsErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Приложение Yandex.Maps не установлено'),
                ),
              );
            }
            ExtendedNavigator.named('mainPageNavigator').popUntilRoot();
            ExtendedNavigator.named('mainPageNavigator')
                .replace(_pagesMap[state.currentScreen]);
          },
          child: ExtendedNavigator(name: 'mainPageNavigator'),
        ),
        bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationBlocState>(
          buildWhen: (prev, next) => prev.currentScreen != next.currentScreen,
          builder: (context, state) => ProjectBottomNavigationBar(
            screen: state.currentScreen,
            onTap: (screen) => BlocProvider.of<NavigationBloc>(context)
                .add(ChangeScreen(screen: screen)),
          ),
        ),
      ),
    );
  }
}
