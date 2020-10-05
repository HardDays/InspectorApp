// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'pages/instruction_list_page.dart';
import 'pages/auth_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/map_page.dart';
import 'pages/pin_code_page.dart';
import 'pages/profile_page.dart';
import 'pages/splash_screen_page.dart';
import 'pages/test_page.dart';
import 'pages/control_list_page.dart';

class Routes {
  static const String authPage = '/';
  static const String mainPage = '/main-page';
  static const all = <String>{
    authPage,
    mainPage,
  };
}

class InspectorRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(
      Routes.authPage,
      page: AuthPage,
      generator: AuthPageRouter(),
    ),
    RouteDef(
      Routes.mainPage,
      page: MainPage,
      generator: MainPageRouter(),
    ),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AuthPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthPage(),
        settings: data,
      );
    },
    MainPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainPage(),
        settings: data,
      );
    },
  };
}

class AuthPageRoutes {
  static const String splashScreenPage = '/';
  static const String pinCodePage = '/pin-code-page';
  static const String loginPage = '/login-page';
  static const all = <String>{
    splashScreenPage,
    pinCodePage,
    loginPage,
  };
}

class AuthPageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(AuthPageRoutes.splashScreenPage, page: SplashScreenPage),
    RouteDef(AuthPageRoutes.pinCodePage, page: PinCodePage),
    RouteDef(AuthPageRoutes.loginPage, page: LoginPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenPage(),
        settings: data,
      );
    },
    PinCodePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PinCodePage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginPage(),
        settings: data,
      );
    },
  };
}

class MainPageRoutes {
  static const String assignmentsPage = '/';
  static const String mapPage = '/map-page';
  static const String vKSreen = '/v-kSreen';
  static const String profilePage = '/profile-page';
  static const all = <String>{
    assignmentsPage,
    mapPage,
    vKSreen,
    profilePage,
  };
}

class MainPageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(MainPageRoutes.assignmentsPage, page: InstructionListPage),
    RouteDef(MainPageRoutes.mapPage, page: MapPage),
    RouteDef(
      MainPageRoutes.vKSreen,
      page: ControlSreen,
      generator: VKSreenRouter(),
    ),
    RouteDef(MainPageRoutes.profilePage, page: ProfilePage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    InstructionListPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InstructionListPage(),
        settings: data,
      );
    },
    MapPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MapPage(),
        settings: data,
      );
    },
    ControlSreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ControlSreen(),
        settings: data,
      );
    },
    ProfilePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfilePage(),
        settings: data,
      );
    },
  };
}

class VKSreenRoutes {
  static const String testPage = '/test-page';
  static const String vKPage = '/';
  static const all = <String>{
    testPage,
    vKPage,
  };
}

class VKSreenRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(VKSreenRoutes.testPage, page: TestPage),
    RouteDef(VKSreenRoutes.vKPage, page: ControlListPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    TestPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TestPage(),
        settings: data,
      );
    },
    ControlListPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ControlListPage(),
        settings: data,
      );
    },
  };
}
