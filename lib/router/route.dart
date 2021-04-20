import 'package:flutter/material.dart';
import 'package:todo/presentation/pages/screen/detailscreen.dart';
import 'package:todo/presentation/pages/screen/todoscreen.dart';

class AccessRouter {
  Route<MaterialPageRoute> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (newctx) => TodoScreen(),
          // settings: settings
        );
        break;

      case '/addTask':
        return MaterialPageRoute(
          builder: (newctx) => DetailScreen(),
          // settings: settings
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (newctx) => TodoScreen(),
          // settings: settings
        );
        break;
    }
  }
}
