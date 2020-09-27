import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inspector/navigation.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator<InspectorRouter>(
        router: InspectorRouter(),
      ),
    );
  }
}
