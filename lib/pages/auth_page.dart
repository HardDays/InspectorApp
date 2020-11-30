import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/auth/bloc.dart';
import 'package:inspector/blocs/auth/states.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        InitialAuthBlocState(),
        Provider.of<AuthService>(context, listen: false),
        Provider.of<PersistanceService>(context, listen: false),
      ),
      child: BlocListener<AuthBloc, AuthBlocStates>(
        child: ExtendedNavigator(name: 'authNavigator'),
        listener: (context, state) {
          if (state is PinCodeState && state.needRebuild)
            ExtendedNavigator.named('authNavigator')
                .replace(AuthPageRoutes.pinCodePage);
          else if (state is ShowLoginScreen)
            ExtendedNavigator.named('authNavigator')
                .replace(AuthPageRoutes.loginPage);
          else if (state is AutorizedState) {
            ExtendedNavigator.root.replace(Routes.mainPage);
          }
        },
      ),
    );
  }
}
