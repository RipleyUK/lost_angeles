import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  navigateTo(String routeName, [Object args]) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: args);
  }

  pop() {
    navigatorKey.currentState.pop();
  }

  popUntil(String routeName) {
    navigatorKey.currentState.popUntil(ModalRoute.withName(routeName));
  }
}
