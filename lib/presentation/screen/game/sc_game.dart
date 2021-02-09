import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GameScreen extends StatefulWidget {
  String id;

  GameScreen({@required this.id});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: COLOR_CONST.PRIMARY,
          child: const Center(
            child: Waiting(),
          )),
    );
  }
}

class Waiting extends StatelessWidget {
  const Waiting({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/140x100')),
            ),
            UnicornText(
              text: "Sid Jain",
              style: FONT_CONST.EXTRABOLD_WHITE_20,
              gradient: COLOR_CONST.GRADIENT_PRIMARY,
              overflow: TextOverflow.ellipsis,
              align: TextAlign.center,
              maxLines: 1,
            ),
            Text(
              "@codechamp • 700 CR",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  FONT_CONST.MEDIUM_WHITE_16.copyWith(color: COLOR_CONST.WHITE),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 150,
                height: 50,
                child: UnicornButton(
                    radius: 10,
                    gradient: COLOR_CONST.GRADIENT_SECONDARY,
                    onPressed: null,
                    height: 30,
                    child: Text('Junior Dev'.toUpperCase(),
                        style: FONT_CONST.BOLD_WHITE_16)),
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            NeumorphicContainer(
                isFlat: true, child: CustomDivider(hasMargin: true, height: 5)),
            NeumorphicContainer(
                insets: const EdgeInsets.only(top: 30, bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: UnicornText(
                    text: 'code\nblitz.',
                    style: FONT_CONST.BOLD_WHITE_54.copyWith(height: 0.8),
                    gradient: COLOR_CONST.GRADIENT_PRIMARY,
                  ),
                )),
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/140x100')),
            ),
            UnicornText(
              text: "Sid Jain",
              style: FONT_CONST.EXTRABOLD_WHITE_20,
              gradient: COLOR_CONST.GRADIENT_PRIMARY,
              overflow: TextOverflow.ellipsis,
              align: TextAlign.center,
              maxLines: 1,
            ),
            Text(
              "@codechamp • 700 CR",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  FONT_CONST.MEDIUM_WHITE_16.copyWith(color: COLOR_CONST.WHITE),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 150,
                height: 50,
                child: UnicornButton(
                    radius: 10,
                    gradient: COLOR_CONST.GRADIENT_SECONDARY,
                    onPressed: null,
                    height: 30,
                    child: Text('Junior Dev'.toUpperCase(),
                        style: FONT_CONST.BOLD_WHITE_16)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Game extends StatelessWidget {
  const Game({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        LinearPercentIndicator(
          animation: true,
          lineHeight: 6.0,
          animationDuration: 2500,
          percent: 0.8,
          linearStrokeCap: LinearStrokeCap.roundAll,
          linearGradient: COLOR_CONST.GRADIENT_SECONDARY,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            "time left: 08",
            textAlign: TextAlign.center,
            style: FONT_CONST.BOLD_WHITE_14.copyWith(color: COLOR_CONST.BLUE),
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CircularPercentIndicator(
                    lineWidth: 4.0,
                    animation: true,
                    radius: 80.0,
                    animationDuration: 2500,
                    percent: 0.4,
                    linearGradient: COLOR_CONST.GRADIENT_RED,
                    center: const CircleAvatar(
                        radius: 36,
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/140x100')),
                  ),
                  Text(
                    "@codechamp",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FONT_CONST.BOLD_WHITE_16
                        .copyWith(color: COLOR_CONST.WHITE),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Container(
                  width: 45,
                  height: 45,
                  // This is needed for child height weight to work
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: COLOR_CONST.GRADIENT_RED),
                  child: MySvgImage(
                    path: 'assets/thunderbolt.svg',
                    height: 20,
                    width: 20,
                  )),
              Column(
                children: [
                  CircularPercentIndicator(
                    lineWidth: 4.0,
                    animation: true,
                    radius: 80.0,
                    animationDuration: 2500,
                    percent: 0.4,
                    linearGradient: COLOR_CONST.GRADIENT_RED,
                    center: const CircleAvatar(
                        radius: 36,
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/140x100')),
                  ),
                  Text(
                    "@codechamp",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FONT_CONST.BOLD_WHITE_16
                        .copyWith(color: COLOR_CONST.WHITE),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
        NeumorphicContainer(
            isFlat: true, child: CustomDivider(hasMargin: true, height: 5)),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 30),
          child: Text(
            "Which tag is used to define an internal style sheet?",
            style: FONT_CONST.BOLD_WHITE_20.copyWith(color: COLOR_CONST.WHITE),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 300,
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            padding: const EdgeInsets.all(20.0),
            mainAxisSpacing: 22.0,
            crossAxisSpacing: 22.0,
            children: [
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      side: BorderSide(color: COLOR_CONST.GREY_DARK)),
                  child: Text(
                    'css',
                    textAlign: TextAlign.center,
                    style: FONT_CONST.BOLD_WHITE_20
                        .copyWith(color: COLOR_CONST.GREY_DARK),
                  )),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      side: BorderSide(color: COLOR_CONST.GREY_DARK)),
                  child: Text(
                    'css',
                    textAlign: TextAlign.center,
                    style: FONT_CONST.BOLD_WHITE_20
                        .copyWith(color: COLOR_CONST.GREY_DARK),
                  )),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      side: BorderSide(color: COLOR_CONST.GREY_DARK)),
                  child: Text(
                    'css',
                    textAlign: TextAlign.center,
                    style: FONT_CONST.BOLD_WHITE_20
                        .copyWith(color: COLOR_CONST.GREY_DARK),
                  )),
              FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                      side: BorderSide(color: COLOR_CONST.GREY_DARK)),
                  child: Text(
                    'css',
                    textAlign: TextAlign.center,
                    style: FONT_CONST.BOLD_WHITE_20
                        .copyWith(color: COLOR_CONST.GREY_DARK),
                  )),

            ],
          ),
        ),
      ],
    );
  }
}