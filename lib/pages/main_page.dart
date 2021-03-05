import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inspector/blocs/navigation_bloc/bloc.dart';
import 'package:inspector/blocs/navigation_bloc/events.dart';
import 'package:inspector/blocs/navigation_bloc/screens.dart';
import 'package:inspector/blocs/navigation_bloc/states.dart';
import 'package:inspector/blocs/notification_bloc/bloc.dart';
import 'package:inspector/blocs/notification_bloc/states.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/pages/dictionary_loading_page.dart';
import 'package:inspector/services/persistance_service.dart';
import 'package:inspector/style/accept_dialog.dart';
import 'package:inspector/style/colors.dart';
import 'package:inspector/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  final _pagesMap = {
    Screens.AssignmentsScreen: MainPageRoutes.instructionListPage,
    Screens.MapScreen: MainPageRoutes.mapPage,
    Screens.VKScreen: MainPageRoutes.controlSreen,
    Screens.VKWebScreen: MainPageRoutes.controlListPageWebView,
    Screens.ProfileScreen: MainPageRoutes.profilePage,
  };

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (BuildContext context) => NavigationBloc(
        InitialNavigationBlocState(),
        Provider.of<PersistanceService>(context, listen: false),
      ),
      child: Scaffold(
        body: BlocListener<NotificationBloc, NotificationBlocState>(
          listener: (context, state) {
            state.maybeMap(
              okDialogNotificationState: (state) async => await showDialog(
                context: context,
                builder: (ctx) => AcceptDialog(
                  acceptTitle: 'Ок',
                  cancelTitle: null,
                  message: 'Данные успешно переданы в ЕИС ОАТИ',
                ),
              ),
              snackBarNotificationState: (state) =>
                  Scaffold.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ProjectColors.darkBlue,
                  content: Text(state.message),
                ),
              ),
              orElse: () {},
            );
          },
          child: BlocListener<NavigationBloc, NavigationBlocState>(
            // им надо чтобы оно возвращало в рут при нажатии на таб внизу
            //listenWhen: (prev, next) => prev.currentScreen != next.currentScreen,
            listener: (context, state) {
              if (state is OpenMapsErrorState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Приложение Yandex.Maps не установлено'),
                  ),
                );
              } else if (state is OpenControlPageErrorState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Работа с разделом "Ведомственный контроль" возможна только при наличии сети Internet'),
                  ),
                );
              } else {
                ExtendedNavigator.named('mainPageNavigator').popUntilRoot();
                ExtendedNavigator.named('mainPageNavigator')
                    .replace(_pagesMap[state.currentScreen]);
              }
            },
            child: DictionaryLoadingPage(
                child: ExtendedNavigator(name: 'mainPageNavigator')),
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
