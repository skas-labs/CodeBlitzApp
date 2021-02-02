import 'package:code_blitz/presentation/screen/player/sc_player.dart';
import 'package:flutter/material.dart';

import 'screen/home/sc_home.dart';
import 'screen/login/sc_login.dart';
import 'screen/signup/sc_signup_home.dart';
import 'screen/signup/sc_signup_otp.dart';
import 'screen/signup/sc_signup_phone.dart';
import 'screen/splash/sc_splash.dart';

class AppRouter {
  static const String HOME = '/home';
  static const String SPLASH = '/splash';
  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';
  static const String SIGNUP_PHONE = '/signup_phone';
  static const String SIGNUP_OTP = '/signup_otp';
  static const String PLAYER = '/player';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME:
        return _createRoute(HomeScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN:
        return _createRoute(LoginScreen());
      case SIGNUP:
        return _createRoute(SignUpHomeScreen());
      case SIGNUP_PHONE:
        return _createRoute(SignUpPhoneScreen());
      case SIGNUP_OTP:
        return _createRoute(SignUpOtpScreen());
      case PLAYER:
        final id = settings.arguments as int;
        return _createRoute(PlayerScreen(id: id));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static PageRouteBuilder<dynamic> _createRoute(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        final end = Offset.zero;
        final curve = Curves.ease;

        final tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
