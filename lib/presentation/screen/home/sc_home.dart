import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          // color: COLOR_CONST.WHITE,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[Text("Hello World")],
          ),
        ),
      ),
    );
  }
}
