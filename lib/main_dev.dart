import 'package:code_blitz/app_config.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "CodeBlitz Dev",
      debugTag: true,
      flavorName: "dev",
      initialRoute: AppRouter.HOME,
      child: MyApp.runWidget(),
    ),
  );
}