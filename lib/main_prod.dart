import 'package:code_blitz/app_config.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "CodeBlitz",
      debugTag: false,
      flavorName: "prod",
      initialRoute: AppRouter.SPLASH,
      child: MyApp.runWidget(),
    ),
  );
}