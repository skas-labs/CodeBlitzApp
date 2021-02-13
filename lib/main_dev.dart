import 'dart:io';

import 'package:code_blitz/app_config.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  MyApp.initSystemDefault();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    AppConfig(
      appName: "CodeBlitz Dev",
      debugTag: true,
      flavorName: "dev",
      initialRoute: AppRouter.SPLASH,
      child: MyApp.runWidget(),
    ),
  );
}
