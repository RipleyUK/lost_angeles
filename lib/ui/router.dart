import 'package:flutter/material.dart';
import 'package:lost_angeles/ui/views/jobs_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/jobs':
        return MaterialPageRoute(
            builder: (_) => JobsView(), settings: RouteSettings(name: '/jobs'));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
