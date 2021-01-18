import 'package:code_blitz/model/repo/home_repository.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'profile/profile_page.dart';
import 'widget_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = <Widget>[ProfileScreen()];

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  ProfileBloc(homeRepository: HomeRepository()))
        ],
        child: Scaffold(
          extendBody: true,
          body: pages[index],
          bottomNavigationBar: TabBarMaterialWidget(
            index: index,
            onChangedTab: onChangedTab,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => print('Hello World'),
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
