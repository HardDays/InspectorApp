import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/profile/bloc.dart';
import 'package:inspector/blocs/profile/event.dart';
import 'package:inspector/blocs/profile/state.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/services/auth_service.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:inspector/style/button.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/style/icons.dart';
import 'package:inspector/style/text_style.dart';
import 'package:inspector/style/switch.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) => ProfileBloc(
        EmptyBlocState(),
        Provider.of<PersistanceService>(context, listen: false),
      )..add(InitEvent()),
      child:
          BlocBuilder<ProfileBloc, ProfileBlocState>(builder: (context, state) {
        if (state is FilledBlocState)
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              // actions: [
              //   IconButton(
              //     icon: Icon(Icons.code),
              //     onPressed: () => ExtendedNavigator.root.push(Routes.testPage),
              //   )
              // ],
              backgroundColor: ProjectColors.darkBlue,
              title: Text(
                'Профиль',
                style: ProjectTextStyles.title.apply(
                  color: ProjectColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(29.0, 17.0, 0, 0),
                        child: Text(
                          state.userName,
                          style: ProjectTextStyles.title,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 20.0, 28.0, 0.0),
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AuthService>(context, listen: false)
                                .logout();
                            ExtendedNavigator.root.replace(Routes.authPage);
                          },
                          child: Row(
                            children: [
                              ProjectIcons.exitIcon(),
                              SizedBox(width: 8.46),
                              Text(
                                'Выйти',
                                style: ProjectTextStyles.base
                                    .apply(color: ProjectColors.darkBlue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  _buildSection(
                    'О приложении',
                    [
                      _buildSectionItem(
                        'Версия',
                        Text(
                          state.appVersion,
                          style: ProjectTextStyles.base
                              .apply(color: ProjectColors.black),
                        ),
                      ),
                      _buildSectionItem(
                        'Дата установки',
                        Text(
                          state.installDate != null
                              ? DateFormat('dd.MM.yyyy')
                                  .format(state.installDate)
                              : 'Не определено',
                          style: ProjectTextStyles.base
                              .apply(color: ProjectColors.black),
                        ),
                      ),
                    ],
                  ),
                  _buildSection(
                    'Передача данных',
                    [
                      _buildSectionItem(
                        'Дата и время последней передачи данных',
                        Text(
                          state.lastDataSendingDate == null
                              ? ''
                              : DateFormat('dd.MM.yyyy HH:mm')
                                  .format(state.lastDataSendingDate),
                          style: ProjectTextStyles.base
                              .apply(color: ProjectColors.black),
                        ),
                      ),
                      _buildSectionItem(
                        'Статус передачи данных',
                        Text(
                          state.dataSendingState,
                          style: ProjectTextStyles.base
                              .apply(color: ProjectColors.black),
                        ),
                      ),
                      _buildSectionItem(
                        'Документы, требующие изменений',
                        Container(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        if (!state.sending)
                          ProjectButton.builtFlatButton(
                            'Отправить данные',
                            disabled: state.dataSendingMode && !state.canBeSended,
                            onPressed: () =>
                                BlocProvider.of<ProfileBloc>(context)
                                    .add(SendDataEvent()),
                          )
                        else
                          CircularProgressIndicator()
                      ],
                    ),
                  ),
                  _buildSection(
                    'Настройки',
                    [
                      _buildSectionItem(
                        'Режим передачи данных',
                        Row(
                          children: [
                            Text(
                              'Ручной',
                              style: ProjectTextStyles.medium
                                  .apply(color: ProjectColors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.1, 0.0, 10.0, 0.0),
                              child: ProjectSwitch(
                                  checked: state.dataSendingMode,
                                  onChanged: (value) =>
                                      BlocProvider.of<ProfileBloc>(context)
                                          .add(SetDataSendingMode(value))),
                            ),
                            Text(
                              'Автоматический',
                              style: ProjectTextStyles.medium
                                  .apply(color: ProjectColors.black),
                            ),
                          ],
                        ),
                      ),
                      _buildSectionItem(
                        'Быстрый доступ по Touch ID',
                        Row(
                          children: [
                            Text(
                              'Включен',
                              style: ProjectTextStyles.medium
                                  .apply(color: ProjectColors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  8.1, 0.0, 10.0, 0.0),
                              child: ProjectSwitch(
                                checked: state.useFingerprint,
                                onChanged: (value) =>
                                    BlocProvider.of<ProfileBloc>(context)
                                        .add(SetUsingFingerPrint(value)),
                              ),
                            ),
                            Text(
                              'Выключен',
                              style: ProjectTextStyles.medium
                                  .apply(color: ProjectColors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildSection(
                    'Техподдержка',
                    [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<ProfileBloc>(context)
                              .add(SendEmailEvent());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              ProjectIcons.mailIcon(),
                              SizedBox(
                                width: 6.5,
                              ),
                              Text(
                                'Отправить сообщение в техподдержку',
                                style: ProjectTextStyles.baseBold
                                    .apply(color: ProjectColors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }

  Widget _buildSectionItem(String name, Widget child) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              name,
              style:
                  ProjectTextStyles.baseBold.apply(color: ProjectColors.blue),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: child,
        ),
      ],
    );
  }

  Widget _buildSection(String sectionName, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 30.0, 0, 11),
            child: Container(
              width: double.infinity,
              child: Text(
                sectionName,
                style: ProjectTextStyles.subTitle
                    .apply(color: ProjectColors.black),
              ),
            ),
          ),
          ...children,
        ]
            .map(
              (e) => Container(
                child: e,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ProjectColors.lightBlue),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
