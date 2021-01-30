import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/dictionary/bloc.dart';
import 'package:inspector/blocs/dictionary/event.dart';
import 'package:inspector/blocs/dictionary/state.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/text_style.dart';

class DictionaryLoadingPage extends StatelessWidget {
  final Widget child;

  const DictionaryLoadingPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DictionaryBloc>(
      create: (context) =>
          DictionaryBloc(DictionaryBlocState())..add(LoadEvent()),
      child: BlocBuilder<DictionaryBloc, DictionaryBlocState>(
        builder: (context, state) => Column(
          children: [
            Expanded(
              child: child,
            ),
            if (state is LoadingState)
              Container(
                padding: const EdgeInsets.all(16),
                color: ProjectColors.darkBlue,
                child: Row(
                  children: [
                    Text(
                        'Словарь "${state.name}", загружено: ${state.count}',
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
                            BlocProvider.of<DictionaryBloc>(context)
                                .add(CancelEvent()),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
