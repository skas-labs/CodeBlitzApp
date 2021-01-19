import 'package:code_blitz/app/auth_bloc/bloc.dart';
import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    onPressed: openSignUp),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: UnicornButton(
                      radius: 5,
                      gradient: COLOR_CONST.GRADIENT_PRIMARY,
                      child: Text('login now', style: FONT_CONST.BOLD_WHITE_20),
                      onPressed: () => {
                            BlocProvider.of<AuthenticationBloc>(context)
                                .add(LoggedIn()),
                          }),
                )
              ],
            ),
          )),
    );
  }

  void openSignUp() {
    Navigator.pushNamed(context, AppRouter.SIGNUP);
  }
}
