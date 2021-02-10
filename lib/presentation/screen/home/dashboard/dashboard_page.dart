import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/router.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          if (state is MatchLoaded) {
            Navigator.pushNamed(context, AppRouter.GAME,
                arguments: state.response['matchId']);
          }

          final snackBar = SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                _buildContent(),
              ],
            ),
          ),
        ));
  }

  Widget _buildContent() {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 20),
          SizedBox(width: 120, height: 100, child: WidgetLogoCodeBlitz()),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 20,
            ),
            child: Text("fight a war", style: MyFonts.regular_20),
          ),
          NeumorphicContainer(
            insets:
                const EdgeInsets.only(right: 55, left: 55, top: 15, bottom: 30),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8, bottom: 8),
              child: TextField(
                keyboardType: TextInputType.phone,
                autocorrect: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'enter war code',
                  hintStyle: MyFonts.medium_18,
                  suffixIcon:
                      Icon(Icons.content_copy, color: MyColors.WHITE),
                ),
                style: MyFonts.bold_18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 105, left: 105, top: 15),
            child: UnicornButton(
              radius: 10,
              gradient: MyColors.GRADIENT_PRIMARY,
              onPressed: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(const JoinMatch(code: "hello"));
              },
              child: Text('join a war', style: MyFonts.bold_20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Text("or", style: MyFonts.regular_20),
          ),
          Container(
            margin: const EdgeInsets.only(right: 105, left: 105, bottom: 40),
            child: UnicornOutlineButton(
                strokeWidth: 1,
                radius: 10,
                gradient: MyColors.GRADIENT_PRIMARY,
                onPressed: () {
                  BlocProvider.of<DashboardBloc>(context).add(CreateMatch());
                },
                child: UnicornText(
                  text: 'create a war',
                  style: MyFonts.bold_20,
                  gradient: MyColors.GRADIENT_PRIMARY,
                )),
          ),
        ],
      ),
    );
  }
}
