import 'package:flutter/material.dart';
import 'package:template/src/app/pages/overview/overview_view.dart';
import 'package:template/src/app/pages/todos/todos_view.dart';

class AppRouter {
  AppRouter() : routeObserver = RouteObserver<PageRoute>();
  final RouteObserver<PageRoute> routeObserver;
  Route<dynamic>? getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case OverviewPage.route:
        return _buildRoute(false, routeSettings, const OverviewPage());
      // case TodosPage.route:
      //   return _buildRoute(false, routeSettings, const TodosPage());
      default:
        return null;
    }
  }
}

MaterialPageRoute _buildRoute(
  bool disableBack,
  RouteSettings settings,
  Widget builder,
) =>
    MaterialPageRoute(
      settings: settings,
      builder: (_) => WillPopScope(
        onWillPop: (() async => disableBack),
        child: builder,
      ),
    );
