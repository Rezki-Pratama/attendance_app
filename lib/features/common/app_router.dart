import 'package:attendance_app/features/common/routes.dart';
import 'package:attendance_app/features/screens/main_screen/main_screen.dart';
import 'package:attendance_app/features/screens/map_screen/map_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case Routes.mapRoute:
        return MaterialPageRoute(builder: (_) => const MapScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
