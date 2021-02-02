import 'package:code_blitz/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:code_blitz/presentation/screen/home/profile/bloc.dart';
import 'package:code_blitz/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int currentTabIndex = 0;

  @override
  void initState() {
    _controller = TabController(
      length: 2,
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        currentTabIndex = _controller.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              child: Column(
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
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
        },
        child: Column(
          children: <Widget>[
            _buildTabs(),
            CustomDivider(),
            _buildList(state)
          ],
        ),
      ),
    );
  }

  Widget _buildList(ProfileState state) {
    if (state is ProfileNotLoaded) {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
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

  DefaultTabController _buildTabs() {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              controller: _controller,
              tabs: <Widget>[
                Tab(
                  text: 'global',
                ),
                Tab(
                  text: 'college',
                ),
              ],
              onTap: (index) {},
              labelColor: COLOR_CONST.WHITE,
              labelStyle: FONT_CONST.BOLD_WHITE_18,
              unselectedLabelStyle: FONT_CONST.MEDIUM_WHITE_18,
            ),
          ),
        ));
  }
}
