import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class SignUpOtpScreen extends StatefulWidget {
  @override
  _SignUpOtpScreenState createState() => _SignUpOtpScreenState();
}

class _SignUpOtpScreenState extends State<SignUpOtpScreen> {
  final TextEditingController _mobileController = TextEditingController();
  SignUpBloc _signupBloc;
  Map response;

  @override
  void initState() {
    super.initState();
    _signupBloc = BlocProvider.of<SignUpBloc>(context);
    response = (_signupBloc.state as OtpSent).response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
          listenWhen: (current, next) {
            return current != next;
          },
          listener: (context, state) {
            if (state is OtpVerified) {
              if (state.response.containsValue("true")) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRouter.HOME, (r) => false);
              }
            }
          },
          child: Container(
              margin: const EdgeInsets.fromLTRB(30, 60, 30, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NeumorphicBackButton(),
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      "enter the 4 digit code",
                      style: MyFonts.bold_20,
                    ),
                  ),
                  Text(
                    "we sent an sms with a 4-digit code to ${response['phno']}",
                    style: MyFonts.regular_16
                        .copyWith(color: MyColors.GREY),
                  ),
                  const Spacer(),
                  UnicornButton(
                    radius: 5,
                    gradient: MyColors.GRADIENT_PRIMARY,
                    onPressed: () {
                      response.addAll({"otp": "0000"});
                      _signupBloc.add(VerifyOtp(body: response));
                    },
                    child: Text('verify now', style: MyFonts.bold_20),
                  )
                ],
              )),
        ));
  }
}
