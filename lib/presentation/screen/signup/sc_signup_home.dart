import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import '../../router.dart';

class SignUpHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 120, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: UnicornText(
                  text: "code\nblitz",
                  gradient: MyColors.GRADIENT_PRIMARY,
                  style: MyFonts.regular_48.copyWith(height: 0.8)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "welcome",
                style: MyFonts.bold_24,
              ),
            ),
            Text(
              "win code wars to become the ultimate champion!!",
              style: MyFonts.medium_22,
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: CustomDivider(hasMargin: true)),
            ),
            Text(
              "continue with",
              style: MyFonts.medium_16,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: UnicornButton(
                  radius: 5,
                  gradient: MyColors.GRADIENT_PRIMARY,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.SIGNUP_PHONE);
                  },
                  child: Text('phone number', style: MyFonts.bold_20)),
            ),
          ],
        ),
      ),
    );
  }
}
