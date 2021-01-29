import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
              SizedBox(height: 100),
              SizedBox(width:100,height: 70,child: WidgetLogoCodeBlitz()),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 60, bottom: 30,),
                child: Text("Fight a war", style: FONT_CONST.REGULAR_WHITE_20),
              ),
              NeumorphicContainer(
                insets: EdgeInsets.only(
                    right: 55, left: 55, top: 15, bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'enter war code',
                      hintStyle: FONT_CONST.BOLD_WHITE_16,
                      suffixIcon: Icon(Icons.content_copy),
                    ),
                    style: FONT_CONST.BOLD_WHITE_16,
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
                    }),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top : 30, bottom: 30),
                child: Text("or", style: FONT_CONST.REGULAR_WHITE_20),
              ),
              Container(
                margin: const EdgeInsets.only(
                    right: 105, left: 105),
                child:        UnicornOutlineButton(
                    strokeWidth: 1,
                    radius: 10,
                    gradient: COLOR_CONST.GRADIENT_PRIMARY,
                    child: UnicornText(
                      text: 'create a war',
                      style: FONT_CONST.BOLD_WHITE_20,
                      gradient: COLOR_CONST.GRADIENT_PRIMARY,
                    ),
                    onPressed: (){}),
              ),
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
