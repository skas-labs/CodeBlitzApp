import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: COLOR_CONST.PRIMARY,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: SizedBox(
                      width: 240,
                      child: WidgetLogoCodeBlitz(),
                    ),
                  ),
                ),
                UnicornOutlineButton(
                    strokeWidth: 1,
                    radius: 5,
                    gradient: COLOR_CONST.GRADIENT_PRIMARY,
                    child: UnicornText(
                      text: 'continue as guest',
                      style: FONT_CONST.BOLD_WHITE_20,
                      gradient: COLOR_CONST.GRADIENT_PRIMARY,
                    ),
                    onPressed: null),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: UnicornButton(
                      radius: 5,
                      gradient: COLOR_CONST.GRADIENT_PRIMARY,
                      child: Text('login now', style: FONT_CONST.BOLD_WHITE_20),
                      onPressed: null),
                )
              ],
            ),
          )),
    );
  }

  void openLogin() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, AppRouter.LOGIN);
    });
  }
}
