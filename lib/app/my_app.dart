import 'package:code_blitz/app_config.dart';
import 'package:code_blitz/presentation/screen/home/sc_home.dart';
import 'package:code_blitz/presentation/screen/splash/sc_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../presentation/router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return MaterialApp(
      debugShowCheckedModeBanner: config.debugTag,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      home: SplashScreen(),
    );
  }

  static void initSystemDefault() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(0, 0, 0, 0),
      ),
    );
  }

  static Widget runWidget() {
    WidgetsFlutterBinding.ensureInitialized();

    return MyApp();
  }
}
