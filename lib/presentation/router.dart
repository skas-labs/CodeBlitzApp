import 'package:flutter/material.dart';

import 'screen/home/sc_home.dart';

class AppRouter {
  static const String HOME = '/home';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      // case SPLASH:
      //   return MaterialPageRoute(builder: (_) => SplashScreen());
      // case LOGIN:
      //   return MaterialPageRoute(builder: (_) => LoginScreen());
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
