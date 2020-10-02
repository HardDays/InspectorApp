import 'package:auto_route/auto_route_annotations.dart';
import 'package:inspector/pages/assignment_list_page.dart';
import 'package:inspector/pages/auth_page.dart';
import 'package:inspector/pages/main_page.dart';
import 'package:inspector/pages/map_page.dart';
import 'package:inspector/pages/profile_page.dart';
import 'package:inspector/pages/test_page.dart';
import 'package:inspector/pages/control_list_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: AuthPage,
      initial: true,
    ),
    MaterialRoute(
      page: MainPage,
      children: <AutoRoute>[
        MaterialRoute(
          initial: true,
          page: AssignmentListPage,
        ),
        MaterialRoute(
          page: MapPage,
        ),
        MaterialRoute(
          page: ControlSreen,
          children: <AutoRoute>[
            MaterialRoute(
              page: TestPage,
            ),
            MaterialRoute(
              initial: true,
              page: ControlListPage,
            ),
          ],
        ),
        MaterialRoute(
          page: ProfilePage,
        ),
      ],
    ),
  ],
)
class $InspectorRouter {}
