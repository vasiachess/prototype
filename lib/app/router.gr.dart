// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stackedprototype/ui/views/home/home_view.dart';
import 'package:stackedprototype/ui/views/post_list/post_list_view.dart';

abstract class Routes {
  static const homeViewRoute = '/';
  static const postListView = '/post-list-view';
  static const all = {
    homeViewRoute,
    postListView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeViewRoute:
        if (hasInvalidArgs<HomeViewArguments>(args)) {
          return misTypedArgsRoute<HomeViewArguments>(args);
        }
        final typedArgs = args as HomeViewArguments ?? HomeViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(key: typedArgs.key),
          settings: settings,
        );
      case Routes.postListView:
        if (hasInvalidArgs<PostListViewArguments>(args)) {
          return misTypedArgsRoute<PostListViewArguments>(args);
        }
        final typedArgs =
            args as PostListViewArguments ?? PostListViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => PostListView(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({this.key});
}

//PostListView arguments holder class
class PostListViewArguments {
  final Key key;
  PostListViewArguments({this.key});
}
