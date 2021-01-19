import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class SignUpPhoneScreen extends StatefulWidget {
  @override
  _SignUpPhoneScreenState createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.fromLTRB(30, 60, 30, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeumorphicContainer(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                    color: COLOR_CONST.WHITE,
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
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
                    child: TextField(
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
                    child:
                        Text('continue', style: FONT_CONST.BOLD_WHITE_20),
                    onPressed: () {})
              ],
            )));
  }
}
