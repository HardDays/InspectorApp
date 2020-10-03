import 'package:auto_route/auto_route_annotations.dart';
import 'package:inspector/pages/assignments_page.dart';
import 'package:inspector/pages/auth_page.dart';
import 'package:inspector/pages/login_page.dart';
import 'package:inspector/pages/main_page.dart';
import 'package:inspector/pages/map_page.dart';
import 'package:inspector/pages/pin_code_page.dart';
import 'package:inspector/pages/profile_page.dart';
import 'package:inspector/pages/splash_screen_page.dart';
import 'package:inspector/pages/test_page.dart';
import 'package:inspector/pages/vk_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(
      page: AuthPage,
      initial: true,
      children: <AutoRoute>[
        MaterialRoute(
          initial: true,
          page: SplashScreenPage,
        ),
        MaterialRoute(
          page: PinCodePage,
        ),
        MaterialRoute(
          page: LoginPage,
        ),
      ],
    ),
    MaterialRoute(
      page: MainPage,
      children: <AutoRoute>[
        MaterialRoute(
          initial: true,
          page: AssignmentsPage,
        ),
        MaterialRoute(
          page: MapPage,
        ),
        MaterialRoute(
          page: VKSreen,
          children: <AutoRoute>[
            MaterialRoute(
              page: TestPage,
            ),
            MaterialRoute(
              initial: true,
              page: VKPage,
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
