import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/screen/home/dashboard/bloc.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(OpenScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      // buildWhen: (previous, current) {
      //   return false;
      // },
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

  Widget _buildContent(DashboardState state) {
    if (state is DefaultState) {
      return Expanded(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 50),
            SizedBox(width:120,height: 100,child: WidgetLogoCodeBlitz()),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 60, bottom: 30,),
              child: Text("Fight a war", style: FONT_CONST.REGULAR_WHITE_20),
            ),
            NeumorphicContainer(
              insets: EdgeInsets.only(
                  right: 55, left: 55, top: 15, bottom: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0,top: 8,bottom: 8),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'enter war code',
                    hintStyle: FONT_CONST.MEDIUM_WHITE_18,
                    suffixIcon: Icon(Icons.content_copy,color: COLOR_CONST.WHITE),
                  ),
                  style: FONT_CONST.BOLD_WHITE_18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  right: 105, left: 105, top: 15),
              child: UnicornButton(
                  radius: 10,
                  gradient: COLOR_CONST.GRADIENT_PRIMARY,
                  child: Text('join a war', style: FONT_CONST.BOLD_WHITE_20),
                  onPressed: () {
                    BlocProvider.of<DashboardBloc>(context).add(JoinMatch(code : "hello"));
                  }),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top : 30, bottom: 30),
              child: Text("or", style: FONT_CONST.REGULAR_WHITE_20),
            ),
            Container(
              margin: const EdgeInsets.only(
                  right: 105, left: 105,bottom: 40),
              child:        UnicornOutlineButton(
                  strokeWidth: 1,
                  radius: 10,
                  gradient: COLOR_CONST.GRADIENT_PRIMARY,
                  child: UnicornText(
                    text: 'create a war',
                    style: FONT_CONST.BOLD_WHITE_20,
                    gradient: COLOR_CONST.GRADIENT_PRIMARY,
                  ),
                  onPressed: (){
                    BlocProvider.of<DashboardBloc>(context).add(CreateMatch());
                  }),
            ),
          ],
        ),
      );
    } else if (state is MatchLoaded) {
      //Todo : redirect to match
      return Expanded(
        child: Center(
          child: Text('Redirect to match'),
        ),
      );
    } else if (state is MatchLoading) {
      //Todo : Show dialog
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is MatchNotLoaded) {
      //Todo : Show not found dialog
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
