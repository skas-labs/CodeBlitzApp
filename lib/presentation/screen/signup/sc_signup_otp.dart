import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:country_code_picker/country_code_picker.dart';
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
  String countryCode = "+91";
  String number = "";

  @override
  void initState() {
    super.initState();
    _signupBloc = BlocProvider.of<SignUpBloc>(context);
    _mobileController.addListener(onMobileChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (current, next) {
        return current != next;
      },
      listener: (context, state) {
        if (state is SignUpLoaded) {
          Navigator.pushNamed(context, AppRouter.SIGNUP_PHONE);
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
                  style: FONT_CONST.BOLD_WHITE_20,
                ),
              ),
              Text(
                "we sent an sms with a 4-digit code to ${(_signupBloc.state as SignUpLoaded).response.substring(9, 22)}",
                style: FONT_CONST.REGULAR_WHITE_16
                    .copyWith(color: COLOR_CONST.GREY),
              ),
              const Spacer(),
              UnicornButton(
                radius: 5,
                gradient: COLOR_CONST.GRADIENT_PRIMARY,
                onPressed: () {
                  _signupBloc.add(SendOtp(phone: number));
                },
                child: Text('verify now', style: FONT_CONST.BOLD_WHITE_20),
              )
            ],
          )),
    ));
  }

  void _onCountryChange(CountryCode code) {
    countryCode = code.toString();
  }

  void onMobileChanged() {
    number = countryCode + _mobileController.text;
    _signupBloc.add(NumberChanged(phone: number));
  }
}
