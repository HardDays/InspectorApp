import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/navigation_bloc/bloc.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (BuildContext context) =>
          NavigationBloc(InitialNavigationBlocState()),
      child: Scaffold(
        body: Center(
          child: Text(
            'Здесь скоро появится главная страница',
            style: ProjectTextStyles.title,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
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
