import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class SignUpPhoneScreen extends StatefulWidget {
  @override
  _SignUpPhoneScreenState createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
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
      listener: (context, state) {
        if (state is OtpSent) {
          Navigator.pushNamed(context, AppRouter.SIGNUP_OTP);
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
                  "enter phone number",
                  style: MyFonts.bold_20,
                ),
              ),
              Text(
                "win code wars to become the ultimate champion!!",
                style: MyFonts.regular_16
                    .copyWith(color: MyColors.GREY),
              ),
              NeumorphicContainer(
                insets: const EdgeInsets.only(top: 44),
                isFlat: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 8.0, bottom: 8.0, right: 15.0),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        flagWidth: 17,
                        textStyle: MyFonts.bold_16,
                        onChanged: _onCountryChange,
                        initialSelection: 'IN',
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '',
                          ),
                          style: MyFonts.bold_16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              UnicornButton(
                radius: 5,
                gradient: MyColors.GRADIENT_PRIMARY,
                onPressed: () {
                  _signupBloc.add(SendOtp(phone: number));
                },
                child: Text('continue', style: MyFonts.bold_20),
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
