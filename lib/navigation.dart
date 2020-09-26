import 'package:auto_route/auto_route_annotations.dart';
import 'package:inspector/pages/auth_page.dart';
import 'package:inspector/pages/main_page.dart';
import 'package:inspector/pages/test_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: AuthPage,
      initial: true,
    ),
    MaterialRoute(
      page: TestPage,
    ),
    MaterialRoute(
      page: MainPage,
    ),
  ],
)
class $InspectorRouter {}