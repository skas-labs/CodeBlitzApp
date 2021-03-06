import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProfileScreen extends StatefulWidget {
  final int index;

  const ProfileScreen(this.index);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                _buildContent(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(ProfileState state) {
    if (state is ProfileLoaded) {
      return Expanded(
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
          },
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const UserItem(
                username: 'codechamp',
                displayName: 'Sid Jain',
                avatarUrl: 'https://via.placeholder.com/140x100',
                points: 700,
                insets: EdgeInsets.fromLTRB(30,0,30,30),
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
                      style: MyFonts.semiBold_12,
                    ),
                    Text(
                      "required",
                      style: MyFonts.semiBold_12,
                    ),
                    Text(
                      "next goal",
                      style: MyFonts.semiBold_12,
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
                          gradient: MyColors.GRADIENT_SECONDARY,
                          onPressed: null,
                          height: 30,
                          child: Text('Junior Dev'.toUpperCase(),
                              style: MyFonts.bold_14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 26.0, right: 26.0),
                      child: UnicornText(
                        text: "1300 CR",
                        style: MyFonts.extraBold_16,
                        gradient: MyColors.GRADIENT_PRIMARY,
                      ),
                    ),
                    Expanded(
                      child: UnicornButton(
                          radius: 10,
                          gradient: MyColors.GRADIENT_SECONDARY,
                          onPressed: null,
                          height: 30,
                          child: Text('Senior Dev'.toUpperCase(),
                              style: MyFonts.bold_14)),
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
                  linearGradient: MyColors.GRADIENT_SECONDARY,
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
                          style: MyFonts.extraBold_22.copyWith(
                            foreground: Paint()
                              ..shader = MyColors.GRADIENT_BLUE.createShader(
                                  (const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "\nFOLLOWING",
                                style: MyFonts.regular_10),
                          ]),
                    ),
                    Container(
                      height: 60,
                      child: VerticalDivider(
                        color: MyColors.DIVIDER,
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '10.3K',
                          style: MyFonts.extraBold_22.copyWith(
                            foreground: Paint()
                              ..shader = MyColors.GRADIENT_BLUE.createShader(
                                  (const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "\nCODE WARS",
                                style: MyFonts.regular_10),
                          ]),
                    ),
                    Container(
                      height: 60,
                      child: VerticalDivider(
                        color: MyColors.DIVIDER,
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '1.5K',
                          style: MyFonts.extraBold_22.copyWith(
                            foreground: Paint()
                              ..shader = MyColors.GRADIENT_BLUE.createShader(
                                  (const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: "\nFOLLOWERS",
                                style: MyFonts.regular_10),
                          ]),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: Text("statistics", style: MyFonts.bold_16),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProgressWithText(
                        progress: 0.45,
                        primaryText: "70%",
                        secondaryText: "WINS"),
                    const ProgressWithText(
                        progress: 0.15,
                        primaryText: "10%",
                        secondaryText: "DRAWS"),
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
        ),
      );
    } else if (state is ProfileLoading) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ProfileNotLoaded) {
      return const Expanded(
        child: Center(
          child: Text('Cannot load data'),
        ),
      );
    } else {
      return const Expanded(
        child: Center(
          child: Text('Unknown state'),
        ),
      );
    }
  }
}
