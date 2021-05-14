// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../main.dart';

class Routes {
  static const String myApp = '/';
  static const String myHomePage = '/my-home-page';
  static const String authenticateWrapper = '/authenticate-wrapper';
  static const all = <String>{
    myApp,
    myHomePage,
    authenticateWrapper,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.myApp, page: MyApp),
    RouteDef(Routes.myHomePage, page: MyHomePage),
    RouteDef(Routes.authenticateWrapper, page: AuthenticateWrapper),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    MyApp: (data) {
      var args = data.getArgs<MyAppArguments>(
        orElse: () => MyAppArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyApp(isFirstTime: args.isFirstTime),
        settings: data,
      );
    },
    MyHomePage: (data) {
      var args = data.getArgs<MyHomePageArguments>(
        orElse: () => MyHomePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MyHomePage(
          key: args.key,
          title: args.title,
        ),
        settings: data,
      );
    },
    AuthenticateWrapper: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AuthenticateWrapper(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// MyApp arguments holder class
class MyAppArguments {
  final bool isFirstTime;
  MyAppArguments({this.isFirstTime});
}

/// MyHomePage arguments holder class
class MyHomePageArguments {
  final Key key;
  final String title;
  MyHomePageArguments({this.key, this.title});
}
