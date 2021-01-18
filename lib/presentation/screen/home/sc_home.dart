import 'package:code_blitz/presentation/screen/splash/sc_splash.dart';
import 'package:flutter/material.dart';

import 'widget_tab_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = <Widget>[
    SplashScreen()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
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
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
