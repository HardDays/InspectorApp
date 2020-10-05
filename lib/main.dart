import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspector/injector.dart';
import 'package:inspector/navigation.gr.dart';
import 'package:inspector/pages/assignment_list_page.dart';
import 'package:inspector/pages/control_list_page.dart';
import 'package:inspector/style/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ProjectColors.grey
      ),
      //home: ControlListPage()
      builder: ExtendedNavigator<InspectorRouter>(
        router: InspectorRouter(),
      ),
    );
  }
}
