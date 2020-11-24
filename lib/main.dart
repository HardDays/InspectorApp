import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspector/injector.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/style/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ProjectColors.grey),
      //home: ControlListPage()
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ru')
      ],
      home: InjectorWidget(
        child: ExtendedNavigator<InspectorRouter>(
          router: InspectorRouter(),
        ),
      ),
      locale: const Locale('ru'),
      supportedLocales: [
        const Locale('ru'),
      ],
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
    );
  }
}
