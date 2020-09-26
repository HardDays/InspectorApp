// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'pages/auth_page.dart';
import 'pages/main_page.dart';
import 'pages/test_page.dart';

class Routes {
  static const String authPage = '/';
  static const String testPage = '/test-page';
  static const String mainPage = '/main-page';
  static const all = <String>{
    authPage,
    testPage,
    mainPage,
  };
}

class InspectorRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authPage, page: AuthPage),
    RouteDef(Routes.testPage, page: TestPage),
    RouteDef(Routes.mainPage, page: MainPage),
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
    TestPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const TestPage(),
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
