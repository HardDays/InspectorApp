// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/control_list_page.dart';
import 'pages/instruction_list_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/map_page.dart';
import 'pages/pin_code_page.dart';
import 'pages/profile_page.dart';
import 'pages/splash_screen_page.dart';
import 'pages/test_page.dart';

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
  static const String instructionListPage = '/';
  static const String mapPage = '/map-page';
  static const String controlSreen = '/control-sreen';
  static const String profilePage = '/profile-page';
  static const all = <String>{
    instructionListPage,
    mapPage,
    controlSreen,
    profilePage,
  };
}

class MainPageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(MainPageRoutes.instructionListPage, page: InstructionListPage),
    RouteDef(MainPageRoutes.mapPage, page: MapPage),
    RouteDef(
      MainPageRoutes.controlSreen,
      page: ControlSreen,
      generator: ControlSreenRouter(),
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

class ControlSreenRoutes {
  static const String testPage = '/test-page';
  static const String controlListPage = '/';
  static const all = <String>{
    testPage,
    controlListPage,
  };
}

class ControlSreenRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(ControlSreenRoutes.testPage, page: TestPage),
    RouteDef(ControlSreenRoutes.controlListPage, page: ControlListPage),
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
        builder: (context) => ControlListPage(),
        settings: data,
      );
    },
  };
}
