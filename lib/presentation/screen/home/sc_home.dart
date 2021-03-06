import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/custom_ui/custom_ui.dart';
import 'package:code_blitz/presentation/screen/home/dashboard/bloc.dart';
import 'package:code_blitz/presentation/screen/home/friends/bloc.dart';
import 'package:code_blitz/presentation/screen/home/leadboard/leaderboard_page.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard/dashboard_page.dart';
import 'friends/friends_page.dart';
import 'profile/profile_page.dart';
import 'widget_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final heading = ["", "leaderboard", "my profile", "friends"];

  List<Widget> pages(int index) => <Widget>[
        DashboardScreen(),
        LeaderboardScreen(),
        ProfileScreen(index),
        FriendsScreen()
      ];

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          //Todo : add event if tab is selected
          BlocProvider(
              create: (context) => ProfileBloc(homeRepository: context.read())),
          BlocProvider(
              create: (context) =>
                  DashboardBloc(homeRepository: context.read())),
          BlocProvider(
              create: (context) =>
                  FriendsBloc(homeRepository: context.read())),
        ],
        child: Scaffold(
          extendBody: true,
          body: SafeArea(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NeumorphicContainer(
                    child: IconButton(
                      icon: Image.asset(
                        "images/ic_settings.png",
                        height: 28,
                        width: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Text(heading[index], style: MyFonts.bold_20),
                  NeumorphicContainer(
                    child: IconButton(
                      icon: Image.asset(
                        "images/ic_settings.png",
                        height: 28,
                        width: 28,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            //Indexed Stack prevent rebuild of pages on tab change
            Expanded(child: IndexedStack(index: index, children: pages(index)))
          ])),
          resizeToAvoidBottomPadding: false,
          bottomNavigationBar: TabBarMaterialWidget(
            index: index,
            onChangedTab: onChangedTab,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('Hello World'),
            child: Container(
                width: 60,
                height: 60,
                // This is needed for child height weight to work
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: MyColors.GRADIENT_PRIMARY),
                child: MySvgImage(
                  path: 'assets/thunderbolt.svg',
                  height: 30,
                  width: 30,
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
