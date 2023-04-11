import 'package:flutter/material.dart';
import 'package:template/src/app/pages/overview/overview_view.dart';
import 'package:template/src/app/utils/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) : _router = AppRouter();
  final AppRouter _router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Template',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: OverviewPage.route,
      onGenerateRoute: _router.getRoute,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        _router.routeObserver,
      ],
    );
  }
}
