import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/auth/bloc.dart';
import 'package:inspector/blocs/auth/events.dart';
import 'package:inspector/blocs/auth/states.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/auth/info.dart';
import 'package:inspector/widgets/login/password_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthBlocStates>(builder: (context, state) {
      Widget error = Container();
      Widget button = ProjectButton.builtFlatButton('Войти', onPressed: () {
        BlocProvider.of<AuthBloc>(context).add(LoginEvent());
      });
      if (state is ShowLoginErrorScreen) {
        error = Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Text(state.errorMessage,
              style: ProjectTextStyles.title.apply(color: ProjectColors.red)),
        );
      }
      if (state is ShowLoginLoadingScreen) {
        button = CircularProgressIndicator();
      }
      return Scaffold(
        backgroundColor: ProjectColors.white,
        body: Center(
          child: Container(
            width: 400.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  'images/logo.png',
                  width: 180.0,
                  height: 180.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35.0, bottom: 34.0),
                  child: Text(
                    'ЕИС ОАТИ города Москвы',
                    style: ProjectTextStyles.title
                        .apply(color: ProjectColors.black),
                  ),
                ),
                error,
                TextField(
                  style: TextStyle(
                    color: ProjectColors.darkBlue,
                  ).merge(ProjectTextStyles.base),
                  decoration: InputDecoration(
                    hintText: 'Имя пользователя',
                    hintStyle: TextStyle(
                      color: ProjectColors.mediumBlue,
                    ).merge(ProjectTextStyles.base),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: ProjectColors.mediumBlue),
                    ),
                  ),
                  onChanged: (login) => BlocProvider.of<AuthBloc>(context).add(SetLoginEvent(login)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: PasswordTextField(onChanged: (password) => BlocProvider.of<AuthBloc>(context).add(SetPasswordEvent(password))),
                ),
                button,
                Spacer(),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 20),
                //   child: TextField(
                //   style: TextStyle(
                //     color: ProjectColors.darkBlue,
                //     ).merge(ProjectTextStyles.base),
                //     decoration: InputDecoration(
                //       hintText: 'Адрес сервера',
                //       hintStyle: TextStyle(
                //         color: ProjectColors.mediumBlue,
                //       ).merge(ProjectTextStyles.base),
                //       border: UnderlineInputBorder(
                //         borderSide: BorderSide(color: ProjectColors.mediumBlue),
                //       ),
                //     ),
                //     onChanged: (login) => BlocProvider.of<AuthBloc>(context).add(SetUrlEvent(login)),
                //   ),
                // ),
                Info(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
