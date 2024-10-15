import 'package:flutter/material.dart';

class RouteObserver extends NavigatorObserver {
  String currentRoute = "";

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    currentRoute = route.settings.name ?? "";
    print('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    currentRoute = previousRoute?.settings.name ?? "";
    print('Route popped, back to: $currentRoute');
  }
}
