import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspector/blocs/auth/bloc.dart';
import 'package:inspector/blocs/auth/events.dart';
import 'package:inspector/blocs/auth/states.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/widgets/auth/info.dart';
import 'package:inspector/widgets/pincode/pincode_numpad.dart';
import 'package:provider/provider.dart';

class PinCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AuthBloc, AuthBlocStates>(
          builder: (context, state) {
            Widget header = Container();
            Widget footer = Container();
            if (state is ShowPinCodeField) {
              header = _buildEnterPinTitle();
              footer = _buildSubtitle(context);
            } else if (state is ShowRepeatPinScreen) {
              header = _buildRepeatPinTitle();
            } else if (state is ShowSetPinScreen) {
              header = _builtSetPinTitle();
            } else if (state is IncorrencPinState) {
              header = _buildIncorrectPinTitle();
              footer = _buildSubtitle(context);
            } else if (state is IncorrencRepeatPinState) {
              header = _buildIncorrectPinTitle();
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLogo(),
                Spacer(/*flex: 174*/),
                Padding(
                  padding: EdgeInsets.only(bottom: 29.0),
                  child: header,
                ),
                PinCodeNumpad(listener: (s) {
                  BlocProvider.of<AuthBloc>(context).add(SetPinEvent(s));
                }),
                footer,
                Spacer(/*flex: 440*/),
                Info(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: EdgeInsets.only(top: 74.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logo.png',
            width: 66.0,
            height: 66.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            'ЕИС ОАТИ города Москвы',
            style: ProjectTextStyles.subTitle,
          ),
        ],
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 17.0),
      child: GestureDetector(
        onTap: () {
          Provider.of<AuthService>(context, listen: false).changePin();
          BlocProvider.of<AuthBloc>(context).add(EnterAuthScreenEvent());
        },
        child: Text(
          'Забыли PIN / Сменить пользователя?',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            height: 18.0 / 14.0,
            color: ProjectColors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildEnterPinTitle() {
    return Text('Введите PIN',
        style: ProjectTextStyles.title.apply(color: ProjectColors.blue));
  }

  Widget _buildRepeatPinTitle() {
    return Text('Повторите PIN',
        style: ProjectTextStyles.title.apply(color: ProjectColors.blue));
  }

  Widget _buildIncorrectPinTitle() {
    return Text('PIN-код введен неверно. Попробуйте еще раз',
        style: ProjectTextStyles.title.apply(color: ProjectColors.red));
  }

  Widget _builtSetPinTitle() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.security,
          color: ProjectColors.blue,
          size: 44,
        ),
        Padding(
          padding: EdgeInsets.only(top: 11.0, bottom: 16.0),
          child: Text(
            'Безопасность',
            style: ProjectTextStyles.title.apply(
              color: ProjectColors.blue,
            ),
          ),
        ),
        Text(
          'Увеличьте безопасность учетной записи, используя PIN-код\nдля доступа в Приложение',
          style: ProjectTextStyles.subTitle.apply(
            color: ProjectColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
