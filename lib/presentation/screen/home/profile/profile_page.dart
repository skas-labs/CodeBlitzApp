import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _buildContent(state),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(ProfileState state) {
    if (state is ProfileNotLoaded) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
          },
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              UserItem(
                username: 'codechamp',
                displayName: 'Sid Jain',
                avatarUrl: 'https://via.placeholder.com/140x100',
                points: 700,
              ),
              CustomDivider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 30, bottom: 12),
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
                          child: Text('Junior Dev'.toUpperCase(),
                              style: FONT_CONST.BOLD_WHITE_14),
                          onPressed: null,
                          height: 30),
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
                          child: Text('Senior Dev'.toUpperCase(),
                              style: FONT_CONST.BOLD_WHITE_14),
                          onPressed: null,
                          height: 30),
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
                                  (new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
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
                                  (new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
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
                                  (new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
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
                    ProgressWithText(
                        progress: 0.45,
                        primaryText: "70%",
                        secondaryText: "WINS"),
                    ProgressWithText(
                        progress: 0.15,
                        primaryText: "10%",
                        secondaryText: "DRAWS"),
                    ProgressWithText(
                        progress: 0.20,
                        primaryText: "20%",
                        secondaryText: "LOSSES"),
                  ],
                ),
              ),
              CustomDivider(),
            ],
          ),
        ),
      );
    } else if (state is ProfileLoading) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ProfileNotLoaded) {
      return Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    } else {
      return Expanded(
        child: Center(
          child: Text('Unknown state'),
        ),
      );
    }
  }
}
