// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/control_list_page.dart';
import 'pages/control_list_page_webview.dart';
import 'pages/instruction_list_page.dart';
import 'pages/login_page.dart';
import 'pages/main_page.dart';
import 'pages/map_page.dart';
import 'pages/pin_code_page.dart';
import 'pages/profile_page.dart';
import 'pages/splash_screen_page.dart';
import 'pages/test_page.dart';

class Routes {
  static const String testPage = '/test-page';
  static const String authPage = '/';
  static const String mainPage = '/main-page';
  static const all = <String>{
    testPage,
    authPage,
    mainPage,
  };
}

class InspectorRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.testPage, page: TestPage),
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
    TestPage: (data) {
      final args = data.getArgs<TestPageArguments>(
        orElse: () => TestPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => TestPage(key: args.key),
        settings: data,
      );
    },
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
  static const String controlListPageWebView = '/control-list-page-web-view';
  static const all = <String>{
    instructionListPage,
    mapPage,
    controlSreen,
    profilePage,
    controlListPageWebView,
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
    RouteDef(MainPageRoutes.controlListPageWebView,
        page: ControlListPageWebView),
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
    ControlListPageWebView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ControlListPageWebView(),
        settings: data,
      );
    },
  };
}

class ControlSreenRoutes {
  static const String controlListPage = '/';
  static const all = <String>{
    controlListPage,
  };
}

class ControlSreenRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(ControlSreenRoutes.controlListPage, page: ControlListPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    ControlListPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ControlListPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// TestPage arguments holder class
class TestPageArguments {
  final Key key;
  TestPageArguments({this.key});
}
