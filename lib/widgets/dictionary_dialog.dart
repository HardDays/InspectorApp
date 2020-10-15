import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/dictionary/bloc.dart';
import 'package:inspector/blocs/dictionary/state.dart';
import 'package:inspector/blocs/dictionary/event.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/dialog.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/colors.dart';

class DictionaryDialog extends StatelessWidget {
  
  const DictionaryDialog();

  void _close(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Navigator.pop(context);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProjectDialog(
      child: BlocProvider(
        create: (context)=> DictionaryBloc(DictionaryBlocState())..add(LoadEvent()),
        child: BlocBuilder<DictionaryBloc, DictionaryBlocState>(
          builder: (context, state) {
            if (state is LoadedState) {
              _close(context);
            }
            return Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Пожалуйста, подождите,\nпроисходит загрузка словарей',
                    textAlign: TextAlign.center,
                    style: ProjectTextStyles.title.apply(color: ProjectColors.black),
                  ),
                  state is LoadingState ? Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text('Словарь "${state.name}", загружено: ${state.count}',
                      style: ProjectTextStyles.subTitle.apply(color: ProjectColors.black),
                    ),
                  ) : Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: CircularProgressIndicator()
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ProjectButton.buildOutlineButton('Отмена',
                      onPressed: ()=> _close(context)
                    )
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
