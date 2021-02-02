import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PlayerScreen extends StatelessWidget {
  int id;

  PlayerScreen({@required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30),
            child: Row(children: [
              const NeumorphicBackButton(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("profile",
                      textAlign: TextAlign.left,
                      style: FONT_CONST.MEDIUM_WHITE_22),
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.add,color: HexColor('#C4C4C4')),
                itemBuilder: (BuildContext context) {
                  return ["Hello"].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
            ]),
          ),
          const UserItem(
            username: 'chamionswimmer',
            displayName: 'Arnav Gupta',
            avatarUrl: 'https://via.placeholder.com/140x100',
            points: 700,
          ),
          Row(children: [
            NeumorphicContainer(
              insets: const EdgeInsets.only(left: 30, bottom: 30),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                child: Text("follow",
                    textAlign: TextAlign.center,
                    style: FONT_CONST.BOLD_WHITE_18),
              ),
            ),
            Expanded(
              child: NeumorphicContainer(
                insets: const EdgeInsets.only(left: 20, right: 30, bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 14, 30, 14),
                  child: Text("invite for war",
                      textAlign: TextAlign.center,
                      style: FONT_CONST.BOLD_WHITE_18),
                ),
              ),
            )
          ]),
          CustomDivider(),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "current title",
                  style: FONT_CONST.SEMIBOLD_WHITE_12,
                ),
                Text(
                  "required",
                  style: FONT_CONST.SEMIBOLD_WHITE_12,
                ),
                Text(
                  "next goal",
                  style: FONT_CONST.SEMIBOLD_WHITE_12,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: UnicornButton(
                      radius: 10,
                      gradient: COLOR_CONST.GRADIENT_SECONDARY,
                      onPressed: null,
                      height: 30,
                      child: Text('Junior Dev'.toUpperCase(),
                          style: FONT_CONST.BOLD_WHITE_14)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                  child: UnicornText(
                    text: "1300 CR",
                    style: FONT_CONST.EXTRABOLD_WHITE_16,
                    gradient: COLOR_CONST.GRADIENT_PRIMARY,
                  ),
                ),
                Expanded(
                  child: UnicornButton(
                      radius: 10,
                      gradient: COLOR_CONST.GRADIENT_SECONDARY,
                      onPressed: null,
                      height: 30,
                      child: Text('Senior Dev'.toUpperCase(),
                          style: FONT_CONST.BOLD_WHITE_14)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: LinearPercentIndicator(
              animation: true,
              lineHeight: 10.0,
              animationDuration: 2500,
              percent: 0.8,
              linearStrokeCap: LinearStrokeCap.roundAll,
              linearGradient: COLOR_CONST.GRADIENT_SECONDARY,
            ),
          ),
          CustomDivider(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: '10.3K',
                      style: FONT_CONST.EXTRABOLD_WHITE_22.copyWith(
                        foreground: Paint()
                          ..shader = COLOR_CONST.GRADIENT_BLUE.createShader(
                              (const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\nFOLLOWING",
                            style: FONT_CONST.REGULAR_WHITE_10),
                      ]),
                ),
                Container(
                  height: 60,
                  child: VerticalDivider(
                    color: COLOR_CONST.DIVIDER,
                    width: 2,
                    thickness: 2,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: '10.3K',
                      style: FONT_CONST.EXTRABOLD_WHITE_22.copyWith(
                        foreground: Paint()
                          ..shader = COLOR_CONST.GRADIENT_BLUE.createShader(
                              (const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\nCODE WARS",
                            style: FONT_CONST.REGULAR_WHITE_10),
                      ]),
                ),
                Container(
                  height: 60,
                  child: VerticalDivider(
                    color: COLOR_CONST.DIVIDER,
                    width: 2,
                    thickness: 2,
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: '1.5K',
                      style: FONT_CONST.EXTRABOLD_WHITE_22.copyWith(
                        foreground: Paint()
                          ..shader = COLOR_CONST.GRADIENT_BLUE.createShader(
                              (const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "\nFOLLOWERS",
                            style: FONT_CONST.REGULAR_WHITE_10),
                      ]),
                ),
              ],
            ),
          ),
          CustomDivider(),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
            child: Text("statistics", style: FONT_CONST.BOLD_WHITE_16),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ProgressWithText(
                    progress: 0.45, primaryText: "70%", secondaryText: "WINS"),
                const ProgressWithText(
                    progress: 0.15, primaryText: "10%", secondaryText: "DRAWS"),
                const ProgressWithText(
                    progress: 0.20,
                    primaryText: "20%",
                    secondaryText: "LOSSES"),
              ],
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}
