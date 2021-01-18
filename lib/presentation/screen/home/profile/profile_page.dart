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
                    const Text(
                      "current title",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "required",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "next goal",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1300 CR",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: LinearPercentIndicator(
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2500,
                  percent: 0.8,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  progressColor: Colors.green,
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
                          style: TextStyle(
                              color: COLOR_CONST.PRIMARY,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "\nFollowers",
                            ),
                          ]),
                    ),
                    Container(
                      height: 60,
                      child: VerticalDivider(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '10.3K',
                          style: TextStyle(
                              color: COLOR_CONST.PRIMARY,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "\nFollowers",
                            ),
                          ]),
                    ),
                    Container(
                      height: 60,
                      child: VerticalDivider(
                        color: const Color.fromRGBO(243, 243, 243, 1),
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '10.3K',
                          style: TextStyle(
                              color: COLOR_CONST.PRIMARY,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            const TextSpan(
                              text: "\nFollowers",
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: Text("statistics",
                    style: Theme.of(context).textTheme.headline6),
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
