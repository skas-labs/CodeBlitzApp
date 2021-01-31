import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
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
        final snackBar = SnackBar(
          content: Text('Yay! A SnackBar!'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);

      },
      child: Container(
          margin: EdgeInsets.fromLTRB(30, 60, 30, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NeumorphicBackButton(),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  "enter phone number",
                  style: FONT_CONST.BOLD_WHITE_20,
                ),
              ),
              Text(
                "win code wars to become the ultimate champion!!",
                style: FONT_CONST.REGULAR_WHITE_16
                    .copyWith(color: COLOR_CONST.GREY),
              ),
              NeumorphicContainer(
                insets: EdgeInsets.only(top: 44),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 8.0, bottom: 8.0, right: 15.0),
                  child: TextFormField(
                    controller: _mobileController,
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                    ),
                    style: FONT_CONST.BOLD_WHITE_16,
                  ),
                ),
              ),
              Spacer(),
              UnicornButton(
                  radius: 5,
                  gradient: COLOR_CONST.GRADIENT_PRIMARY,
                  child: Text('continue', style: FONT_CONST.BOLD_WHITE_20),
                  onPressed: () {
                    _signupBloc.add(SendOtp(phone: _mobileController.text));
                  })
            ],
          )),
    ));
  }

  void onMobileChanged() {
    _signupBloc.add(NumberChanged(phone: _mobileController.text));
  }
}
