import 'package:flutter/material.dart';

import 'screen/home/sc_home.dart';
import 'screen/login/sc_login.dart';
import 'screen/signup/sc_signup_home.dart';
import 'screen/signup/sc_signup_phone.dart';
import 'screen/splash/sc_splash.dart';

class AppRouter {
  static const String HOME = '/home';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';
  static const String SIGNUP_PHONE = '/signup_phone';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SIGNUP:
        return MaterialPageRoute(builder: (_) => SignUpHomeScreen());
      case SIGNUP_PHONE:
        return MaterialPageRoute(builder: (_) => SignUpPhoneScreen());
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
