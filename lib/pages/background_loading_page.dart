import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/background_loading/bloc.dart';
import 'package:inspector/blocs/background_loading/event.dart';
import 'package:inspector/blocs/background_loading/state.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class BackgroundLoadingPage extends StatelessWidget {
  final Widget child;

  const BackgroundLoadingPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        BlocBuilder<BackgroundLoadingBloc, BackgroundLoadingBlocState>(
          builder: (context, state) => state.map(
            emptyQueueState: (state) => Container(),
            haveStatusState: (state) => Container(
              padding: const EdgeInsets.all(16),
              color: ProjectColors.darkBlue,
              child: Row(
                children: [
                  Text(
                    state.status,
                    style: ProjectTextStyles.subTitle.apply(
                      color: ProjectColors.white,
                    ),
                  ),
                  Spacer(),
                  ProjectButton.builtFlatButton(
                    'Отмена',
                    color: ProjectColors.white,
                    textColor: ProjectColors.darkBlue,
                    onPressed: () =>
                        BlocProvider.of<BackgroundLoadingBloc>(context)
                            .add(BackgroundLoadingBlocEvent.cancelEvent()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
